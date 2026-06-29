import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/schemes/data/model/scheme_model.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

/// Route: /maternal-schemes
class MaternalSchemesPage extends ConsumerWidget {
  const MaternalSchemesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Back header row ─────────────────────────────────────────
          _SectionHeader(title: l10n.schemesTitle),
           SizedBox(height: 8,),
          // ── Explore label ────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.sm,
            ),
            child: Text(
              l10n.schemes_explore,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.hintText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // ── Scheme list ──────────────────────────────────────────────
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: kMaternalSchemes.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.greyBorder,
              ),
              itemBuilder: (context, index) {
                final scheme = kMaternalSchemes[index];
                return _SchemeListTile(scheme: scheme, l10n: l10n);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

// ── Section header with back arrow ────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFECF4FB),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm + 2,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back,
                size: 22, color: AppColors.bodyText),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(title, style: AppTypography.titleMedium),
        ],
      ),
    );
  }
}

// ── Single scheme tile ────────────────────────────────────────────────────────

class _SchemeListTile extends StatelessWidget {
  final SchemeItem scheme;
  final AppLocalizations l10n;

  const _SchemeListTile({required this.scheme, required this.l10n});

  String _nameFor(String id) {
    switch (id) {
      case 'jsy':       return l10n.jsy_name;
      case 'jssk':      return l10n.schemeJssk;
      case 'pmsma':     return l10n.schemePmsma;
      case 'pmmvy':     return l10n.schemePmmvy;
      case 'anganwadi': return l10n.anganwadi_name;
      case 'minimata':  return l10n.schemeMinimata;
      default:          return id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        'schemeDetail',
        pathParameters: {'id': scheme.id},
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            // Scheme icon
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                scheme.assetPath,
                fit: BoxFit.contain,
                // placeholderBuilder: (_) => Container(
                //   width: 52,
                //   height: 52,
                //   decoration: BoxDecoration(
                //     color: AppColors.fieldFill,
                //     borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                //   ),
                //   child: Center(
                //     child: Text(
                //       scheme.id[0].toUpperCase(),
                //       style: AppTypography.titleLarge
                //           .copyWith(color: AppColors.hintText),
                //     ),
                //   ),
                // ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Scheme name
            Expanded(
              child: Text(
                _nameFor(scheme.id),
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}