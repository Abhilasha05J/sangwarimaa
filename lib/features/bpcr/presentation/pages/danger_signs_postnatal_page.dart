import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/model/danger_sign_card_data.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/bpcr_checklist_scaffold.dart';

class DangerSignsPostnatalPage extends StatelessWidget {
  const DangerSignsPostnatalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BpcrChecklistScaffold(
      componentKey: 'dangerSignsPostnatal',
      headerIcon: Icons.healing_rounded,
      headerTitle: l10n.bpcr_postnatal_title,
      cards: [
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_pp_1.png',
          title: l10n.bpcr_postnatal_card1_title,
          description: l10n.bpcr_postnatal_card1_desc,
          accentColor: AppColors.riskRed,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_pp_2.png',
          title: l10n.bpcr_postnatal_card2_title,
          description: l10n.bpcr_postnatal_card2_desc,
          accentColor: AppColors.infoPurple,
        ),
        DangerSignCardData(
          imageAsset: 'assets/images/danger_sign_pp_3.png',
          title: l10n.bpcr_postnatal_card3_title,
          description: l10n.bpcr_postnatal_card3_desc,
          accentColor: AppColors.riskYellow,
        ),
      ],
      onSubmitted: () => context.pop(),
    );
  }
}