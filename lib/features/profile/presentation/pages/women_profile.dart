import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/auth/presentation/provider/auth_providers.dart';
import 'package:sangwari_maa/features/profile/data/model/women_profile_model.dart';
import 'package:sangwari_maa/features/profile/presentation/provider/profile_providers.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Icon asset paths — assets/icons/*.png
// ─────────────────────────────────────────────────────────────────────────────
abstract class _ProfileIcons {
  static const checkmark = 'assets/icons/checkmark.png';
  static const call = 'assets/icons/callgreen.png';
  static const callProfile = 'assets/icons/callprofile.png';
  static const edd = 'assets/icons/edd.png';
  static const edit = 'assets/icons/editprofile.png';
  static const language = 'assets/icons/languageprofile.png';
  static const alert = 'assets/icons/alertprofile.png';
  static const logout = 'assets/icons/logout.png';
  static const tag = 'assets/icons/tag.png';
  static const motherProfile = 'assets/icons/motherprofile.png';
  static const family = 'assets/icons/family.png';
}

// Beneficiary columns confirmed editable via PATCH /women/profile (matched
// against register_woman()'s Beneficiary(...) construction). Kept in one
// place so the "coming soon" fields below are easy to tell apart from these.
class _MotherFieldKeys {
  static const name = 'name';
  static const age = 'age';
  static const dob = 'dob';
  static const bloodGroup = 'blood_group';
  static const lmp = 'lmp';
  static const village = 'village';
  static const block = 'block';
  static const district = 'district';
}

class _FamilyFieldKeys {
  static const husbandName = 'husband_name';
  static const husbandAge = 'husband_age';
  static const husbandContactNo = 'husband_contact_no';
  static const otherFamilyMemberName = 'other_family_member_name';
  static const otherFamilyMemberRelation = 'other_family_member_relation';
  static const familyContactNo = 'family_contact_no';
}

const _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

class WomenProfileScreen extends ConsumerStatefulWidget {
  const WomenProfileScreen({super.key});

  @override
  ConsumerState<WomenProfileScreen> createState() => _WomenProfileScreenState();
}

