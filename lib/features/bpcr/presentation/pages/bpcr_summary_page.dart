// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/shared/widgets/app_bar.dart';
// import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_summary_models.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_summary_providers.dart';
//
// class BpcrSummaryPage extends ConsumerStatefulWidget {
//   const BpcrSummaryPage({super.key});
//
//   @override
//   ConsumerState<BpcrSummaryPage> createState() => _BpcrSummaryPageState();
// }
//
// class _BpcrSummaryPageState extends ConsumerState<BpcrSummaryPage> {
//   final _scrollController = ScrollController();
//   final _timelineKey = GlobalKey();
//   final _checklistKey = GlobalKey();
//   final _emergencyKey = GlobalKey();
//
//   void _scrollTo(GlobalKey key) {
//     final ctx = key.currentContext;
//     if (ctx != null) {
//       Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
//     }
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final score = ref.watch(bpcrScoreProvider);
//     final progressLabel = ref.watch(bpcrCurrentProgressLabelProvider);
//     final dueDate = ref.watch(bpcrDueDateLabelProvider);
//     final milestones = ref.watch(journeyMilestonesProvider);
//     final checklist = ref.watch(domainChecklistProvider);
//     final contacts = ref.watch(emergencyContactsProvider);
//     final completedMilestones = milestones.where((m) => m.status == MilestoneStatus.completed).length;
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: TopBar(l10n: l10n),
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             _SubHeader(title: 'BPCR', onBack: () => context.pop()),
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 physics: const BouncingScrollPhysics(),
//                 padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _IndexEntryCard(onView: () => context.pushNamed('bpcrComponents')),
//                     const SizedBox(height: AppSpacing.md),
//                     _ScoreCard(score: score, progressLabel: progressLabel, dueDate: dueDate),
//                     const SizedBox(height: AppSpacing.md),
//                     _QuickNavTabs(
//                       onTimeline: () => _scrollTo(_timelineKey),
//                       onChecklist: () => _scrollTo(_checklistKey),
//                       onEmergency: () => _scrollTo(_emergencyKey),
//                     ),
//                     const SizedBox(height: AppSpacing.md),
//                     const _AiRecommendationCard(),
//                     const SizedBox(height: AppSpacing.md),
//                     Container(
//                       key: _timelineKey,
//                       child: _JourneyMilestonesCard(milestones: milestones, completedCount: completedMilestones),
//                     ),
//                     const SizedBox(height: AppSpacing.md),
//                     Container(
//                       key: _checklistKey,
//                       child: _DomainChecklistCard(items: checklist, score: score),
//                     ),
//                     const SizedBox(height: AppSpacing.md),
//                     Container(
//                       key: _emergencyKey,
//                       child: _EmergencyHubCard(contacts: contacts),
//                     ),
//                     const SizedBox(height: AppSpacing.lg),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _SubHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback onBack;
//   const _SubHeader({required this.title, required this.onBack});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xFFE8F1FB),
//       padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
//       child: Row(children: [
//         GestureDetector(onTap: onBack, child: const Icon(Icons.arrow_back_rounded, color: AppColors.bodyText, size: 22)),
//         const SizedBox(width: AppSpacing.sm),
//         Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
//       ]),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _IndexEntryCard extends StatelessWidget {
//   final VoidCallback onView;
//   const _IndexEntryCard({required this.onView});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//         border: Border.all(color: const Color(0xFFEDEDED)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('BPCR Index (10 components)', style: AppTypography.titleMedium),
//           GestureDetector(
//             onTap: onView,
//             child: Row(children: [
//               Text('View', style: AppTypography.titleMedium.copyWith(color: AppColors.riskGreen)),
//               const Icon(Icons.chevron_right_rounded, color: AppColors.riskGreen, size: 20),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _ScoreCard extends StatelessWidget {
//   final int score;
//   final String progressLabel;
//   final String dueDate;
//   const _ScoreCard({required this.score, required this.progressLabel, required this.dueDate});
//
//   String get _band {
//     if (score < 40) return 'High Risk';
//     if (score < 60) return 'Poor Preparedness';
//     if (score < 75) return 'Moderate Preparedness';
//     if (score < 90) return 'Good Preparedness';
//     return 'Excellent Preparedness';
//   }
//
//   int get _pendingToGood => math.max(0, ((75 - score) / 10).ceil());
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(colors: [Color(0xFFFFF3F0), Color(0xFFFFFFFF)]),
//         borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//         border: Border.all(color: const Color(0xFFEDEDED)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('CURRENT PROGRESS', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                     Text(progressLabel, style: AppTypography.titleLarge.copyWith(color: AppColors.pinkText)),
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('EXPECTED DUE DATE', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                   Text(dueDate, style: AppTypography.titleMedium),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: AppSpacing.md),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
//                       Text('$score', style: AppTypography.headlineMedium.copyWith(fontSize: 36)),
//                       Text(' / 100', style: AppTypography.titleMedium.copyWith(color: AppColors.hintText)),
//                     ]),
//                     const SizedBox(height: 6),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                       decoration: BoxDecoration(color: const Color(0xFFFDF1DD), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//                       child: Row(mainAxisSize: MainAxisSize.min, children: [
//                         const Icon(Icons.warning_amber_rounded, size: 14, color: AppColors.amberPending),
//                         const SizedBox(width: 4),
//                         Text(_band, style: AppTypography.bodySmall.copyWith(color: AppColors.amberPending, fontWeight: FontWeight.w600)),
//                       ]),
//                     ),
//                     const SizedBox(height: 6),
//                     Text('$_pendingToGood tasks pending to achieve "Good" (≥75)', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                   ],
//                 ),
//               ),
//               _DashedProgressRing(percent: score / 100),
//             ],
//           ),
//           const SizedBox(height: AppSpacing.md),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: LinearProgressIndicator(
//               value: score / 100,
//               minHeight: 8,
//               backgroundColor: const Color(0xFFF0F0F0),
//               valueColor: const AlwaysStoppedAnimation(AppColors.amberPending),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _DashedProgressRing extends StatelessWidget {
//   final double percent; // 0..1
//   const _DashedProgressRing({required this.percent});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 72,
//       height: 72,
//       child: CustomPaint(
//         painter: _DashedRingPainter(percent: percent, color: AppColors.amberPending),
//         child: Center(
//           child: Text('${(percent * 100).round()}%', style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700)),
//         ),
//       ),
//     );
//   }
// }
//
// class _DashedRingPainter extends CustomPainter {
//   final double percent;
//   final Color color;
//   _DashedRingPainter({required this.percent, required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = size.center(Offset.zero);
//     final radius = size.width / 2 - 4;
//     const dashCount = 40;
//     const gapFraction = 0.4;
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4
//       ..strokeCap = StrokeCap.round;
//
//     final filledDashes = (dashCount * percent).round();
//     for (int i = 0; i < dashCount; i++) {
//       final startAngle = (i / dashCount) * 2 * math.pi - math.pi / 2;
//       final sweep = (2 * math.pi / dashCount) * (1 - gapFraction);
//       paint.color = i < filledDashes ? color : const Color(0xFFEFEFEF);
//       canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweep, false, paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant _DashedRingPainter oldDelegate) => oldDelegate.percent != percent;
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _QuickNavTabs extends StatelessWidget {
//   final VoidCallback onTimeline;
//   final VoidCallback onChecklist;
//   final VoidCallback onEmergency;
//   const _QuickNavTabs({required this.onTimeline, required this.onChecklist, required this.onEmergency});
//
//   @override
//   Widget build(BuildContext context) {
//     Widget tab(String label, VoidCallback onTap, {bool emphasize = false}) => Expanded(
//       child: OutlinedButton(
//         onPressed: onTap,
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Color(0xFFEDEDED)),
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//         ),
//         child: Text(label, style: AppTypography.bodyMedium.copyWith(color: emphasize ? AppColors.riskRed : AppColors.bodyText, fontWeight: emphasize ? FontWeight.w600 : FontWeight.normal)),
//       ),
//     );
//
//     return Row(children: [
//       tab('Timeline', onTimeline),
//       const SizedBox(width: AppSpacing.sm),
//       tab('Checklist', onChecklist),
//       const SizedBox(width: AppSpacing.sm),
//       tab('Emergency SOS', onEmergency, emphasize: true),
//     ]);
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _AiRecommendationCard extends StatelessWidget {
//   const _AiRecommendationCard();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(color: AppColors.aiCardGreen, borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(children: [
//             const Icon(Icons.eco_rounded, color: AppColors.riskGreen, size: 20),
//             const SizedBox(width: 6),
//             Text('AI RECOMMENDATION', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w700)),
//             const SizedBox(width: 8),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//               decoration: BoxDecoration(color: AppColors.riskGreen, borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//               child: const Text('Priority', style: TextStyle(color: Colors.white, fontSize: 11)),
//             ),
//           ]),
//           const SizedBox(height: AppSpacing.sm),
//           Text(
//             'Good progress, but transport & donor details are unconfirmed. Secure your vehicle backup before Week 36 to enter the safe zone.',
//             style: AppTypography.bodyMedium,
//           ),
//           const SizedBox(height: AppSpacing.sm),
//           GestureDetector(
//             onTap: () {},
//             child: Row(mainAxisSize: MainAxisSize.min, children: [
//               Text('Review Preparation Steps', style: AppTypography.bodyMedium.copyWith(color: AppColors.riskGreen, decoration: TextDecoration.underline, fontWeight: FontWeight.w600)),
//               const SizedBox(width: 4),
//               const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.riskGreen),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _JourneyMilestonesCard extends StatelessWidget {
//   final List<JourneyMilestone> milestones;
//   final int completedCount;
//   const _JourneyMilestonesCard({required this.milestones, required this.completedCount});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//         border: Border.all(color: const Color(0xFFEDEDED)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             Row(children: [
//               const Icon(Icons.bolt_rounded, color: AppColors.amberPending, size: 20),
//               const SizedBox(width: 6),
//               Text('Journey Milestones', style: AppTypography.titleMedium),
//             ]),
//             Text('$completedCount of ${milestones.length} Completed', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//           ]),
//           const SizedBox(height: AppSpacing.md),
//           for (int i = 0; i < milestones.length; i++)
//             _MilestoneTile(milestone: milestones[i], isLast: i == milestones.length - 1),
//         ],
//       ),
//     );
//   }
// }
//
// class _MilestoneTile extends StatelessWidget {
//   final JourneyMilestone milestone;
//   final bool isLast;
//   const _MilestoneTile({required this.milestone, required this.isLast});
//
//   Color get _dotColor {
//     switch (milestone.status) {
//       case MilestoneStatus.completed:
//         return AppColors.riskGreen;
//       case MilestoneStatus.actionRequired:
//         return AppColors.amberPending;
//       case MilestoneStatus.upcoming:
//         return const Color(0xFFD9D9D9);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isAction = milestone.status == MilestoneStatus.actionRequired;
//     final isUpcoming = milestone.status == MilestoneStatus.upcoming;
//
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(children: [
//             Container(
//               width: 18, height: 18,
//               decoration: BoxDecoration(shape: BoxShape.circle, color: _dotColor),
//               child: milestone.status == MilestoneStatus.completed
//                   ? const Icon(Icons.check, size: 12, color: Colors.white)
//                   : null,
//             ),
//             if (!isLast) Expanded(child: Container(width: 2, color: const Color(0xFFE0E0E0))),
//           ]),
//           const SizedBox(width: AppSpacing.sm),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: AppSpacing.md),
//               child: Container(
//                 padding: isAction ? const EdgeInsets.all(AppSpacing.sm) : EdgeInsets.zero,
//                 decoration: isAction
//                     ? BoxDecoration(color: const Color(0xFFFDF6E3), borderRadius: BorderRadius.circular(AppSpacing.radiusSm), border: Border.all(color: const Color(0xFFF3E0AE)))
//                     : null,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(children: [
//                       Expanded(child: Text(milestone.weekLabel, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontWeight: FontWeight.w600))),
//                       if (isAction)
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                           decoration: BoxDecoration(color: AppColors.amberPending, borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//                           child: const Text('PENDING', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
//                         ),
//                     ]),
//                     const SizedBox(height: 2),
//                     Text(milestone.title, style: AppTypography.titleMedium.copyWith(color: isUpcoming ? AppColors.hintText : AppColors.bodyText)),
//                     const SizedBox(height: 2),
//                     Text(milestone.description, style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//                     if (milestone.ctaLabel != null) ...[
//                       const SizedBox(height: AppSpacing.sm),
//                       ElevatedButton.icon(
//                         onPressed: () {},
//                         icon: const Icon(Icons.add, size: 16, color: Colors.white),
//                         label: Text(milestone.ctaLabel!, style: const TextStyle(color: Colors.white)),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.riskGreen,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           minimumSize: const Size(double.infinity, 0),
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _DomainChecklistCard extends StatelessWidget {
//   final List<DomainChecklistItem> items;
//   final int score;
//   const _DomainChecklistCard({required this.items, required this.score});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
//         border: Border.all(color: const Color(0xFFEDEDED)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             Text('BPCR Domain Checklist', style: AppTypography.titleMedium),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               decoration: BoxDecoration(color: const Color(0xFFFCE4E4), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//               child: Text('$score / 100 PTS', style: AppTypography.bodySmall.copyWith(color: AppColors.riskRed, fontWeight: FontWeight.w700)),
//             ),
//           ]),
//           Text('Maternal score components and status', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//           const SizedBox(height: AppSpacing.md),
//           for (final item in items) _DomainRow(item: item),
//           const SizedBox(height: AppSpacing.sm),
//           Text('SCORE INTERPRETATION LEGEND', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, letterSpacing: 0.5)),
//           const SizedBox(height: AppSpacing.sm),
//           _ScoreLegend(score: score),
//         ],
//       ),
//     );
//   }
// }
//
// class _DomainRow extends StatelessWidget {
//   final DomainChecklistItem item;
//   const _DomainRow({required this.item});
//
//   Color get _statusColor {
//     switch (item.status) {
//       case DomainStatus.completed:
//         return AppColors.riskGreen;
//       case DomainStatus.pending:
//         return AppColors.amberPending;
//       case DomainStatus.action:
//         return AppColors.riskRed;
//     }
//   }
//
//   String get _statusLabel {
//     switch (item.status) {
//       case DomainStatus.completed:
//         return 'COMPLETED';
//       case DomainStatus.pending:
//         return 'PENDING';
//       case DomainStatus.action:
//         return 'ACTION';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isIssue = item.status != DomainStatus.completed;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.label, style: AppTypography.bodyMedium),
//                 Text(item.subtitle, style: AppTypography.bodySmall.copyWith(color: isIssue ? AppColors.riskRed : AppColors.hintText)),
//               ],
//             ),
//           ),
//           Text('${item.scoreEarned}/${item.scoreMax}', style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
//           const SizedBox(width: AppSpacing.sm),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//             decoration: BoxDecoration(color: _statusColor.withOpacity(0.12), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//             child: Text(_statusLabel, style: TextStyle(color: _statusColor, fontSize: 10, fontWeight: FontWeight.w700)),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _ScoreLegend extends StatelessWidget {
//   final int score;
//   const _ScoreLegend({required this.score});
//
//   static const _bands = [
//     (0, 39, '<40', 'High Risk', Color(0xFFF5D0D0)),
//     (40, 59, '40-59', 'Poor', Color(0xFFF0E4D0)),
//     (60, 74, '60-74', 'Moderate', Color(0xFFFCE9C0)),
//     (75, 89, '75-89', 'Good', Color(0xFFD9EEDC)),
//     (90, 100, '90-100', 'Excellent', Color(0xFFC5E8CC)),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: _bands.map((b) {
//         final (min, max, rangeLabel, name, bg) = b;
//         final active = score >= min && score <= max;
//         return Expanded(
//           child: Container(
//             margin: const EdgeInsets.only(right: 4),
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: active ? bg : Colors.transparent,
//               borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
//               border: active ? Border.all(color: AppColors.amberPending, width: 1.5) : Border.all(color: const Color(0xFFEDEDED)),
//             ),
//             child: Column(children: [
//               Text(rangeLabel, style: AppTypography.bodySmall.copyWith(fontSize: 10, color: AppColors.hintText)),
//               Text(name, style: AppTypography.bodySmall.copyWith(fontSize: 10, fontWeight: FontWeight.w700)),
//             ]),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────
// class _EmergencyHubCard extends StatelessWidget {
//   final List<EmergencyContact> contacts;
//   const _EmergencyHubCard({required this.contacts});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(color: AppColors.emergencyBg, borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('EMERGENCY PREPAREDNESS HUB', style: AppTypography.titleMedium.copyWith(color: AppColors.emergencyMaroon)),
//           const SizedBox(height: 4),
//           Text('One-tap emergency assistance during labor or complications.', style: AppTypography.bodySmall.copyWith(color: AppColors.emergencyMaroon)),
//           const SizedBox(height: AppSpacing.md),
//           Row(children: [
//             Expanded(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text('GOVT AMBULANCE', style: AppTypography.bodySmall.copyWith(color: AppColors.emergencyMaroon)),
//                 Text('108 / 102', style: AppTypography.titleMedium.copyWith(color: AppColors.emergencyMaroon)),
//               ]),
//             ),
//             Expanded(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text('DISTRICT HOSPITAL', style: AppTypography.bodySmall.copyWith(color: AppColors.emergencyMaroon)),
//                 Text('0771-2442', style: AppTypography.titleMedium.copyWith(color: AppColors.emergencyMaroon)),
//               ]),
//             ),
//           ]),
//           const SizedBox(height: AppSpacing.md),
//           Container(
//             padding: const EdgeInsets.all(AppSpacing.sm),
//             decoration: BoxDecoration(color: AppColors.emergencyMaroon, borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
//             child: Column(
//               children: contacts
//                   .map((c) => Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 6),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(c.label, style: const TextStyle(color: Colors.white)),
//                     // TODO: url_launcher tel: link once added to project.
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(c.number, style: const TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
//                     ),
//                   ],
//                 ),
//               ))
//                   .toList(),
//             ),
//           ),
//           const SizedBox(height: AppSpacing.md),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton.icon(
//               // TODO: wire real emergency call action.
//               onPressed: () {},
//               icon: const Icon(Icons.call, color: Colors.white),
//               label: const Text('SOS EMERGENCY CALL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.riskRed,
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_score_model.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_summary_providers.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

// Domain -> (label, icon, route-to-fix-it-or-null).
// pregnancy_registration / anc_completion route to the real ANC Services
// screen (Routes.ancServices / name 'ancServices') since that's where those
// two are actually tracked and editable.
const _domainMeta = <String, (String label, IconData icon, String? route)>{
  'pregnancy_registration': ('Pregnancy registration (MCP card)', Icons.badge_outlined, 'ancServices'),
  'anc_completion': ('Minimum 4 ANC completions', Icons.local_hospital_outlined, 'ancServices'),
  'facility_identified': ('Health facility identified', Icons.local_hospital, 'healthFacilityId'),
  'sba_identified': ('Skilled birth attendant identified', Icons.medical_services_outlined, 'skillBirthAttendant'),
  'transport_plan': ('Emergency transport arranged', Icons.local_taxi_outlined, 'transportModality'),
  'backup_transport': ('Backup transport arranged', Icons.directions_car_outlined, 'transportModality'),
  'birth_companion': ('Birth companion designated', Icons.people_outline, 'transportModality'),
  'emergency_contacts': ('Emergency contact numbers saved', Icons.contact_phone_outlined, null),
  'financial_preparedness': ('Funds for birth & emergency', Icons.savings_outlined, 'savedMoneyDelivery'),
  'blood_group_known': ('Blood group known', Icons.bloodtype_outlined, null),
  'blood_donor_identified': ('Blood donor identified', Icons.bloodtype, 'communityBloodDonor'),
  'delivery_bag': ('Delivery bag prepared', Icons.card_travel_outlined, null), // inline, not a route
  'danger_signs_knowledge': ('Danger signs awareness', Icons.warning_amber_outlined, null),
  'family_counselling': ('Family BPCR counselling completed', Icons.groups_outlined, null),
};

class BpcrSummaryPage extends ConsumerWidget {
  const BpcrSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final scoreAsync = ref.watch(bpcrScoreProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _SubHeader(title: l10n.bpcr_summary_title, onBack: () => context.pop()),
            Expanded(
              child: scoreAsync.when(
                loading: () => const Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
                error: (e, _) => Center(child: Text(l10n.bpcr_answers_load_error)),
                data: (score) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _IndexEntryCard(onView: () => context.pushNamed('bpcrComponents')),
                      const SizedBox(height: AppSpacing.md),
                      _ScoreCard(score: score),
                      const SizedBox(height: AppSpacing.lg),
                      _DomainChecklistCard(score: score),
                      const SizedBox(height: AppSpacing.lg),
                    ],
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

class _SubHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  const _SubHeader({required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE8F1FB),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(children: [
        GestureDetector(onTap: onBack, child: const Icon(Icons.arrow_back_rounded, color: AppColors.bodyText, size: 22)),
        const SizedBox(width: AppSpacing.sm),
        Text(title, style: AppTypography.titleLarge.copyWith(fontSize: 18)),
      ]),
    );
  }
}

// ── Index entry card — link to the 10-component menu (danger signs etc.) ──
// Restored: this is still the only way to reach the 4 danger-sign screens
// and the plain (non-summary) BPCR menu, since the summary page replaced
// the old BpcrScreen as the entry point per the earlier router change.

class _IndexEntryCard extends StatelessWidget {
  final VoidCallback onView;
  const _IndexEntryCard({required this.onView});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(l10n.bpcr_index_title, style: AppTypography.titleMedium),
          GestureDetector(
            onTap: onView,
            child: Row(children: [
              Text(l10n.viewAll, style: AppTypography.titleMedium.copyWith(color: AppColors.riskGreen)),
              const Icon(Icons.chevron_right_rounded, color: AppColors.riskGreen, size: 20),
            ]),
          ),
        ],
      ),
    );
  }
}

// ── Score card ──────────────────────────────────────────────────────────

Color _bandColor(String band) => switch (band) {
  'excellent' => AppColors.riskGreen,
  'good' => AppColors.riskGreen,
  'moderate' => const Color(0xFFF0A93B),
  'poor' => AppColors.riskRed,
  _ => AppColors.riskRed, // high_risk
};

String _bandLabel(AppLocalizations l10n, String band) => switch (band) {
  'excellent' => l10n.bpcr_band_excellent,
  'good' => l10n.bpcr_band_good,
  'moderate' => l10n.bpcr_band_moderate,
  'poor' => l10n.bpcr_band_poor,
  _ => l10n.bpcr_band_high_risk,
};

class _ScoreCard extends StatelessWidget {
  final BpcrScoreModel score;
  const _ScoreCard({required this.score});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final color = _bandColor(score.band);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.bgTop),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${score.totalScore} / ${score.maxScore}',
                        style: AppTypography.headlineMedium.copyWith(fontSize: 32)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
                      child: Text(_bandLabel(l10n, score.band), style: AppTypography.bodySmall.copyWith(color: color, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 72, height: 72,
                child: Stack(alignment: Alignment.center, children: [
                  CircularProgressIndicator(
                    value: score.totalScore / score.maxScore,
                    strokeWidth: 7,
                    backgroundColor: const Color(0xFFEDEDED),
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                  Text('${score.totalScore}%', style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
                ]),
              ),
            ],
          ),
          if (score.maxReachableNow < score.maxScore) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.bpcr_not_all_tracked_note(score.maxScore - score.maxReachableNow),
              style: AppTypography.bodySmall.copyWith(color: AppColors.hintText, fontStyle: FontStyle.italic),
            ),
          ],
          const SizedBox(height: AppSpacing.sm),
          Text(score.messageEn, style: AppTypography.bodyMedium),
        ],
      ),
    );
  }
}

