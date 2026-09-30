import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/registration/data/model/village_model.dart';
import 'package:sangwari_maa/features/registration/presentation/provider/village_providers.dart';

/// Result handed back to the registration page when the sheet closes.
/// Exactly one of (village) or (notListedName) is set; both null means the
/// user dismissed the sheet without choosing anything.
class VillagePickResult {
  final VillageModel? village;
  final String? notListedName;
  const VillagePickResult({this.village, this.notListedName});
}

/// Read-only field that opens a searchable bottom sheet on tap — same
/// interaction pattern as the DOB/LMP date fields elsewhere on this page
/// (AppTextField(readOnly: true, onTap: ...)).
class VillagePickerField extends StatelessWidget {
  final String? displayText;
  final VoidCallback onTap;
  final String hint;

  const VillagePickerField({
    super.key,
    required this.displayText,
    required this.onTap,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.fieldFill,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                displayText?.isNotEmpty == true ? displayText! : hint,
                style: displayText?.isNotEmpty == true
                    ? AppTypography.bodyMedium
                    : AppTypography.hint,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.hintText),
          ],
        ),
      ),
    );
  }
}

/// Opens the search sheet. Call from the page:
///   final result = await showVillagePickerSheet(context, ref);
///   if (result != null) { setState(() { ... }); }
Future<VillagePickResult?> showVillagePickerSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<VillagePickResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg)),
    ),
    builder: (_) => const _VillageSearchSheet(),
  );
}

class _VillageSearchSheet extends ConsumerStatefulWidget {
  const _VillageSearchSheet();

  @override
  ConsumerState<_VillageSearchSheet> createState() => _VillageSearchSheetState();
}

class _VillageSearchSheetState extends ConsumerState<_VillageSearchSheet> {
  final _searchCtrl = TextEditingController();
  final _notListedCtrl = TextEditingController();
  Timer? _debounce;
  String _query = '';
  bool _showNotListedInput = false;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    _notListedCtrl.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _query = value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final searchAsync = _query.isEmpty
        ? null
        : ref.watch(villageSearchProvider(_query));

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.sm),
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: AppColors.greyBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: TextField(
                controller: _searchCtrl,
                autofocus: true,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: l10n.searchVillageHint,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.fieldFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _query.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(l10n.searchVillagePrompt, style: AppTypography.bodySmall),
                      ),
                    )
                  : searchAsync!.when(
                      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                      error: (e, _) => Center(
                        child: Text(l10n.villageSearchError, style: AppTypography.bodySmall),
                      ),
                      data: (villages) => villages.isEmpty
                          ? Center(
                              child: Text(l10n.noVillagesFound, style: AppTypography.bodySmall),
                            )
                          : ListView.builder(
                              itemCount: villages.length,
                              itemBuilder: (_, i) {
                                final v = villages[i];
                                return ListTile(
                                  title: Text(v.name, style: AppTypography.bodyMedium),
                                  subtitle: v.shcName != null
                                      ? Text(v.shcName!, style: AppTypography.bodySmall)
                                      : null,
                                  onTap: () => Navigator.of(context)
                                      .pop(VillagePickResult(village: v)),
                                );
                              },
                            ),
                    ),
            ),
            const Divider(height: 1),
            if (!_showNotListedInput)
              ListTile(
                leading: const Icon(Icons.add_location_alt_outlined, color: AppColors.pinkText),
                title: Text(l10n.villageNotListed, style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.pinkText, fontWeight: FontWeight.w600,
                )),
                onTap: () => setState(() => _showNotListedInput = true),
              )
            else
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _notListedCtrl,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: l10n.typeYourVillageHint,
                          filled: true,
                          fillColor: AppColors.fieldFill,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    ElevatedButton(
                      onPressed: () {
                        final text = _notListedCtrl.text.trim();
                        if (text.isEmpty) return;
                        Navigator.of(context).pop(VillagePickResult(notListedName: text));
                      },
                      child: Text(l10n.save),
                    ),
                  ],
                ),
              ),
            SizedBox(height: AppSpacing.md + MediaQuery.paddingOf(context).bottom),
          ],
        ),
      ),
    );
  }
}
