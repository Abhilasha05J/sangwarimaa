import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/careteam/data/model/care_team_models.dart';
import 'package:sangwari_maa/features/careteam/presentation/providers/care_team_providers.dart';
import 'package:sangwari_maa/features/careteam/presentation/widgets/asha_picker_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

// Colours taken from the design screenshot. Swap for AppColors tokens if you have equivalents.
const _kHeaderRed = Color(0xFFD0452E);
const _kCardBg = Color(0xFFFDF9F7);
const _kBorder = Color(0xFFF3E2DB);
const _kAvatarBg = Color(0x33E57368);

const _kAvatarFg = Color(0xFFB5382A);
const _kGreen = Color(0xFF1AA61A);
const _kGreenDark = Color(0xFF0D5B46);

const _kGreenSoft = Color(0xFFEFFFED);

const _kChipBg = Color(0xFFE3F3E7);
const _kCallIcon = 'assets/icons/call.png';

/// Home-screen care team: pick (or switch) the primary and backup ASHA, then show them with call buttons.
class CareTeamSection extends ConsumerStatefulWidget {
  const CareTeamSection({super.key});

  @override
  ConsumerState<CareTeamSection> createState() => _CareTeamSectionState();
}

class _CareTeamSectionState extends ConsumerState<CareTeamSection> {
  /// null = follow the data (edit when nothing is selected yet, otherwise show the card).
  bool? _editingOverride;
  AshaModel? _primary;
  AshaModel? _backup;
  bool _saving = false;

  void _enterEdit(CareTeamResponse data) {
    final p = data.primary;
    setState(() {
      // An ASHA with an app account but no directory id cannot be re-saved; make her pick again.
      _primary = (p != null && p.id.isNotEmpty) ? p : null;
      _backup = (_primary != null && data.backups.isNotEmpty) ? data.backups.first : null;
      _editingOverride = true;
    });
  }

  Future<void> _pickPrimary(CareTeamResponse data) async {
    final picked = await showAshaPickerSheet(
      context,
      isBackup: false,
      selectedId: _primary?.id,
    );
    if (picked == null || !mounted) return;
    setState(() {
      _primary = picked;
      if (_backup?.id == picked.id) _backup = null; // the primary can't also be the backup
    });
  }

  Future<void> _pickBackup() async {
    final p = _primary;
    if (p == null) return;
    final picked = await showAshaPickerSheet(
      context,
      isBackup: true,
      excludeId: p.id,
      selectedId: _backup?.id,
    );
    if (picked == null || !mounted) return;
    setState(() => _backup = picked);
  }

