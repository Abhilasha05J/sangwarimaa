import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/model/danger_sign_card_data.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_checklist_scaffold.dart';

class DangerSignsLaborPage extends StatelessWidget {
  const DangerSignsLaborPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BpcrChecklistScaffold(
      componentKey: 'dangerSignsLabor',
      headerIcon: Icons.warning_rounded,
      headerTitle: l10n.bpcr_danger_labor_title,
      cards: [
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_lc_1.png',
          title: l10n.bpcr_labor_card1_title,
          description: l10n.bpcr_labor_card1_desc,
          accentColor: AppColors.riskRed,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_lc_2.png',
          title: l10n.bpcr_labor_card2_title,
          description: l10n.bpcr_labor_card2_desc,
          accentColor: AppColors.infoPurple,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_lc_3.png',
          title: l10n.bpcr_labor_card3_title,
          description: l10n.bpcr_labor_card3_desc,
          accentColor: AppColors.infoBlue,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_lc_4.png',
          title: l10n.bpcr_labor_card4_title,
          description: l10n.bpcr_labor_card4_desc,
          accentColor: AppColors.riskYellow,
        ),
      ],
      onSubmitted: () => context.pop(),
    );
  }
}