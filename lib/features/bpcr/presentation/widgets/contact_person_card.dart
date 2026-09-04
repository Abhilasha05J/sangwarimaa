import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/features/bpcr/data/model/contact_person_data.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';

class ContactPersonCard extends StatelessWidget {
  final ContactPersonData data;
  final VoidCallback onCall;
  final VoidCallback? onAltCall;
  final VoidCallback? onGetDirection;

  const ContactPersonCard({
    super.key,
    required this.data,
    required this.onCall,
    this.onAltCall,
    this.onGetDirection,
  });

  // ASHA/Mitanin cards show their own village/distance line via
  // locationLabel, and there's no "navigate to a facility" concept for a
  // community worker — so both the location row and the distance/Get
  // Direction row are suppressed for that role.
  bool get _isAshaOrMitanin {
    final role = data.roleLabel.toLowerCase();
    return role.contains('asha') || role.contains('mitanin');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: const Color(0xFFC0C0C0)),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCE4E4),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: Text(data.roleLabel, style: AppTypography.bodySmall.copyWith(color: AppColors.riskRed, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(data.name, style: AppTypography.titleMedium),
                    if (data.subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(data.subtitle!, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                    ],
                    if (data.availability != null) ...[
                      const SizedBox(height: 6),
                      Row(children: [
                        const Icon(Icons.access_time_rounded, size: 14, color: AppColors.hintText),
                        const SizedBox(width: 4),
                        Text(data.availability!, style: AppTypography.bodySmall),
                      ]),
                    ],
                    // Village/location line is ASHA-specific text (village
                    // + on-foot distance from beneficiary's house) — kept
                    // out of the facility-style distance row below.
                    if (!_isAshaOrMitanin && data.locationLabel != null) ...[
                      const SizedBox(height: 4),
                      Row(children: [
                        const Icon(Icons.location_on_outlined, size: 14, color: AppColors.hintText),
                        const SizedBox(width: 4),
                        Expanded(child: Text(data.locationLabel!, style: AppTypography.bodySmall)),
                      ]),
                    ],
                  ],
                ),
              ),
              _CircleIconButton(onTap: onCall),
            ],
          ),
          if (!_isAshaOrMitanin && (data.distanceKm != null || onGetDirection != null)) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (data.distanceKm != null)
                  Row(children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.hintText),
                    const SizedBox(width: 4),
                    Text('${data.distanceKm} Km', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
                  ])
                else
                  const SizedBox.shrink(),
                if (onGetDirection != null)
                  OutlinedButton.icon(
                    onPressed: onGetDirection,
                    icon: const Icon(Icons.directions_rounded, size: 16, color: AppColors.riskGreen),
                    label: Text(l10n.facilityGetDirections, style: AppTypography.bodyMedium.copyWith(color: AppColors.riskGreen)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.riskGreen),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CircleIconButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        child: Image.asset('assets/icons/callemer.png'),
      ),
    );
  }
}