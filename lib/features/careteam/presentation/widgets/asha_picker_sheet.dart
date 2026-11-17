import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/careteam/data/model/care_team_models.dart';
import 'package:sangwari_maa/features/careteam/presentation/providers/care_team_providers.dart';

/// Opens the picker and returns the chosen ASHA (null if dismissed).
/// [excludeId]: an ASHA that must not be offered (the primary, when picking a backup).
Future<AshaModel?> showAshaPickerSheet(
  BuildContext context, {
  required bool isBackup,
  String? excludeId,
  String? selectedId,
}) {
  return showModalBottomSheet<AshaModel>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg)),
    ),
    builder: (_) => AshaPickerSheet(isBackup: isBackup, excludeId: excludeId, selectedId: selectedId),
  );
}

class AshaPickerSheet extends ConsumerStatefulWidget {
  final bool isBackup;
  final String? excludeId;
  final String? selectedId;
  const AshaPickerSheet({super.key, required this.isBackup, this.excludeId, this.selectedId});

  @override
  ConsumerState<AshaPickerSheet> createState() => _AshaPickerSheetState();
}

class _AshaPickerSheetState extends ConsumerState<AshaPickerSheet> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  String _q = '';

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (mounted) setState(() => _q = value.trim());
    });
  }

  /// Flatten the three groups into one list: section headers + ASHAs.
  List<_SheetRow> _rows(AppLocalizations l10n, AshaOptionsResponse data) {
    final rows = <_SheetRow>[];
    void addGroup(String title, List<AshaModel> items) {
      final visible = items.where((a) => a.id != widget.excludeId).toList();
      if (visible.isEmpty) return;
      rows.add(_SheetRow.header(title));
      rows.addAll(visible.map(_SheetRow.asha));
    }

    addGroup(l10n.careTeamSectionVillage, data.village);
    addGroup(l10n.careTeamSectionShc, data.shc);
    addGroup(l10n.careTeamSectionResults, data.results);
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final options = ref.watch(ashaOptionsProvider(_q));
    final height = MediaQuery.of(context).size.height * 0.85;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.sm),
              child: Text(
                widget.isBackup ? l10n.careTeamPickerTitleBackup : l10n.careTeamPickerTitleAsha,
                style: AppTypography.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: TextField(
                controller: _controller,
                onChanged: _onChanged,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: l10n.careTeamSearchHint,
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE3D6D2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE3D6D2)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: options.when(
                loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2.5)),
                error: (_, __) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.careTeamLoadError, style: AppTypography.bodySmall),
                      TextButton(
                        onPressed: () => ref.invalidate(ashaOptionsProvider(_q)),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
                data: (data) {
                  final rows = _rows(l10n, data);
                  if (rows.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          _q.isEmpty ? l10n.careTeamSearchPrompt : l10n.careTeamNoResults,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall.copyWith(color: AppColors.hintText),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    itemCount: rows.length,
                    itemBuilder: (context, i) {
                      final row = rows[i];
                      if (row.header != null) return _SectionHeader(row.header!);
                      return _AshaTile(
                        asha: row.asha!,
                        selected: row.asha!.id == widget.selectedId,
                        onTap: () => Navigator.of(context).pop(row.asha),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetRow {
  final String? header;
  final AshaModel? asha;
  const _SheetRow._({this.header, this.asha});
  factory _SheetRow.header(String title) => _SheetRow._(header: title);
  factory _SheetRow.asha(AshaModel a) => _SheetRow._(asha: a);
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xs),
      child: Text(
        title.toUpperCase(),
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.hintText,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

class _AshaTile extends StatelessWidget {
  final AshaModel asha;
  final bool selected;
  final VoidCallback onTap;
  const _AshaTile({required this.asha, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lines = <String>[
      if ((asha.village ?? '').isNotEmpty) asha.village!,
      if ((asha.fatherHusbandName ?? '').isNotEmpty) l10n.careTeamFatherHusband(asha.fatherHusbandName!),
      if ((asha.mobile ?? '').isNotEmpty) asha.mobile!,
    ];
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFF9DAD6),
              child: Text(
                asha.initials,
                style: AppTypography.bodySmall.copyWith(
                  color: const Color(0xFFB5382A),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asha.name,
                    style: AppTypography.bodySmall.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  if (lines.isNotEmpty)
                    Text(
                      lines.join(' • '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontSize: 12),
                    ),
                ],
              ),
            ),
            if (selected) const Icon(Icons.check_circle, color: Color(0xFF2E7D4F)),
          ],
        ),
      ),
    );
  }
}
