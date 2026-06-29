import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';

/// Route: /maternal-schemes/:id
class SchemeDetailPage extends ConsumerWidget {
  final String schemeId;
  const SchemeDetailPage({super.key, required this.schemeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopBar(l10n: l10n),
      body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
        child: _buildContent(context, l10n),
        ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildContent(BuildContext context, AppLocalizations l10n) {
    switch (schemeId) {
      case 'jsy':       return _JsyDetail(l10n: l10n);
      case 'jssk':      return _JsskDetail(l10n: l10n);
      case 'pmsma':     return _PmsmaDetail(l10n: l10n);
      case 'pmmvy':     return _PmmvyDetail(l10n: l10n);
      case 'anganwadi': return _AnganwadiDetail(l10n: l10n);
      case 'minimata':  return _MinimataDetail(l10n: l10n);
      default:
        return Center(
          child: Text('Unknown scheme: $schemeId',
              style: AppTypography.bodyMedium),
        );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared widgets
// ─────────────────────────────────────────────────────────────────────────────

// class _SectionHeader extends StatelessWidget {
//   final String title;
//   const _SectionHeader({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//      /// color: const Color(0xFFECF4FB),
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppSpacing.md,
//         vertical: AppSpacing.sm + 2,
//       ),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => context.pop(),
//             child: const Icon(Icons.arrow_back,
//                 size: 22, color: AppColors.bodyText),
//           ),
//           const SizedBox(width: AppSpacing.sm),
//           Text(title, style: AppTypography.titleMedium),
//         ],
//       ),
//     );
//   }
// }

/// Scheme header: avatar + name on left, logo image on right.
// class _SchemeHeader extends StatelessWidget {
//   final String initial;
//   final String name;
//   final String svgAsset;
//
//   const _SchemeHeader({
//     required this.initial,
//     required this.name,
//     required this.svgAsset,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(AppSpacing.md),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // Avatar circle with initial
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 44,
//                 height: 44,
//                 decoration: BoxDecoration(
//                   color: AppColors.fieldFill,
//                   borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
//                 ),
//                 child: Center(
//                   child: Text(
//                     initial,
//                     style: AppTypography.titleLarge
//                         .copyWith(color: AppColors.hintText),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: AppSpacing.md),
//               // Name — right padding reserves space for the overlapping
//               // logo image so the text wraps to the next line instead of
//               // being hidden underneath it.
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 88),
//                   child: Text(
//                     name,
//                     style: AppTypography.titleMedium,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Logo image
//           Positioned(
//             right: 0,
//             top: -40,
//             child: Image.asset(
//               svgAsset,
//               width: 80,
//               height: 80,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class _SchemeHeroHeader extends StatelessWidget {
  final String title;
  final String initial;
  final String name;
  final String svgAsset;

  const _SchemeHeroHeader({
    required this.title,
    required this.initial,
    required this.name,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header row (back arrow + title)
            Padding(
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
            ),
            const Divider(
              height: 1, thickness: 1,
              color: AppColors.greyBorder,
              indent: AppSpacing.md,
              endIndent: AppSpacing.xxl * 2.5,
            ),
            // Scheme name row — reserve right space for the image
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.fieldFill,
                      borderRadius:
                      BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                    child: Center(
                      child: Text(
                        initial,
                        style: AppTypography.titleLarge
                            .copyWith(color: AppColors.hintText),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Padding(
                      // push text left so it doesn't go under the image
                      padding: const EdgeInsets.only(right: 96),
                      child: Text(name, style: AppTypography.titleMedium),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // ── Logo image — spans full height of both rows ──
        Positioned(
          right: AppSpacing.md,
          top: 0,          // starts at the very top (section header row)
          bottom: 0,       // stretches to bottom of scheme header row
          child: Image.asset(
            svgAsset,
            width: 90,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
/// Pink pill badge (e.g. "Eligibility").
class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs + 2),
      decoration: BoxDecoration(
        color: AppColors.gradStart,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        label,
        style: AppTypography.labelMedium,
      ),
    );
  }
}

/// Section title (bold, black).
class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.sm),
      child: Text(
        text,
        style: AppTypography.titleMedium,
      ),
    );
  }
}

/// A numbered/bulleted body paragraph.
class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      child: Text(text, style: AppTypography.bodyMedium),
    );
  }
}

/// A lettered / roman-numeral list item.
class _ListItem extends StatelessWidget {
  final String prefix;
  final String text;
  final bool bold;