class _WomenProfileScreenState extends ConsumerState<WomenProfileScreen> {
  // Local-only toggle until a settings provider/endpoint exists.
  // TODO: back this with real persistence (SharedPreferences or a
  // /women/settings endpoint) instead of in-memory state.
  bool _remindersOn = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profileAsync = ref.watch(womenProfileControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _SubHeader(title: l10n.myProfile, onBack: () => context.pop()),
            Expanded(
              child: profileAsync.when(
                data: (profile) => _ProfileBody(
                  profile: profile,
                  l10n: l10n,
                  remindersOn: _remindersOn,
                  onRemindersChanged: (v) => setState(() => _remindersOn = v),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => _ProfileError(
                  l10n: l10n,
                  onRetry: () => ref.read(womenProfileControllerProvider.notifier).refresh(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub header
// ─────────────────────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const _SubHeader({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE8F1FB),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Icon(Icons.arrow_back_rounded, color: AppColors.bodyText, size: 22),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Body
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileBody extends ConsumerWidget {
  final WomenProfileModel profile;
  final AppLocalizations l10n;
  final bool remindersOn;
  final ValueChanged<bool> onRemindersChanged;

  const _ProfileBody({
    required this.profile,
    required this.l10n,
    required this.remindersOn,
    required this.onRemindersChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = profile.profile;
    final user = profile.user;

    return RefreshIndicator(
      color: AppColors.gradStart,
      onRefresh: () => ref.read(womenProfileControllerProvider.notifier).refresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH, vertical: AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ProfileHeaderCard(data: data, user: user, l10n: l10n, pregnancy: profile.pregnancy),
            const SizedBox(height: AppSpacing.md),
            const Divider(
              height: 1, thickness: 1,
              color: AppColors.greyBorder,
            ),
            const SizedBox(height: AppSpacing.sm),
            _MotherProfileSection(data: data, user: user, l10n: l10n, pregnancy: profile.pregnancy),
            const SizedBox(height: AppSpacing.lg),
            _FamilyDetailsSection(data: data, l10n: l10n),
            const SizedBox(height: AppSpacing.md),
            const Divider(
              color: AppColors.greyBorder,
            ),
            const SizedBox(height: AppSpacing.sm),
            _GeneralSettingsSection(
              l10n: l10n,
              remindersOn: remindersOn,
              onRemindersChanged: onRemindersChanged,
            ),
            const SizedBox(height: AppSpacing.lg),
            _LogoutButton(l10n: l10n),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header card — avatar, name, age/weeks, mobile, location
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileHeaderCard extends StatelessWidget {
  final WomenProfileDataModel data;
  final WomenProfileUserModel user;
  final AppLocalizations l10n;
  final Map<String, dynamic>? pregnancy;

  const _ProfileHeaderCard({
    required this.data,
    required this.user,
    required this.l10n,
    required this.pregnancy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.cellBg),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Avatar(name: data.name ?? user.name),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? user.name ?? l10n.notProvided,
                      style: AppTypography.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _ageAndWeeksLabel(l10n),
                      style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(_ProfileIcons.call, width: 16, height: 16),
                        const SizedBox(width: 6),
                        Text(formatMobile(user.mobile), style: AppTypography.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (locationLabel(data) != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(color: AppColors.cellBg, borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
              child: Row(
                children: [
                  Image.asset(_ProfileIcons.tag, width: 16, height: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      locationLabel(data)!,
                      style: AppTypography.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _ageAndWeeksLabel(AppLocalizations l10n) {
    final parts = <String>[];
    if (data.age != null) parts.add('${data.age} ${l10n.years}');
    final weeks = weeksPregnant(pregnancy);
    final days = gestationalDayRemainder(data.lmp);
    if (weeks != null) {
      parts.add(days == null ? '$weeks ${l10n.weeks}' : '$weeks ${l10n.weeks} $days ${l10n.days}');
    }
    return parts.isEmpty ? l10n.notProvided : parts.join(' • ');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared helpers (used by header card + Mother's Profile Details section)
// ─────────────────────────────────────────────────────────────────────────────

String? validatePhoneDigits(String text, AppLocalizations l10n) {
  if (text.isEmpty) return null; // optional field — empty is fine, skip
  if (!RegExp(r'^[6-9]\d{9}$').hasMatch(text)) {
    return l10n.invalidMobile; // new ARB key, see below
  }
  return null;
}

int? weeksPregnant(Map<String, dynamic>? pregnancy) {
  final v = pregnancy?['gestational_week'];
  if (v is int) return v;
  if (v is String) return int.tryParse(v);
  return null;
}

// Leftover days beyond the whole-week count, computed client-side from the
// same `lmp` the backend uses — mirrors compute_pregnancy_info()'s math so
// it never disagrees with the backend's `gestational_week`. Backend doesn't
// currently return a day-remainder value, so this is derived locally rather
// than requesting a new field for one extra digit.
int? gestationalDayRemainder(String? lmpIso) {
  final lmp = lmpIso == null ? null : DateTime.tryParse(lmpIso);
  if (lmp == null) return null;
  final daysPregnant = DateTime.now().difference(lmp).inDays;
  if (daysPregnant < 0) return null;
  return daysPregnant % 7;
}

String? locationLabel(WomenProfileDataModel data) {
  final parts = [data.village, data.block, data.district].where((e) => e != null && e.isNotEmpty).toList();
  if (parts.isEmpty) return null;
  // State is hardcoded — this app only serves Chhattisgarh districts.
  return '${parts.join(', ')} (Chhattisgarh)';
}

String formatMobile(String mobile) {
  final digits = mobile.replaceAll(RegExp(r'\D'), '');
  if (digits.length == 10) return '+91 ${digits.substring(0, 5)} ${digits.substring(5)}';
  if (digits.length == 12 && digits.startsWith('91')) {
    final local = digits.substring(2);
    return '+91 ${local.substring(0, 5)} ${local.substring(5)}';
  }
  return mobile;
}

String formatDdMmYyyy(String? iso) {
  if (iso == null) return '';
  final parsed = DateTime.tryParse(iso);
  if (parsed == null) return iso;
  return DateFormat('dd-MM-yyyy').format(parsed);
}

String formatDMmmYyyy(String? iso) {
  if (iso == null) return '';
  final parsed = DateTime.tryParse(iso);
  if (parsed == null) return iso;
  return DateFormat('d MMM yyyy').format(parsed);
}

int calculateAge(DateTime dob) {
  final now = DateTime.now();
  int age = now.year - dob.year;
  if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
    age--;
  }
  return age;
}

Future<void> _openNotificationSettings() async {
  final intent = AndroidIntent(
    action: 'android.settings.APP_NOTIFICATION_SETTINGS',
    arguments: {
      'android.provider.extra.APP_PACKAGE': 'com.sangwarimaa.sangwari_maa',
    },
  );
  await intent.launch();
}

class _Avatar extends StatelessWidget {
  final String? name;
  const _Avatar({this.name});

  @override
  Widget build(BuildContext context) {
    // NOTE: no photo/avatar URL field exists in the API contract yet, so
    // this renders initials. Swap in CachedNetworkImage once one is added.
    final initial = (name != null && name!.isNotEmpty) ? name![0].toUpperCase() : '?';
    return Stack(
      children: [
        Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Color(0xFFFFE1DF), shape: BoxShape.circle),
          child: Text(initial, style: AppTypography.headlineMedium.copyWith(color: AppColors.accent)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(_ProfileIcons.checkmark, width: 22, height: 22),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared section header (icon + title + edit pencil / cancel+save while editing)
// ─────────────────────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String icon;
  final String title;
  final bool editing;
  final bool saving;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.editing,
    required this.saving,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, width: 22, height: 22),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: AppTypography.titleMedium.copyWith(color: AppColors.pinkText, fontWeight: FontWeight.w700),
          ),
        ),
        if (editing) ...[
          GestureDetector(
            onTap: saving ? null : onCancel,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.close_rounded, size: 20, color: AppColors.hintText),
            ),
          ),
          GestureDetector(
            onTap: saving ? null : onSave,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Color(0xFFE6F4EA), shape: BoxShape.circle),
              child: saving
                  ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF388E3C)),
              )
                  : const Icon(Icons.check_rounded, size: 18, color: Color(0xFF388E3C)),
            ),
          ),
        ] else
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset(_ProfileIcons.edit, width: 32, height: 32),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Field grid cells — read-only + inline-editable variants, same visual shell
// ─────────────────────────────────────────────────────────────────────────────
class _FieldCell extends StatelessWidget {
  final String label;
  final String? value;
  final String notProvidedLabel;
  final Color? valueColor;

  const _FieldCell({
    required this.label,
    required this.value,
    required this.notProvidedLabel,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.trim().isNotEmpty;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(color: AppColors.cellBg, borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
          const SizedBox(height: 4),
          Text(
            hasValue ? value! : notProvidedLabel,
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: hasValue ? (valueColor ?? AppColors.bodyText) : AppColors.hintText,
              fontStyle: hasValue ? FontStyle.normal : FontStyle.italic,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _EditableTextCell extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;

  const _EditableTextCell({required this.label, required this.controller, this.keyboardType,  this.inputFormatters,this.errorText,});

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.cellBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w700, color: AppColors.bodyText),
            decoration: const InputDecoration(isDense: true, contentPadding: EdgeInsets.zero, border: InputBorder.none),
          ),
          if (hasError) ...[
            const SizedBox(height: 4),
            Text(errorText!, style: AppTypography.bodySmall.copyWith(color: Colors.red)),
          ],
        ],
      ),
    );
  }
}

class _EditableDateCell extends StatelessWidget {
  final String label;
  final DateTime? value;
  final String tapToAddLabel;
  final ValueChanged<DateTime> onPick;

  const _EditableDateCell({
    required this.label,
    required this.value,
    required this.tapToAddLabel,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime.now(),
        );
        if (picked != null) onPick(picked);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.cellBg,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                const Icon(Icons.calendar_today, size: 14, color: AppColors.hintText),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              value == null ? tapToAddLabel : DateFormat('dd-MM-yyyy').format(value!),
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: value == null ? AppColors.hintText : AppColors.bodyText,
                fontStyle: value == null ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditableBloodGroupCell extends StatelessWidget {
  final String label;
  final String? value;
  final String tapToAddLabel;
  final ValueChanged<String> onPick;

  const _EditableBloodGroupCell({
    required this.label,
    required this.value,
    required this.tapToAddLabel,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showModalBottomSheet<String>(
          context: context,
          backgroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg))),
          builder: (sheetContext) => SafeArea(
            child: Wrap(
              children: _bloodGroups
                  .map((g) => ListTile(title: Text(g), onTap: () => Navigator.of(sheetContext).pop(g)))
                  .toList(),
            ),
          ),
        );
        if (picked != null) onPick(picked);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.cellBg,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                const Icon(Icons.expand_more, size: 16, color: AppColors.hintText),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              value ?? tapToAddLabel,
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: value == null ? AppColors.hintText : AppColors.accent,
                fontStyle: value == null ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  final List<Widget> cells;
  const _FieldRow({required this.cells});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < cells.length; i++) ...[
          if (i > 0) const SizedBox(width: AppSpacing.sm),
          Expanded(child: cells[i]),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Mother's Profile Details — now with inline editing (no separate sheet)
// ─────────────────────────────────────────────────────────────────────────────
class _MotherProfileSection extends ConsumerStatefulWidget {
  final WomenProfileDataModel data;
  final WomenProfileUserModel user;
  final AppLocalizations l10n;
  final Map<String, dynamic>? pregnancy;

  const _MotherProfileSection({
    required this.data,
    required this.user,
    required this.l10n,
    required this.pregnancy,
  });

  @override
  ConsumerState<_MotherProfileSection> createState() => _MotherProfileSectionState();
}

class _MotherProfileSectionState extends ConsumerState<_MotherProfileSection> {
  bool _editing = false;
  bool _saving = false;
  Map<String, String> _fieldErrors = {};
  TextEditingController? _name;
  TextEditingController? _age;
  TextEditingController? _village;
  TextEditingController? _block;
  TextEditingController? _district;
  DateTime? _dob;
  DateTime? _lmp;
  String? _bloodGroup;

  void _startEditing() {
    final d = widget.data;
    _name = TextEditingController(text: d.name ?? '');
    _age = TextEditingController(text: d.age?.toString() ?? '');
    _village = TextEditingController(text: d.village ?? '');
    _block = TextEditingController(text: d.block ?? '');
    _district = TextEditingController(text: d.district ?? '');
    _dob = d.dob == null ? null : DateTime.tryParse(d.dob!);
    _lmp = d.lmp == null ? null : DateTime.tryParse(d.lmp!);
    _bloodGroup = d.bloodGroup;
    _fieldErrors = {};
    setState(() => _editing = true);
  }

  void _cancelEditing() {
    _disposeControllers();
    setState(() => _editing = false);
  }

  void _disposeControllers() {
    _name?.dispose();
    _age?.dispose();
    _village?.dispose();
    _block?.dispose();
    _district?.dispose();
    _name = null;
    _age = null;
    _village = null;
    _block = null;
    _district = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  Future<void> _save() async {
    final localErrors = <String, String>{};
    final ageValue = int.tryParse(_age!.text.trim());
    if (_age!.text.trim().isNotEmpty && (ageValue == null || ageValue < 14 || ageValue > 55)) {
      localErrors[_MotherFieldKeys.age] = widget.l10n.ageRangeError; // new ARB key
    }
    if (localErrors.isNotEmpty) {
      setState(() => _fieldErrors = localErrors);
      return; // NEW
    }
    setState(() {
      _saving = true;
      _fieldErrors = {}; // NEW
    });
    final body = <String, dynamic>{
      _MotherFieldKeys.name: _name!.text.trim(),
      _MotherFieldKeys.age: int.tryParse(_age!.text.trim()),
      _MotherFieldKeys.dob: _dob?.toIso8601String().split('T').first,
      _MotherFieldKeys.bloodGroup: _bloodGroup,
      _MotherFieldKeys.lmp: _lmp?.toIso8601String().split('T').first,
      _MotherFieldKeys.village: _village!.text.trim(),
      _MotherFieldKeys.block: _block!.text.trim(),
      _MotherFieldKeys.district: _district!.text.trim(),
    }..removeWhere((_, v) => v == null || v == '');

    final result = await ref.read(profileRepositoryProvider).updateWomenProfileFields(body);
    if (!mounted) return;
    result.fold(
          (failure) {
            setState(() {
              _saving = false;
              if (failure is ValidationFailure) {
                _fieldErrors = {
                  for (final entry in failure.fieldErrors.entries) entry.key: entry.value.first,
                };
              }
            });
        // Surfacing the real failure message now instead of a generic
        // string — if this keeps failing, this text is what to send back
        // so the actual cause (validation error, schema mismatch, etc.)
        // can be pinned down.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.l10n.updateFailed}: ${failure.message}')),
        );
      },
          (_) async {
        await ref.read(womenProfileControllerProvider.notifier).refresh();
        if (!mounted) return;
        _disposeControllers();
        setState(() {
          _editing = false;
          _saving = false;
          _fieldErrors = {};
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.l10n.profileUpdated)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final data = widget.data;
    final weeks = weeksPregnant(widget.pregnancy);
    final days = gestationalDayRemainder(data.lmp);
    final gestationalAgeValue = weeks == null
        ? null
        : days == null
        ? '$weeks ${l10n.weeks}'
        : '$weeks ${l10n.weeks} $days ${l10n.days}';

    final ageDobValue = (data.age == null && data.dob == null)
        ? null
        : '${data.age != null ? '${data.age} ${l10n.years}' : l10n.notProvided}'
        '${data.dob != null ? ' (${formatDdMmYyyy(data.dob)})' : ''}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: _ProfileIcons.motherProfile,
          title: l10n.mothersProfileDetails,
          editing: _editing,
          saving: _saving,
          onEdit: _startEditing,
          onCancel: _cancelEditing,
          onSave: _save,
        ),
        const SizedBox(height: AppSpacing.sm),
        _FieldRow(cells: [
          _editing
              ? _EditableTextCell(label: l10n.fullName, controller: _name!)
              : _FieldCell(label: l10n.fullName, value: data.name, notProvidedLabel: l10n.tapToAdd),
          // Mobile Number stays read-only always — it's tied to OTP auth,
          // not a plain Beneficiary column, so it shouldn't be editable here.
          _FieldCell(label: l10n.mobileNumber, value: formatMobile(widget.user.mobile), notProvidedLabel: l10n.notProvided),
        ]),
        const SizedBox(height: AppSpacing.sm),
        _FieldRow(cells: [
          _editing
              ? _EditableTextCell(label: l10n.age, controller: _age!, keyboardType: TextInputType.number,  errorText: _fieldErrors[_MotherFieldKeys.age],)
              : _FieldCell(label: l10n.ageAndDob, value: ageDobValue, notProvidedLabel: l10n.tapToAdd),
          _editing
              ? _EditableBloodGroupCell(
            label: l10n.bloodGroup,
            value: _bloodGroup,
            tapToAddLabel: l10n.tapToAdd,
            onPick: (v) => setState(() => _bloodGroup = v),
          )
              : _FieldCell(
            label: l10n.bloodGroup,
            value: data.bloodGroup,
            notProvidedLabel: l10n.tapToAdd,
            valueColor: AppColors.accent,
          ),
        ]),
        if (_editing) ...[
          const SizedBox(height: AppSpacing.sm),
          _EditableDateCell(
            label: l10n.dateOfBirth,
            value: _dob,
            tapToAddLabel: l10n.tapToAdd,
            onPick: (v) => setState(() => _dob = v),
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        _FieldRow(cells: [
          // Gestational Age is derived (backend week + client day-remainder)
          // — never directly editable, LMP below is the thing you actually edit.
          _FieldCell(label: l10n.gestationalAge, value: gestationalAgeValue, notProvidedLabel: l10n.notProvided),
          _editing
              ? _EditableDateCell(
            label: l10n.lmpDate,
            value: _lmp,
            tapToAddLabel: l10n.tapToAdd,
            onPick: (v) => setState(() {
              _dob = v;
              _age!.text = calculateAge(v).toString(); // keep age in sync with DOB
            }),
          )
              : _FieldCell(
            label: l10n.lmpDate,
            value: data.lmp == null ? null : formatDdMmYyyy(data.lmp),
            notProvidedLabel: l10n.tapToAdd,
          ),
        ]),
        const SizedBox(height: AppSpacing.sm),
        // EDD is always read-only — server-computed from LMP, editing LMP
        // above and saving will recompute it on the next refresh.
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(color: AppColors.cellBg, borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.expectedDeliveryDate, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                    const SizedBox(height: 4),
                    Text(
                      data.edd == null ? l10n.notProvided : formatDMmmYyyy(data.edd),
                      style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w700, color: AppColors.accent),
                    ),
                  ],
                ),
              ),
              Image.asset(_ProfileIcons.edd, width: 26, height: 26),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        if (_editing) ...[
          _FieldRow(cells: [
            _EditableTextCell(label: l10n.village, controller: _village!),
            _EditableTextCell(label: l10n.block, controller: _block!),
          ]),
          const SizedBox(height: AppSpacing.sm),
          _EditableTextCell(label: l10n.district, controller: _district!),
        ] else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(color: AppColors.cellBg, borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(_ProfileIcons.tag, width: 18, height: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.currentAddress, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                      const SizedBox(height: 4),
                      Text(
                        locationLabel(data) ?? l10n.tapToAdd,
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          fontStyle: locationLabel(data) == null ? FontStyle.italic : FontStyle.normal,
                          color: locationLabel(data) == null ? AppColors.hintText : AppColors.bodyText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Family Details — inline editing for Husband's Name/Age
// ─────────────────────────────────────────────────────────────────────────────
class _FamilyDetailsSection extends ConsumerStatefulWidget {
  final WomenProfileDataModel data;
  final AppLocalizations l10n;

  const _FamilyDetailsSection({required this.data, required this.l10n});

  @override
  ConsumerState<_FamilyDetailsSection> createState() => _FamilyDetailsSectionState();
}

class _FamilyDetailsSectionState extends ConsumerState<_FamilyDetailsSection> {
  bool _editing = false;
  bool _saving = false;
  Map<String, String> _fieldErrors = {};
  TextEditingController? _husbandName;
  TextEditingController? _husbandAge;
  TextEditingController? _husbandContactNo;
  TextEditingController? _otherFamilyMemberName;
  TextEditingController? _otherFamilyMemberRelation;
  TextEditingController? _familyContactNo;


  void _startEditing() {
    final d = widget.data;
    _husbandName = TextEditingController(text: d.husbandName ?? '');
    _husbandAge = TextEditingController(text: d.husbandAge?.toString() ?? '');
    _husbandContactNo = TextEditingController(text: d.husbandContactNo ?? '');
    _otherFamilyMemberName =
        TextEditingController(text: d.otherFamilyMemberName ?? '');
    _otherFamilyMemberRelation =
        TextEditingController(text: d.otherFamilyMemberRelation ?? '');
    _familyContactNo = TextEditingController(text: d.familyContactNo ?? '');
    _fieldErrors = {};
    setState(() => _editing = true);
  }

    void _cancelEditing() {
    _disposeControllers();
    setState(() => _editing = false);
  }

  void _disposeControllers() {
    _husbandName?.dispose();
    _husbandAge?.dispose();
    _husbandContactNo?.dispose();
    _otherFamilyMemberName?.dispose();
    _otherFamilyMemberRelation?.dispose();
    _familyContactNo?.dispose();
    _husbandName = null;
    _husbandAge = null;
    _husbandContactNo = null;
    _otherFamilyMemberName = null;
    _otherFamilyMemberRelation = null;
    _familyContactNo = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  Future<void> _save() async {
    final localErrors = <String, String>{};
    final husbandContactErr = validatePhoneDigits(_husbandContactNo!.text.trim(), widget.l10n);
    if (husbandContactErr != null) localErrors[_FamilyFieldKeys.husbandContactNo] = husbandContactErr;
    final familyContactErr = validatePhoneDigits(_familyContactNo!.text.trim(), widget.l10n);
    if (familyContactErr != null) localErrors[_FamilyFieldKeys.familyContactNo] = familyContactErr;

    if (localErrors.isNotEmpty) {
      setState(() => _fieldErrors = localErrors);
      return; // NEW — stop here, don't hit the API with known-bad data
    }
    setState(() {
      _saving = true;
      _fieldErrors = {}; // NEW
    });
    final body = <String, dynamic>{
      _FamilyFieldKeys.husbandName: _husbandName!.text.trim(),
      _FamilyFieldKeys.husbandAge: int.tryParse(_husbandAge!.text.trim()),
      _FamilyFieldKeys.husbandContactNo: _husbandContactNo!.text.trim(),
      _FamilyFieldKeys.otherFamilyMemberName: _otherFamilyMemberName!.text.trim(),
      _FamilyFieldKeys.otherFamilyMemberRelation: _otherFamilyMemberRelation!.text.trim(),
      _FamilyFieldKeys.familyContactNo: _familyContactNo!.text.trim(),
    }..removeWhere((_, v) => v == null || v == '');

    final result = await ref.read(profileRepositoryProvider).updateWomenProfileFields(body);
    if (!mounted) return;
    result.fold(
          (failure) {
            setState(() {
              _saving = false;
              if (failure is ValidationFailure) {
                _fieldErrors = {
                  for (final entry in failure.fieldErrors.entries) entry.key: entry.value.first,
                };
              }
            });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.l10n.updateFailed}: ${failure.message}')),
        );
      },
          (_) async {
        await ref.read(womenProfileControllerProvider.notifier).refresh();
        if (!mounted) return;
        _disposeControllers();
        setState(() {
          _editing = false;
          _saving = false;
          _fieldErrors = {};
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.l10n.profileUpdated)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final data = widget.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: _ProfileIcons.family,
          title: l10n.familyDetails,
          editing: _editing,
          saving: _saving,
          onEdit: _startEditing,
          onCancel: _cancelEditing,
          onSave: _save,
        ),
        const SizedBox(height: AppSpacing.sm),
        _FieldRow(cells: [
          _editing
              ? _EditableTextCell(label: l10n.husbandsName, controller: _husbandName!)
              : _FieldCell(label: l10n.husbandsName, value: data.husbandName, notProvidedLabel: l10n.tapToAdd),
          _editing
              ? _EditableTextCell(label: l10n.husbandsAge, controller: _husbandAge!, keyboardType: TextInputType.number)
              : _FieldCell(
            label: l10n.husbandsAge,
            value: data.husbandAge == null ? null : '${data.husbandAge} ${l10n.years}',
            notProvidedLabel: l10n.tapToAdd,
          ),
        ]),
        const SizedBox(height: AppSpacing.sm),
        _editing
            ? _EditableTextCell(
          label: l10n.husbandsContactNo,
          controller: _husbandContactNo!,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          errorText: _fieldErrors[_FamilyFieldKeys.husbandContactNo],
        )
            : _ContactRow(
          label: l10n.husbandsContactNo,
          value: data.husbandContactNo == null ? null : formatMobile(data.husbandContactNo!),
          notProvidedLabel: l10n.tapToAdd,
        ),
        const SizedBox(height: AppSpacing.sm),
        _FieldRow(cells: [
          _editing
              ? _EditableTextCell(label: l10n.otherFamilyMember, controller: _otherFamilyMemberName!)
              : _FieldCell(label: l10n.otherFamilyMember, value: data.otherFamilyMemberName, notProvidedLabel: l10n.tapToAdd),
          _editing
              ? _EditableTextCell(label: l10n.relationWithFamilyMember, controller: _otherFamilyMemberRelation!)
              : _FieldCell(label: l10n.relationWithFamilyMember, value: data.otherFamilyMemberRelation, notProvidedLabel: l10n.tapToAdd),
        ]),
        const SizedBox(height: AppSpacing.sm),
        _editing
            ? _EditableTextCell(
          label: l10n.familyContactNo,
          controller: _familyContactNo!,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          errorText: _fieldErrors[_FamilyFieldKeys.familyContactNo],
        )
            : _ContactRow(
          label: l10n.familyContactNo,
          value: data.familyContactNo == null ? null : formatMobile(data.familyContactNo!),
          notProvidedLabel: l10n.tapToAdd,
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String label;
  final String? value;
  final String notProvidedLabel;


  const _ContactRow({
    required this.label,
    required this.value,
    required this.notProvidedLabel,

  });

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(color: AppColors.cellBg, borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                const SizedBox(height: 4),
                Text(
                  hasValue ? value! : notProvidedLabel,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: hasValue ? AppColors.bodyText : AppColors.hintText,
                    fontStyle: hasValue ? FontStyle.normal : FontStyle.italic,
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

// ─────────────────────────────────────────────────────────────────────────────
// General Settings — App Language / Reminders & Alerts
// ─────────────────────────────────────────────────────────────────────────────
class _GeneralSettingsSection extends StatelessWidget {
  final AppLocalizations l10n;
  final bool remindersOn;
  final ValueChanged<bool> onRemindersChanged;

  const _GeneralSettingsSection({
    required this.l10n,
    required this.remindersOn,
    required this.onRemindersChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.generalSettings, style: AppTypography.titleMedium),
            Text(l10n.preferences, style: AppTypography.bodySmall),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Column(
            children: [
              _SettingsRow(
                icon: _ProfileIcons.language,
                title: l10n.appLanguage,
                subtitle: Localizations.localeOf(context).languageCode == 'hi' ? l10n.hindi : l10n.english,
                trailing: Builder(
                  builder: (innerContext) => GestureDetector(
                    onTap: () => _showLanguageSheet(innerContext),
                    child: Text(
                      '${l10n.change} \u203a',
                      style: AppTypography.bodyMedium.copyWith(color: AppColors.accent, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFF0F0F0)),

        _SettingsRow(
        icon: _ProfileIcons.alert,
          title: l10n.remindersAlerts,
          subtitle: l10n.remindersAlertsDesc,
          trailing: GestureDetector(
            onTap: _openNotificationSettings,
            child: Text('${l10n.change} \u203a',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.accent, fontWeight: FontWeight.w700)),
          ),
        ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg))),
      builder: (sheetContext) => Consumer(
        builder: (consumerContext, ref, _) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.appLanguage, style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                ListTile(title: Text(l10n.english), onTap: () => _selectLanguage(consumerContext, ref, 'en')),
                ListTile(title: Text(l10n.hindi), onTap: () => _selectLanguage(consumerContext, ref, 'hi')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectLanguage(BuildContext context, WidgetRef ref, String code) {
    // TODO: confirm the exact provider name/method — assumed
    // `localeProvider.notifier.setLocale(Locale(code))`.
    ref.read(localeProvider.notifier).setLocale(Locale(code));
    ref.read(profileRepositoryProvider).updatePreferredLanguage(code);
    Navigator.of(context).pop();
  }
}

class _SettingsRow extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Widget trailing;

  const _SettingsRow({required this.icon, required this.title, required this.subtitle, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            child: Image.asset(icon, width: 38, height: 38),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
                Text(subtitle, style: AppTypography.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          trailing,
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Log Out
// ─────────────────────────────────────────────────────────────────────────────
class _LogoutButton extends ConsumerWidget {
  final AppLocalizations l10n;
  const _LogoutButton({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _confirmLogout(context, ref),
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: const Color(0xFFFFE9E8), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_ProfileIcons.logout, width: 18, height: 18),
            const SizedBox(width: 8),
            Text(l10n.logOut, style: AppTypography.titleMedium.copyWith(color: AppColors.gradStart)),
          ],
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
        title: Text(l10n.logOutConfirmTitle),
        content: Text(l10n.logOutConfirmMessage),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await _performLogout(context, ref);
            },
            child: Text(l10n.logOut, style: const TextStyle(color: AppColors.accent)),
          ),
        ],
      ),
    );
  }

  Future<void> _performLogout(BuildContext context, WidgetRef ref) async {
    final result = await ref.read(authRepositoryProvider).logout();
    if (!context.mounted) return;
    result.fold(
      // AuthRepository.logout() clears local tokens even on a failed API
      // call, so the local session is gone either way — surface the error
      // but still navigate away.
      // TODO: confirm `Failure` exposes `.message`.
          (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message))),
          (_) {},
    );
    // TODO: confirm the actual login route path/name.
    if (context.mounted) context.goNamed('login');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Error state
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileError extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onRetry;

  const _ProfileError({required this.l10n, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 40, color: Color(0xFF9E9E9E)),
            const SizedBox(height: AppSpacing.sm),
            Text(l10n.profileLoadError, textAlign: TextAlign.center, style: AppTypography.bodyMedium),
            const SizedBox(height: AppSpacing.md),
            TextButton(onPressed: onRetry, child: Text(l10n.retry)),
          ],
        ),
      ),
    );
  }
}