import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/model/danger_sign_card_data.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_checklist_scaffold.dart';

class DangerSignsNewbornPage extends StatelessWidget {
  const DangerSignsNewbornPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BpcrChecklistScaffold(
      componentKey: 'dangerSignsNewborn',
      headerIcon: Icons.child_care_rounded,
      headerTitle: l10n.bpcr_newborn_title,
      cards: [
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_np_1.png',
          title: l10n.bpcr_newborn_card1_title,
          description: l10n.bpcr_newborn_card1_desc,
          accentColor: AppColors.riskRed,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_np_2.png',
          title: l10n.bpcr_newborn_card2_title,
          description: l10n.bpcr_newborn_card2_desc,
          accentColor: AppColors.infoBlue,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_np_3.png',
          title: l10n.bpcr_newborn_card3_title,
          description: l10n.bpcr_newborn_card3_desc,
          accentColor: AppColors.riskGreen,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_np_4.png',
          title: l10n.bpcr_newborn_card4_title,
          description: l10n.bpcr_newborn_card4_desc,
          accentColor: AppColors.infoPurple,
        ),
      ],
      onSubmitted: () => context.pop(),
    );
  }
}