  const _ListItem({
    required this.prefix,
    required this.text,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.xs, AppSpacing.md, AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              prefix,
              style: bold
                  ? AppTypography.bodyMedium
                  .copyWith(fontWeight: FontWeight.w700)
                  : AppTypography.bodyMedium,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: bold
                  ? AppTypography.bodyMedium
                  .copyWith(fontWeight: FontWeight.w700)
                  : AppTypography.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

/// Checkmark list item.
class _CheckItem extends StatelessWidget {
  final String text;
  const _CheckItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.xs, AppSpacing.md, AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 18, color: AppColors.bodyText),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(text, style: AppTypography.bodyMedium),
          ),
        ],
      ),
    );
  }
}

/// Horizontal divider.
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.greyBorder,
      indent: AppSpacing.md,
      endIndent: (AppSpacing.xxl * 2),
    );
  }
}

/// Horizontal divider for jssk.
class _FullDivider extends StatelessWidget {
  const _FullDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.greyBorder,
      indent: AppSpacing.md,
      endIndent: AppSpacing.md,
    );
  }
}

/// SVG illustration block.
class _SchemeImage extends StatelessWidget {
  final String asset;
  const _SchemeImage({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.md),
      child: Image.asset(
        asset,
        width: double.infinity,
        //height: 160,
        fit: BoxFit.contain,
        //placeholderBuilder: (_) => const SizedBox(height: 160),
      ),
    );
  }
}

