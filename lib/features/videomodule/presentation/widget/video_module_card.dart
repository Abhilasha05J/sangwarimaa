import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sangwari_maa/features/videomodule/data/model/video_module.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';

class VideoModuleCard extends StatelessWidget {
  final VideoModule video;
  final bool isHindi;

  const VideoModuleCard({super.key, required this.video, required this.isHindi});

  // Future<void> _openLink() async {
  //   final uri = Uri.parse(video.videoUrl);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   }
  // }
  Future<void> _openLink() async {
    final uri = Uri.parse(video.videoUrl);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('Could not launch: ${video.videoUrl}');
      }
    } catch (e) {
      debugPrint('Launch error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final title = isHindi ? video.titleHi : video.titleEn;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: GestureDetector(
        onTap: _openLink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: video.thumbnailUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(color: AppColors.fieldFill),
                  errorWidget: (_, __, ___) => Container(
                    color: AppColors.fieldFill,
                    child: const Icon(Icons.play_circle_outline, size: 40),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              video.videoUrl,
              style: AppTypography.bodySmall.copyWith(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.sm),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}