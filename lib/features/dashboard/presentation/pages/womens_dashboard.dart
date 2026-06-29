import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';


class WomensDashboard extends ConsumerWidget {
  const WomensDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
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
            children: [
              // ── BPCR Full-width card ────────────────────────────────────
              _BpcrCard(l10n: l10n),
              const SizedBox(height: AppSpacing.md),

              // ── Maternal Benefit + Video Modules side-by-side ───────────
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: _MaternalBenefitCard(l10n: l10n)),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(child: _VideoModulesCard(l10n: l10n)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── ANC Services full-width card ────────────────────────────
              _AncServicesCard(l10n: l10n),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}
// ─────────────────────────────────────────────────────────────────────────────
// BPCR Card
// ─────────────────────────────────────────────────────────────────────────────
class _BpcrCard extends StatelessWidget {
  final AppLocalizations l10n;
  const _BpcrCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      backgroundColor: const Color(0xFFFFF0EE),
        onTap: () => context.pushNamed('bpcr'),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text + arrow
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${l10n.bpcrModule}',
                    style: AppTypography.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    '${l10n.bpcrdesc}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.hintText,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _ArrowButton(
                    onTap: () => context.pushNamed('bpcr'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            // Illustration
            Image.asset(
              'assets/icons/bpcr.png',
              width: 130,
              height: 130,
              fit: BoxFit.contain,
            ),
          ],
        ),

    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Maternal Benefit Program Card
// ─────────────────────────────────────────────────────────────────────────────

class _MaternalBenefitCard extends StatelessWidget {
  final AppLocalizations l10n;
  const _MaternalBenefitCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      backgroundColor: const Color(0xFFFFF0EE),
      onTap: () => context.pushNamed('maternalSchemes'),
      bottomRightWidget: Image.asset(
        'assets/icons/maternalSchemes.png',
        height: MediaQuery.of(context).size.height * 0.10,
        //fit: BoxFit.contain,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 32, height: 32,
              child: Image.asset('assets/icons/information.png')),
          const SizedBox(height: AppSpacing.sm),
          Text('${l10n.schemesTitle}', style: AppTypography.titleLarge),
          const SizedBox(height: AppSpacing.xs),
          Text('${l10n.maternalSchemesdesc}',
              style: AppTypography.bodySmall.copyWith(
                  color: AppColors.hintText, fontSize: 12)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
        ],
      ),
    );
  }
}
// ─────────────────────────────────────────────────────────────────────────────
// Video Modules Card
// ─────────────────────────────────────────────────────────────────────────────

class _VideoModulesCard extends StatelessWidget {
  final AppLocalizations l10n;
  const _VideoModulesCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      backgroundColor: const Color(0xFFE8F5F0),
      onTap: () => context.pushNamed('videoModules'),
      bottomRightWidget: Image.asset(
        'assets/icons/videoModule.png',
        height: MediaQuery.of(context).size.height * 0.10,
        fit: BoxFit.contain,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 32, height: 32,
              child: Image.asset('assets/icons/video.png')),
          const SizedBox(height: AppSpacing.sm),
          Text('${l10n.videomodule}', style: AppTypography.titleLarge),
          const SizedBox(height: AppSpacing.xs),
          Text('${l10n.videomoduledesc}',
              style: AppTypography.bodySmall.copyWith(
                  color: AppColors.hintText, fontSize: 12)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ANC Services Card
// ─────────────────────────────────────────────────────────────────────────────
class _AncServicesCard extends StatelessWidget {
  final AppLocalizations l10n;
  const _AncServicesCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      backgroundColor: const Color(0xFFFFF0EE),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${l10n.ancTitle}',
                  style: AppTypography.titleLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '${l10n.ancdesc}',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.hintText,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _ArrowButton(
                  onTap: () => context.pushNamed('ancServices'),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Image.asset(
            'assets/icons/anc.png',
            width: 130,
            height: 130,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared: Dashboard card shell
// ─────────────────────────────────────────────────────────────────────────────

class _DashboardCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final Widget? bottomRightWidget;  // ← add this

  const _DashboardCard({
    required this.child,
    required this.backgroundColor,
    this.onTap,
    this.bottomRightWidget,         // ← add this
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              // Padded content
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: child,
              ),
              // Image sits outside padding, pinned to bottom-right
              if (bottomRightWidget != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: bottomRightWidget!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
// ─────────────────────────────────────────────────────────────────────────────
// Shared: Golden arrow button (used on BPCR + ANC cards)
// ─────────────────────────────────────────────────────────────────────────────
class _ArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ArrowButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        child: Image.asset(
          'assets/icons/arrow.png',
        ),
      ),
    );
  }
}