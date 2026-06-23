import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/features/Emergency/data/model/emergency_args.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

/// Pass [dangerSign] and [mitaninName] / [mitaninLocation] via go_router extras:
///   context.pushNamed('emergency', extra: EmergencyArgs(...))

class EmergencyScreen extends ConsumerStatefulWidget {
  final EmergencyArgs args;
  const EmergencyScreen({super.key, required this.args});

  @override
  ConsumerState<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends ConsumerState<EmergencyScreen> {
  bool _helpArrived = false;

  Future<void> _call(String number) async {
    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _openMaps(String facilityName) async {
    final query = Uri.encodeComponent(facilityName);
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final args = widget.args;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Danger sign header ──────────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning_rounded,
                    color: Color(0xFFE53935),
                    size: 36,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DANGER SIGN DETECTED',
                        style: AppTypography.titleMedium.copyWith(
                          color: const Color(0xFFE53935),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        args.dangerSign,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.hintText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Call Ambulance card ─────────────────────────────────────
              _EmergencyCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ambulance.png',
                          width: 36,
                          height: 36,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text('Call Ambulance', style: AppTypography.titleMedium),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Expanded(
                          child: _CallButton(
                            label: 'Call 108',
                            onTap: () => _call('108'),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: _CallButton(
                            label: 'Call 102',
                            onTap: () => _call('102'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Notify Mitanin card ─────────────────────────────────────
              _EmergencyCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/mitanin.png',
                          width: 36,
                          height: 36,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              args.mitaninName,
                              style: AppTypography.titleMedium,
                            ),
                            Text(
                              args.mitaninLocation,
                              style: AppTypography.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _TealButton(
                      label: 'Notify & Call Mitanin',
                      iconAsset: 'assets/icons/phone_call.png',
                      onTap: () => _call(args.mitaninPhone),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Nearest Health Facility card ────────────────────────────
              _EmergencyCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/hospital.png',
                          width: 36,
                          height: 36,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nearest Health Facility',
                                style: AppTypography.titleMedium,
                              ),
                              Text(
                                '${args.facilityName} (${args.facilityDistKm} km)',
                                style: AppTypography.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _OutlinedTealButton(
                      label: 'Get Direction',
                      onTap: () => _openMaps(args.facilityName),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Call Family + View Instruction row ─────────────────────
              Row(
                children: [
                  Expanded(
                    child: _SmallActionCard(
                      iconAsset: 'assets/icons/family.png',
                      label: 'Call Family',
                      onTap: () => _call(args.familyPhone),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: _SmallActionCard(
                      iconAsset: 'assets/icons/instructions.png',
                      label: 'View Instruction',
                      onTap: () {
                        // TODO: navigate to instruction detail
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Help arrived checkbox ───────────────────────────────────
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.gradStart.withOpacity(0.5),
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Has help arrived yet?',
                      style: AppTypography.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Checkbox(
                          value: _helpArrived,
                          onChanged: (val) =>
                              setState(() => _helpArrived = val ?? false),
                          activeColor: AppColors.gradStart,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          'I am now with medical professional',
                          style: AppTypography.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

class _EmergencyCard extends StatelessWidget {
  final Widget child;
  const _EmergencyCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0EE),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: child,
    );
  }
}

class _CallButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _CallButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          gradient: AppColors.primaryButtonGradient,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone_rounded, color: AppColors.white, size: 16),
            const SizedBox(width: 6),
            Text(label, style: AppTypography.labelLarge.copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class _TealButton extends StatelessWidget {
  final String label;
  final String iconAsset;
  final VoidCallback onTap;
  const _TealButton({
    required this.label,
    required this.iconAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF00897B),
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconAsset, width: 20, height: 20, color: AppColors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTypography.labelLarge.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutlinedTealButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlinedTealButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF00897B), width: 1.5),
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_rounded,
                color: Color(0xFF00897B), size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTypography.titleMedium.copyWith(
                color: const Color(0xFF00897B),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallActionCard extends StatelessWidget {
  final String iconAsset;
  final String label;
  final VoidCallback onTap;
  const _SmallActionCard({
    required this.iconAsset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF0EE),
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconAsset, width: 40, height: 40),
            const SizedBox(height: AppSpacing.sm),
            Text(label, style: AppTypography.bodyMedium),
          ],
        ),
      ),
    );
  }
}