/// Pink section title (e.g. "Conditionality's and Instalments").
class _PinkSectionTitle extends StatelessWidget {
  final String text;
  const _PinkSectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.sm),
      child: Text(
        text,
        style: AppTypography.pinkLabelLg,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// JSY Detail
// ─────────────────────────────────────────────────────────────────────────────

class _JsyDetail extends StatelessWidget {
  final AppLocalizations l10n;
  const _JsyDetail({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SchemeHeroHeader(
          title: l10n.schemes_details,
          initial: 'J',
          name: l10n.jsy_name,
          svgAsset: 'assets/images/JSY 2.png',
        ),

              _Badge(label: l10n.eligibility),
              _BodyText(text: 'a)  ${l10n.jsy_eligibility_1}'),
              const SizedBox(height: AppSpacing.sm),
              _BodyText(text: 'b)  ${l10n.jsy_eligibility_2}'),
              const SizedBox(height: AppSpacing.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${l10n.jsy_cash_title} ',
                        style: AppTypography.bodyMedium
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: '- ${l10n.jsy_cash_desc}',
                        style: AppTypography.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              _SchemeImage(asset: 'assets/images/JSY2.png'),
              // Cash table
              _JsyCashTable(l10n: l10n),
      ],
    );
  }
}

class _JsyCashTable extends StatelessWidget {
  final AppLocalizations l10n;
  const _JsyCashTable({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Table(
        border: TableBorder.all(color: AppColors.greyBorder, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(0.8),
        },
        children: [
          // Header row
          TableRow(
            decoration:
            const BoxDecoration(color: Color(0xFFF5F5F5)),
            children: [
              _TableCell(text: '${l10n.jsy_table_category}', isHeader: true),
              _TableCell(text: '${l10n.area}', isHeader: true),
              _TableCell(text: '', isHeader: true),
              _TableCell(text: '${l10n.jsy_table_total}', isHeader: true),
            ],
          ),
          TableRow(
            decoration:
            const BoxDecoration(color: Color(0xFFF5F5F5)),
            children: [
              _TableCell(text: ''),
              _TableCell(text: '${l10n.jsy_table_rural}', isHeader: true),
              _TableCell(text: '${l10n.jsy_table_urban}', isHeader: true),
              _TableCell(text: ''),
            ],
          ),
          // Sub-header
          TableRow(children: [
            _TableCell(text: ''),
            _TableCell(
                text: "${l10n.jsy_table_mother_package}     ${l10n.jsy_table_mitanin_package}",
                small: true),
            _TableCell(
                text: "${l10n.jsy_table_mother_package}     ${l10n.jsy_table_mitanin_package}",
                small: true),
            _TableCell(text: 'Rs'),
          ]),
          // CG row
          TableRow(children: [
            _TableCell(text: 'CG'),
            _TableCell(text: '1400        600'),
            _TableCell(text: '1000        200'),
            _TableCell(text: '2000 / 1200', isHeader: true),
          ]),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool small;
  const _TableCell(
      {required this.text, this.isHeader = false, this.small = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Text(
        text,
        style: small
            ? AppTypography.bodySmall
            : isHeader
            ? AppTypography.bodySmall
            .copyWith(fontWeight: FontWeight.w700)
            : AppTypography.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// JSSK Detail
// ─────────────────────────────────────────────────────────────────────────────

class _JsskDetail extends StatelessWidget {
  final AppLocalizations l10n;
  const _JsskDetail({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SchemeHeroHeader(
          title: l10n.schemes_details,
          initial: 'J',
          name: l10n.schemeJssk,
          svgAsset: 'assets/images/JSSK.png',
        ),
        _Badge(label: l10n.eligibility),
        _BodyText(text: l10n.jssk_eligibility_desc),
        _SectionTitle(text: l10n.jssk_women_title),
        _ListItem(prefix: 'i.', text: l10n.jssk_women_1),
        _ListItem(prefix: 'ii.', text: l10n.jssk_women_2),
        _ListItem(prefix: 'iii.', text: l10n.jssk_women_3),
        _ListItem(prefix: 'iv.', text: l10n.jssk_women_4),
        _ListItem(prefix: 'v.', text: l10n.jssk_women_5),
        _ListItem(prefix: 'vi.', text: l10n.jssk_women_6),
        _ListItem(prefix: 'vii.', text: l10n.jssk_women_7),
        _SchemeImage(asset: 'assets/images/JSSK2.png'),
        const _FullDivider(),
        _SectionTitle(text: l10n.jssk_newborn_title),
        _ListItem(prefix: 'i.', text: l10n.jssk_newborn_1),
        _ListItem(prefix: 'ii.', text: l10n.jssk_newborn_2),
        _ListItem(prefix: 'iii.', text: l10n.jssk_newborn_3),
        _ListItem(prefix: 'iv.', text: l10n.jssk_newborn_4),
        _ListItem(prefix: 'v.', text: l10n.jssk_newborn_5),
        _ListItem(prefix: 'vi.', text: l10n.jssk_newborn_6),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PMSMA Detail
// ─────────────────────────────────────────────────────────────────────────────

class _PmsmaDetail extends StatelessWidget {
  final AppLocalizations l10n;
  const _PmsmaDetail({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SchemeHeroHeader(
          title: l10n.schemes_details,
          initial: 'P',
          name: l10n.schemePmsma,
          svgAsset: 'assets/images/PMSMA.png',
        ),

        _ListItem(prefix: 'i.', text: l10n.pmsma_desc_1),
        _ListItem(prefix: 'ii.', text: l10n.pmsma_desc_2),
        _ListItem(prefix: 'iii.', text: l10n.pmsma_desc_3),
        _ListItem(prefix: 'iv.', text: l10n.pmsma_desc_4),
        _SectionTitle(text: l10n.pmsma_services_title),
        _ListItem(prefix: '1.', text: l10n.pmsma_service_1),
        _ListItem(prefix: '2.', text: l10n.pmsma_service_2),
        _ListItem(prefix: '3.', text: l10n.pmsma_service_3),
        _ListItem(prefix: '4.', text: l10n.pmsma_service_4),
        //_SchemeImage(asset: 'assets/images/pmsma_infographic.svg'),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PMMVY Detail
// ─────────────────────────────────────────────────────────────────────────────

class _PmmvyDetail extends StatelessWidget {
  final AppLocalizations l10n;
  const _PmmvyDetail({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SchemeHeroHeader(
          title: l10n.schemes_details,
          initial: 'P',
          name: l10n.schemePmmvy,
          svgAsset: 'assets/images/PMMVY.png',
        ),

        _BodyText(text: l10n.pmmvy_des),
        _Badge(label: l10n.eligibility),
        _ListItem(prefix: '1.', text: l10n.pmmvy_eligibility_1),
        _ListItem(prefix: '2.', text: l10n.pmmvy_eligibility_2),
        _ListItem(prefix: '3.', text: l10n.pmmvy_eligibility_3),
        _ListItem(prefix: '4.', text: l10n.pmmvy_eligibility_4),
        _ListItem(prefix: '5.', text: l10n.pmmvy_eligibility_5),
        _ListItem(prefix: '6.', text: l10n.pmmvy_eligibility_6),
        _ListItem(prefix: '7.', text: l10n.pmmvy_eligibility_7),
        _ListItem(prefix: '8.', text: l10n.pmmvy_eligibility_8),
        _ListItem(prefix: '9.', text: l10n.pmmvy_eligibility_9),
        _ListItem(prefix: '10.', text: l10n.pmmvy_eligibility_10),
        const SizedBox(height: AppSpacing.sm),
        _BodyText(text: l10n.pmmvy_exclusion_note),
        _SchemeImage(asset: 'assets/images/PMMVY2.png'),
        // Benefit highlight box
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: RichText(
            text: TextSpan(
              style: AppTypography.bodyMedium,
              children: [
                TextSpan(text: '${l10n.benefits}\n\n'),
                TextSpan(
                  text: l10n.pmmvy_benefit_desc,
                  style: AppTypography.bodyMedium
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        _PinkSectionTitle(text: l10n.pmmvy_installment_title),
        _PmmvyTable(l10n: l10n),
      ],
    );
  }
}

class _PmmvyTable extends StatelessWidget {
  final AppLocalizations l10n;
  const _PmmvyTable({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Table(
        border: TableBorder.all(color: AppColors.greyBorder, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(0.8),
        },
        children: [
          // Header
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
            children: [
              _TableCell(text: l10n.pmmvy_table_installment, isHeader: true),
              _TableCell(text: l10n.pmmvy_table_conditions, isHeader: true),
              _TableCell(text: l10n.pmmvy_table_amount, isHeader: true),
            ],
          ),
          // First installment
          TableRow(children: [
            _TableCell(text: l10n.pmmvy_first_installment_title),
            _TableCell(text: l10n.pmmvy_first_installment_condition),
            _TableCell(text: l10n.pmmvy_first_installment_amount, isHeader: true),
          ]),
          // Second installment
          TableRow(children: [
            _TableCell(text: l10n.pmmvy_second_installment_title),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. ${l10n.pmmvy_second_installment_condition_1}',
                      style: AppTypography.bodySmall),
                  const SizedBox(height: 4),
                  Text('2. ${l10n.pmmvy_second_installment_condition_2}',
                      style: AppTypography.bodySmall),
                ],
              ),
            ),
            _TableCell(text: l10n.pmmvy_second_installment_amount, isHeader: true),
          ]),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Anganwadi Detail
// ─────────────────────────────────────────────────────────────────────────────

class _AnganwadiDetail extends StatelessWidget {
  final AppLocalizations l10n;
  const _AnganwadiDetail({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SchemeHeroHeader(
          title: l10n.schemes_details,
          initial: 'S',
          name: l10n.anganwadi_name,
          svgAsset: 'assets/images/anganwadi.png',
        ),

        const SizedBox(height: AppSpacing.md),
        _AnganwadiTable(l10n: l10n),
        _SchemeImage(asset: 'assets/images/anganwadi2.png'),
      ],
    );
  }
}

class _AnganwadiTable extends StatelessWidget {
  final AppLocalizations l10n;
  const _AnganwadiTable({required this.l10n});

  Widget _cell(String text, {bool isHeader = false}) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      text,
      style: isHeader
          ? AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w700)
          : AppTypography.bodySmall,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Table(
        border: TableBorder.all(color: AppColors.greyBorder, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1.6),
          2: FlexColumnWidth(1.4),
        },
        children: [
          // Header
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
            children: [
              _cell(l10n.anganwadi_table_service, isHeader: true),
              _cell(l10n.anganwadi_table_target_group, isHeader: true),
              _cell(l10n.anganwadi_table_provider, isHeader: true),
            ],
          ),
          TableRow(children: [
            _cell(l10n.anganwadi_service_1, isHeader: true),
            _cell(l10n.anganwadi_service_1_target),
            _cell(l10n.anganwadi_service_1_provider),
          ]),
          TableRow(children: [
            _cell(l10n.anganwadi_service_2, isHeader: true),
            _cell(l10n.anganwadi_service_2_target),
            _cell(l10n.anganwadi_service_2_provider),
          ]),
          TableRow(children: [
            _cell(l10n.anganwadi_service_3, isHeader: true),
            _cell(l10n.anganwadi_service_3_target),
            _cell(l10n.anganwadi_service_3_provider),
          ]),
          TableRow(children: [
            _cell(l10n.anganwadi_service_4, isHeader: true),
            _cell(l10n.anganwadi_service_4_target),
            _cell(l10n.anganwadi_service_4_provider),
          ]),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Minimata Detail
// ─────────────────────────────────────────────────────────────────────────────

class _MinimataDetail extends StatelessWidget {
  final AppLocalizations l10n;
  const _MinimataDetail({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SchemeHeroHeader(
          title: l10n.schemes_details,
          initial: 'M',
          name: l10n.schemeMinimata,
          svgAsset: 'assets/images/minimata.png',
        ),

        const SizedBox(height: AppSpacing.sm),
        _BodyText(text: l10n.minimata_desc),
        const SizedBox(height: AppSpacing.sm),
        _Badge(label: l10n.eligibility),
       // _SectionTitle(text: l10n.minimata_eligibility_title),
        _CheckItem(text: l10n.minimata_eligibility_1),
        _CheckItem(text: l10n.minimata_eligibility_2),
        _CheckItem(text: l10n.minimata_eligibility_3),
        _CheckItem(text: l10n.minimata_eligibility_4),
        _CheckItem(text: l10n.minimata_eligibility_5),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}