// ── Domain checklist ────────────────────────────────────────────────────

class _DomainChecklistCard extends ConsumerWidget {
  final BpcrScoreModel score;
  const _DomainChecklistCard({required this.score});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final bagAsync = ref.watch(deliveryBagAnswersProvider);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: const Color(0xFFE7E5E4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(l10n.bpcr_domain_checklist_title, style: AppTypography.titleMedium),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFFCE4E4), borderRadius: BorderRadius.circular(AppSpacing.radiusSm)),
              child: Text('${score.totalScore}/${score.maxScore} ${l10n.bpcr_pts_suffix}', style: AppTypography.bodySmall.copyWith(color: AppColors.riskRed)),
            ),
          ]),
          const SizedBox(height: AppSpacing.md),
          ...score.domains.map((d) {
            if (d.key == 'delivery_bag') {
              return bagAsync.when(
                loading: () => const _DomainRow(label: '', icon: Icons.card_travel_outlined, earned: 0, max: 5, status: 'pending'),
                error: (e, _) => const SizedBox.shrink(),
                data: (bag) => _DeliveryBagRow(domain: d, bag: bag),
              );
            }
            final meta = _domainMeta[d.key];
            return _DomainRow(
              label: meta?.$1 ?? d.key,
              icon: meta?.$2 ?? Icons.circle_outlined,
              earned: d.earned,
              max: d.maxPoints,
              status: d.status,
              onFix: meta?.$3 == null ? null : () => context.pushNamed(meta!.$3!),
            );
          }),
          Divider(),
          const SizedBox(height: AppSpacing.sm),
          _ScoreLegend(currentBand: score.band),
        ],
      ),
    );
  }
}

