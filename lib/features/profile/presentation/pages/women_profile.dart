import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/auth/presentation/provider/auth_providers.dart';
import 'package:sangwari_maa/features/profile/data/model/women_profile_model.dart';
import 'package:sangwari_maa/features/profile/presentation/provider/profile_providers.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Icon asset paths — assets/icons/*.png (see pubspec.yaml assets block)
// ─────────────────────────────────────────────────────────────────────────────
abstract class _ProfileIcons {
  static const checkmark = 'assets/icons/checkmark.png';
  static const call = 'assets/icons/callgreen.png';
  static const bloodGroup = 'assets/icons/bloodgroup.png';
  static const edd = 'assets/icons/edd.png';
  static const ashaProfile = 'assets/icons/ashaprofile.png';
  static const edit = 'assets/icons/editprofile.png';
  static const language = 'assets/icons/languageprofile.png';
  static const alert = 'assets/icons/alertprofile.png';
  static const logout = 'assets/icons/logout.png';
  static const tag = 'assets/icons/tag.png';
}

class WomenProfileScreen extends ConsumerStatefulWidget {
  const WomenProfileScreen({super.key});

  @override
  ConsumerState<WomenProfileScreen> createState() => _WomenProfileScreenState();
}

class _WomenProfileScreenState extends ConsumerState<WomenProfileScreen> {
  // Local-only toggles until a settings provider/endpoint exists.
  // TODO: back these with real persistence (SharedPreferences or a
  // /women/settings endpoint) instead of in-memory state.
  //bool _voiceAssistanceOn = true;
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
            _SubHeader(
              title: l10n.myProfile,
              onBack: () => context.pop(),
            ),
            Expanded(
              child: profileAsync.when(
                data: (profile) => _ProfileBody(
                  profile: profile,
                  l10n: l10n,
                //  voiceAssistanceOn: _voiceAssistanceOn,
                  remindersOn: _remindersOn,
                 // onVoiceAssistanceChanged: (v) => setState(() => _voiceAssistanceOn = v),
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
// Sub header (back arrow + title) — light blue strip under TopBar
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.bodyText,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Body — everything below the sub header, once the profile has loaded
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileBody extends ConsumerWidget {
  final WomenProfileModel profile;
  final AppLocalizations l10n;
 // final bool voiceAssistanceOn;
  final bool remindersOn;
 // final ValueChanged<bool> onVoiceAssistanceChanged;
  final ValueChanged<bool> onRemindersChanged;

  const _ProfileBody({
    required this.profile,
    required this.l10n,
   // required this.voiceAssistanceOn,
    required this.remindersOn,
    //required this.onVoiceAssistanceChanged,
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
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProfileHeaderCard(data: data, user: user, l10n: l10n, pregnancy: profile.pregnancy),
            const SizedBox(height: AppSpacing.md),
            _QuickInfoRow(data: data, l10n: l10n),
            const SizedBox(height: AppSpacing.lg),
            _GeneralSettingsSection(
              l10n: l10n,
          //    voiceAssistanceOn: voiceAssistanceOn,
              remindersOn: remindersOn,
           //   onVoiceAssistanceChanged: onVoiceAssistanceChanged,
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
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
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
                      _ageAndWeeksLabel(),
                      style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(_ProfileIcons.call, width: 16, height: 16),
                        const SizedBox(width: 6),
                        Text(_formatMobile(user.mobile), style: AppTypography.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
              // TODO: wire to an edit-profile route once one exists.
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.editProfileComingSoon)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(_ProfileIcons.edit, width: 42, height: 42),
                ),
              ),
            ],
          ),
          if (_locationLabel != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F0),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Row(
                children: [
                  Image.asset(_ProfileIcons.tag, width: 16, height: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _locationLabel!,
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

  // Confirmed against compute_pregnancy_info() in the backend: the
  // `pregnancy` map always has an int `gestational_week` key when `lmp`
  // is set.
  int? get _weeksPregnant {
    final v = pregnancy?['gestational_week'];
    if (v is int) return v;
    if (v is String) return int.tryParse(v);
    return null;
  }

  String _ageAndWeeksLabel() {
    final parts = <String>[];
    if (data.age != null) parts.add('${data.age} ${l10n.years}');
    final weeks = _weeksPregnant;
    if (weeks != null) parts.add('$weeks ${l10n.weeksPregnant}');
    return parts.isEmpty ? l10n.notProvided : parts.join(' • ');
  }

  String? get _locationLabel {
    final parts = [data.village, data.block, data.district]
        .where((e) => e != null && e.isNotEmpty)
        .toList();
    if (parts.isEmpty) return null;
    // State is hardcoded — this app only serves Chhattisgarh districts.
    return '${parts.join(', ')} (Chhattisgarh)';
  }

  String _formatMobile(String mobile) {
    final digits = mobile.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 10) {
      return '+91 ${digits.substring(0, 5)} ${digits.substring(5)}';
    }
    if (digits.length == 12 && digits.startsWith('91')) {
      final local = digits.substring(2);
      return '+91 ${local.substring(0, 5)} ${local.substring(5)}';
    }
    return mobile;
  }
}

class _Avatar extends StatelessWidget {
  final String? name;
  const _Avatar({this.name});

  @override
  Widget build(BuildContext context) {
    // NOTE: neither WomenProfileUserModel nor WomenProfileDataModel currently
    // expose a photo/avatar URL, so this renders initials on a tinted
    // background instead of a real photo. Swap in CachedNetworkImage once
    // a photo field is added to the API contract.
    final initial = (name != null && name!.isNotEmpty) ? name![0].toUpperCase() : '?';
    return Stack(
      children: [
        Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFFFE1DF),
            shape: BoxShape.circle,
          ),
          child: Text(
            initial,
            style: AppTypography.headlineMedium.copyWith(color: AppColors.sangwari),
          ),
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
// Quick-info row — Blood Group / Estimated Due Date / Assigned Mitanin
// ─────────────────────────────────────────────────────────────────────────────
class _QuickInfoRow extends StatelessWidget {
  final WomenProfileDataModel data;
  final AppLocalizations l10n;

  const _QuickInfoRow({required this.data, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 140,
            child: _StatCard(
              icon: _ProfileIcons.bloodGroup,
              label: l10n.bloodGroup,
              value: _formatBloodGroup(data.bloodGroup, l10n),
              valueColor: const Color(0xFFAF101A),
            )
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: SizedBox(
            height: 140,
            child: _StatCard(
              icon: _ProfileIcons.edd,
              label: l10n.estimatedDueDate,
              value: _formatDate(data.edd) ?? l10n.notProvided,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: SizedBox(
            height: 140,
            child: _StatCard(
              icon: _ProfileIcons.ashaProfile,
              label: l10n.assignedMitanin,
              value: data.ashaName ?? l10n.notProvided,
              // TODO: the Mitanin's phone number isn't part of
              // WomenProfileDataModel yet, so the Call action is a no-op for
              // now. Add an `asha_mobile` field to unlock real dialing.
              actionLabel: l10n.call,
              onAction: data.ashaName == null
                  ? null
                  : () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.contactUnavailable)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static String _formatBloodGroup(String? bg, AppLocalizations l10n) {
    if (bg == null || bg.isEmpty) return l10n.notProvided;
    if (bg.endsWith('+')) return '$bg\n(${l10n.positive})';
    if (bg.endsWith('-')) return '$bg\n(${l10n.negative})';
    return bg;
  }

  static String? _formatDate(String? iso) {
    if (iso == null) return null;
    final parsed = DateTime.tryParse(iso);
    if (parsed == null) return iso;
    return DateFormat('d MMM yyyy').format(parsed);
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final Color? valueColor;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        children: [
          Image.asset(icon, width: 28, height: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTypography.titleMedium.copyWith(
              fontSize: 14,
              color: valueColor ?? AppColors.bodyText,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (actionLabel != null) ...[
            const SizedBox(height: 4),
            GestureDetector(
              onTap: onAction,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(_ProfileIcons.call, width: 12, height: 12),
                  const SizedBox(width: 3),
                  Text(
                    actionLabel!,
                    style: AppTypography.bodySmall.copyWith(
                      color: const Color(0xFF388E3C),
                      fontWeight: FontWeight.w600,
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
}

// ─────────────────────────────────────────────────────────────────────────────
// General Settings — App Language / Voice Assistance / Reminders & Alerts
// ─────────────────────────────────────────────────────────────────────────────
class _GeneralSettingsSection extends StatelessWidget {
  final AppLocalizations l10n;
  //final bool voiceAssistanceOn;
  final bool remindersOn;
  //final ValueChanged<bool> onVoiceAssistanceChanged;
  final ValueChanged<bool> onRemindersChanged;

  const _GeneralSettingsSection({
    required this.l10n,
   // required this.voiceAssistanceOn,
    required this.remindersOn,
    //required this.onVoiceAssistanceChanged,
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
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: Column(
            children: [
              _SettingsRow(
                icon: _ProfileIcons.language,
                title: l10n.appLanguage,
                // TODO: subtitle should reflect the active LocaleNotifier
                // locale (e.g. via ref.watch(localeNotifierProvider)) once
                // this widget is converted to a ConsumerWidget.
                subtitle: Localizations.localeOf(context).languageCode == 'hi' ? l10n.hindi : l10n.english,
                trailing: Builder(
                  builder: (innerContext) => GestureDetector(
                    onTap: () => _showLanguageSheet(innerContext),
                    child: Text(
                      '${l10n.change} \u203a',
                      style: AppTypography.bodyMedium.copyWith(
                        color: const Color(0xFFAF101A),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFF0F0F0)),
              _SettingsRow(
                icon: _ProfileIcons.alert,
                title: l10n.remindersAlerts,
                subtitle: l10n.remindersAlertsDesc,
                trailing: Switch(
                  value: remindersOn,
                  activeThumbColor: Colors.white,
                  activeTrackColor: const Color(0xFF388E3C),
                  onChanged: onRemindersChanged,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg)),
      ),
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
                ListTile(
                  title: Text(l10n.english),
                  onTap: () => _selectLanguage(consumerContext, ref, 'en'),
                ),
                ListTile(
                  title: Text(l10n.hindi),
                  onTap: () => _selectLanguage(consumerContext, ref, 'hi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectLanguage(BuildContext context, WidgetRef ref, String code) {
    // TODO: confirm the exact provider name/method — assumed
    // `localeNotifierProvider.notifier.setLocale(Locale(code))` per the
    // pattern documented in the UI skill file.
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

  const _SettingsRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Image.asset(icon, width: 38, height: 38),
          ),
          const SizedBox(width: AppSpacing.sm),
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
// Log Out button
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
        decoration: BoxDecoration(
          color: const Color(0xFFFFE9E8),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_ProfileIcons.logout, width: 18, height: 18),
            const SizedBox(width: 8),
            Text(
              l10n.logOut,
              style: AppTypography.titleMedium.copyWith(color: AppColors.gradStart),
            ),
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
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await _performLogout(context, ref);
            },
            child: Text(l10n.logOut, style: const TextStyle(color: Color(0xFFAF101A))),
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
      // but still navigate away, since the user is effectively logged out.
      // TODO: confirm `Failure` exposes `.message` (assumed from the
      // common sealed-Failure pattern — didn't have failures.dart to check).
          (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message)),
      ),
          (_) {},
    );
    // TODO: confirm the actual login route path/name — GoRouter setup
    // (Routes constants, redirect logic, whether AuthEventBus already
    // handles this) wasn't shared, so this assumes '/login'.
    if (context.mounted) context.go('/login');
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
            Text(
              l10n.profileLoadError,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(onPressed: onRetry, child: Text(l10n.retry)),
          ],
        ),
      ),
    );
  }
}