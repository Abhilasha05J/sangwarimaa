// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/shared/widgets/app_bar.dart';
// import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
//
// class VideoModulesScreen extends ConsumerWidget {
//   const VideoModulesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     final l10n = AppLocalizations.of(context)!;
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: TopBar(l10n: l10n),
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             // ── Sub header with back arrow ────────────────────────────────
//             _SubHeader(
//               title: l10n.videomodule,
//               onBack: () => context.pop(),
//             ),
//
//
//           ],
//         ),
//       ),
//       bottomNavigationBar: const AppBottomNavBar(currentIndex: 1,),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// // Sub header (back arrow + title) — light blue strip under TopBar
// // ─────────────────────────────────────────────────────────────────────────────
// class _SubHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback onBack;
//
//   const _SubHeader({required this.title, required this.onBack});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFFE8F1FB),
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppSpacing.md,
//         vertical: AppSpacing.sm,
//       ),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: onBack,
//             child: Icon(
//               Icons.arrow_back_rounded,
//               color: AppColors.bodyText,
//               size: 22,
//             ),
//           ),
//           const SizedBox(width: AppSpacing.sm),
//           Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }
//
//
//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/features/videomodule/data/model/video_module.dart';
import 'package:sangwari_maa/features/videomodule/presentation/provider/video_module_provider.dart';
import 'package:sangwari_maa/features/videomodule/presentation/widget/video_filter_chip.dart';
import 'package:sangwari_maa/features/videomodule/presentation/widget/video_module_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

class VideoModulesScreen extends ConsumerWidget {
  const VideoModulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final videosAsync = ref.watch(filteredVideoModulesProvider);
    final currentFilter = ref.watch(videoFilterProvider);
    final isHindi = Localizations.localeOf(context).languageCode == 'hi';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _SubHeader(
              title: l10n.videomodule,
              onBack: () => context.pop(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  VideoFilterChip(
                    label: l10n.videoFilterAll,
                    selected: currentFilter == VideoFilter.all,
                    onTap: () => ref
                        .read(videoFilterProvider.notifier)
                        .select(VideoFilter.all),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  VideoFilterChip(
                    label: l10n.videoFilterBpcr,
                    selected: currentFilter == VideoFilter.bpcr,
                    onTap: () => ref
                        .read(videoFilterProvider.notifier)
                        .select(VideoFilter.bpcr),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: VideoFilterChip(
                      label: l10n.videoFilterPnc,
                      selected: currentFilter == VideoFilter.pnc,
                      onTap: () => ref
                          .read(videoFilterProvider.notifier)
                          .select(VideoFilter.pnc),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: videosAsync.when(
                loading: () => Skeletonizer(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    itemCount: 3,
                    itemBuilder: (_, __) => const VideoModuleCard(
                      video: _placeholderVideo,
                      isHindi: false,
                    ),
                  ),
                ),
                error: (e, _) => Center(
                  child: Text(l10n.videoLoadError, style: AppTypography.bodyMedium),
                ),
                data: (videos) => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: videos.length,
                  itemBuilder: (_, i) => VideoModuleCard(
                    video: videos[i],
                    isHindi: isHindi,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}

const _placeholderVideo = VideoModule(
  id: 'placeholder',
  category: VideoCategory.bpcr,
  titleEn: 'Loading video title that wraps two lines here',
  titleHi: '',
  videoUrl: 'https://youtube.com',
  thumbnailUrl: '',
);

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