class _DomainRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final int earned, max;
  final String status; // completed | pending | not_tracked_yet
  final VoidCallback? onFix;

  const _DomainRow({required this.label, required this.icon, required this.earned, required this.max, required this.status, this.onFix});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isNotTracked = status == 'not_tracked_yet';
    final isDone = status == 'completed';
    return InkWell(
      onTap: onFix,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(children: [
          Icon(icon, size: 20, color: isNotTracked ? AppColors.hintText : AppColors.bodyText),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(label, style: AppTypography.bodyMedium.copyWith(color: isNotTracked ? AppColors.hintText : null)),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text('$earned/$max', style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
          const SizedBox(width: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: isNotTracked ? const Color(0xFFEDEDED) : (isDone ? const Color(0xFFE3F5EA) : const Color(0xFFFCE4E4)),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Text(
              isNotTracked ? l10n.bpcr_status_not_tracked : (isDone ? l10n.bpcr_status_completed : l10n.bpcr_status_pending),
              style: AppTypography.bodySmall.copyWith(
                color: isNotTracked ? AppColors.hintText : (isDone ? AppColors.riskGreen : AppColors.riskRed),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ── Delivery bag: auto-saves per tick, no separate Save button ──────────
// Why auto-save instead of a Save button: it's a 3-item checklist, not a
// form with several related fields to fill before it makes sense to
// submit (unlike Transport/Saved Money/Community Support). Each tick is
// independently meaningful and should count immediately — a Save button
// would just add a step with nothing to batch. State updates optimistically
// (ticks instantly) and reverts with an error toast if the save fails, so
// she always sees a clear "Saved" / "Couldn't save" confirmation either way.

class _DeliveryBagRow extends ConsumerStatefulWidget {
  final BpcrDomainModel domain;
  final Map<String, bool> bag;
  const _DeliveryBagRow({required this.domain, required this.bag});

  @override
  ConsumerState<_DeliveryBagRow> createState() => _DeliveryBagRowState();
}

class _DeliveryBagRowState extends ConsumerState<_DeliveryBagRow> {
  bool _expanded = false;
  String? _savingKey;

  Future<void> _toggle(String key) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _savingKey = key);
    final ok = await ref.read(deliveryBagAnswersProvider.notifier).toggle(key);
    if (!mounted) return;
    setState(() => _savingKey = null);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1, milliseconds: 200),
        backgroundColor: ok ? AppColors.riskGreen : AppColors.riskRed,
        content: Text(ok ? l10n.bpcr_saved : l10n.bpcr_answers_save_error,
            style: const TextStyle(color: Colors.white)),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final meta = _domainMeta['delivery_bag']!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DomainRow(
          label: meta.$1, icon: meta.$2,
          earned: widget.domain.earned, max: widget.domain.maxPoints, status: widget.domain.status,
          onFix: () => setState(() => _expanded = !_expanded),
        ),
        if (_expanded)
          Padding(
            padding: const EdgeInsets.only(left: 28, bottom: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bagCheckbox(l10n.bpcr_bag_baby_essentials, 'baby_essentials'),
                _bagCheckbox(l10n.bpcr_bag_mother_clothes, 'mother_clean_clothes'),
                _bagCheckbox(l10n.bpcr_bag_mcp_card, 'mcp_card_file'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _bagCheckbox(String label, String key) {
    final checked = widget.bag[key] ?? false;
    final isSaving = _savingKey == key;
    return InkWell(
      onTap: isSaving ? null : () => _toggle(key),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          if (isSaving)
            const SizedBox(width: 20, height: 20, child: Padding(padding: EdgeInsets.all(2), child: CircularProgressIndicator(strokeWidth: 2)))
          else
            Icon(checked ? Icons.check_box : Icons.check_box_outline_blank, size: 20, color: checked ? AppColors.riskGreen : AppColors.hintText),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.bodyMedium),
        ]),
      ),
    );
  }
}

class _ScoreLegend extends StatelessWidget {
  final String currentBand;
  const _ScoreLegend({required this.currentBand});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bands = [
      ('high_risk', '<40', l10n.bpcr_band_high_risk, AppColors.riskRed),
      ('poor', '40-59', l10n.bpcr_band_poor, AppColors.riskRed),
      ('moderate', '60-74', l10n.bpcr_band_moderate, const Color(0xFFF0A93B)),
      ('good', '75-89', l10n.bpcr_band_good, AppColors.riskGreen),
      ('excellent', '90-100', l10n.bpcr_band_excellent, AppColors.riskGreen),
    ];
    return Wrap(
      spacing: AppSpacing.sm, runSpacing: AppSpacing.sm,
      children: bands.map((b) {
        final isCurrent = b.$1 == currentBand;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isCurrent ? b.$4.withOpacity(0.15) : null,
            border: Border.all(color: isCurrent ? b.$4 : b.$4.withOpacity(0.3), width: isCurrent ? 2 : 1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          child: Column(children: [
            Text(b.$2, style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w700)),
            Text(b.$3, style: AppTypography.bodySmall.copyWith(color: b.$4, fontSize: 10, fontWeight: isCurrent ? FontWeight.w700 : FontWeight.normal)),
          ]),
        );
      }).toList(),
    );
  }
}