  Future<void> _save() async {
    final p = _primary;
    if (p == null || _saving) return;
    final l10n = AppLocalizations.of(context)!;
    setState(() => _saving = true);
    final ok = await ref.read(careTeamControllerProvider.notifier).save(
          primaryId: p.id,
          backupId: _backup?.id,
        );
    if (!mounted) return;
    setState(() {
      _saving = false;
      if (ok) _editingOverride = false;
    });
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.careTeamSaveError)));
    }
  }

  Future<void> _call(AshaModel a) async {
    final l10n = AppLocalizations.of(context)!;
    final number = a.callableNumber;
    var ok = false;
    if (number != null) {
      final uri = Uri(scheme: 'tel', path: '+91$number');
      ok = await canLaunchUrl(uri) && await launchUrl(uri);
    }
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.careTeamCallFailed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final async = ref.watch(careTeamControllerProvider);

    return async.when(
      skipLoadingOnReload: true,
      loading: () => const SizedBox(
        height: 96,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2.5)),
      ),
      error: (_, __) => _ErrorCard(
        message: l10n.careTeamLoadError,
        retryLabel: l10n.retry,
        onRetry: () => ref.invalidate(careTeamControllerProvider),
      ),
      data: (data) {
        final editing = _editingOverride ?? !data.selected;
        return editing ? _buildForm(l10n, data) : _buildSummary(l10n, data);
      },
    );
  }

  // ── Edit mode: two pickers + Save ───────────────────────────────────────────
  Widget _buildForm(AppLocalizations l10n, CareTeamResponse data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.careTeamSelectHeader.toUpperCase(),
                style: AppTypography.bodySmall.copyWith(
                  color: _kHeaderRed,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            if (data.selected)
              InkWell(
                onTap: () => setState(() => _editingOverride = false),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                  child: Text(l10n.cancel, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                ),
              )
            else
              Text(
                l10n.careTeamSwitchAnytime,
                style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontSize: 12),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        _FieldLabel(l10n.careTeamPrimaryLabel),
        const SizedBox(height: 6),
        _PickerField(
          value: _primary?.name,
          hint: l10n.careTeamSelectHint,
          onTap: () => _pickPrimary(data),
        ),
        const SizedBox(height: AppSpacing.md),
        _FieldLabel(l10n.careTeamBackupLabel),
        const SizedBox(height: 6),
        _PickerField(
          value: _backup?.name,
          hint: l10n.careTeamSelectHint,
          enabled: _primary != null,
          onTap: _pickBackup,
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: Material(
            color: _primary == null ? const Color(0xFFF0F0F0) : _kGreenSoft,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: (_primary == null || _saving) ? null : _save,
              child: Center(
                child: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.5, color: _kGreen),
                      )
                    : Text(
                        l10n.save,
                        style: AppTypography.bodySmall.copyWith(
                          color: _primary == null ? AppColors.hintText : _kGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Summary: primary card + backups ──────────────────────────────────────────
  Widget _buildSummary(AppLocalizations l10n, CareTeamResponse data) {
    final primary = data.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.careTeamPrimaryLabel, style: AppTypography.titleLarge),
                  const SizedBox(height: 2),
                  Text(
                    l10n.careTeamAssignedSubtitle,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontSize: 12),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => _enterEdit(data),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  l10n.careTeamSwitchAnytime,
                  style: AppTypography.bodySmall.copyWith(
                  //  color: _kGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        if (primary != null) _PrimaryCard(asha: primary, onCall: () => _call(primary)),
        if (data.backups.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.careTeamBackupSectionTitle.toUpperCase(),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.hintText,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final b in data.backups) ...[
            _BackupRow(asha: b, onCall: () => _call(b)),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ],
    );
  }
}

String _subtitle(AppLocalizations l10n, AshaModel a) {
  if ((a.village ?? '').isNotEmpty) return l10n.careTeamMitaninVillage(a.village!);
  if ((a.shc ?? '').isNotEmpty) return l10n.careTeamMitaninShc(a.shc!);
  return l10n.careTeamMitanin;
}

// ─────────────────────────────────────────────────────────────────────────────
// Pieces
// ─────────────────────────────────────────────────────────────────────────────

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTypography.bodyMedium.copyWith(fontSize: 15, fontWeight: FontWeight.w600));
}

class _PickerField extends StatelessWidget {
  final String? value;
  final String hint;
  final bool enabled;
  final VoidCallback onTap;
  const _PickerField({required this.value, required this.hint, required this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    final hasValue = (value ?? '').isNotEmpty;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: enabled ? onTap : null,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _kBorder),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  hasValue ? value! : hint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 14,
                    color: hasValue ? null : AppColors.hintText,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: AppColors.hintText),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryCard extends StatelessWidget {
  final AshaModel asha;
  final VoidCallback onCall;
  const _PrimaryCard({required this.asha, required this.onCall});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final phone = asha.displayMobile;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: _kCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: _kAvatarBg,
            child: Text(
              asha.initials,
              style: AppTypography.bodySmall.copyWith(
                color: _kAvatarFg,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        asha.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodyMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: _kChipBg, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        l10n.careTeamPrimaryChip,
                        style: AppTypography.bodySmall.copyWith(
                          color: _kGreen,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _subtitle(l10n, asha),
                  style: AppTypography.bodySmall.copyWith(fontSize: 13),
                ),
                if (phone != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(phone, style: AppTypography.bodySmall.copyWith(fontSize: 13)),
                    ],
                  ),
                ],
                const SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: Material(
                    color: _kGreenDark,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: asha.callableNumber == null ? null : onCall,
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 44),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(_kCallIcon, width: 16, height: 16),
                            const SizedBox(width: 8),
                            Text(
                              l10n.careTeamCallAsha,
                              style: AppTypography.bodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackupRow extends StatelessWidget {
  final AshaModel asha;
  final VoidCallback onCall;
  const _BackupRow({required this.asha, required this.onCall});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kBorder),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: const Color(0xFFEFEFEF),
            child: Text(
              asha.initials,
              style: AppTypography.bodySmall.copyWith(fontSize: 11, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asha.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyMedium.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    _subtitle(l10n, asha),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: asha.callableNumber == null ? null : onCall,
            icon: Image.asset('assets/icons/callgreen.png', width: 18, height: 18),
          ),
        ],
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String message;
  final String retryLabel;
  final VoidCallback onRetry;
  const _ErrorCard({required this.message, required this.retryLabel, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: _kCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kBorder),
      ),
      child: Row(
        children: [
          Expanded(child: Text(message, style: AppTypography.bodySmall)),
          TextButton(onPressed: onRetry, child: Text(retryLabel)),
        ],
      ),
    );
  }
}
