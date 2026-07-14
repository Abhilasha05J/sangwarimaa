import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/ancservices/data/model/anc_services_model.dart';
import 'package:sangwari_maa/features/ancservices/presentation/controller/anc_services_controller.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/bottom_navbar.dart';


class AncServicesScreen extends ConsumerWidget {
  const AncServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(ancServicesControllerProvider);
    final isHindi = Localizations.localeOf(context).languageCode == 'hi';
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: TopBar(l10n: l10n,),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0), // adjust index
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SubHeader(
              title: l10n.ancServices,
              onBack: () => context.pop(),
            ),
            Expanded(
              child: asyncData.when(
                loading: () => const Center(child: CircularProgressIndicator(color: AppColors.gradStart)),
                error: (err, _) => _ErrorView(
                  onRetry: () => ref.read(ancServicesControllerProvider.notifier).refresh(),
                ),
                data: (data) =>  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH, vertical: AppSpacing.sm),
                    children: [
                      const SizedBox(height: AppSpacing.sm),
                      _GestationalAgeCard(data: data, isHindi: isHindi,progress: data.visitProgress),
                      const SizedBox(height: AppSpacing.md),
                      _RegistrationCard(reg: data.pregnancyRegistration, isHindi: isHindi),
                      const SizedBox(height: AppSpacing.lg),
                      const Divider(),
                      const SizedBox(height: AppSpacing.lg),
                      const _SectionHeader(title: 'ANC VISIT TIMELINE'),
                      const SizedBox(height: AppSpacing.md),
                      ...data.ancVisitTimeline.map((v) => _AncVisitTile(visit: v, isHindi: isHindi)),
                      const SizedBox(height: AppSpacing.lg),
                      _MedicineTrackerCard(tracker: data.medicineTracker, nutrition: data.maternalNutrition),
                      const SizedBox(height: AppSpacing.lg),
                      const _SectionHeader(title: 'IMMUNIZATION DURING PREGNANCY'),
                      const SizedBox(height: AppSpacing.sm),
                      ...data.immunization.map((i) => _ImmunizationRow(item: i)),
                      const SizedBox(height: AppSpacing.lg),
                      const _SectionHeader(title: 'ULTRASOUND MONITORING'),
                      const SizedBox(height: AppSpacing.sm),
                      ...data.ultrasound.map((s) => _UltrasoundRow(item: s)),
                      const SizedBox(height: AppSpacing.xxl),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Gestational age + EDD + BPCR card ──────────────────────────────────────
class _GestationalAgeCard extends StatelessWidget {
  final AncServicesModel data;
  final bool isHindi;
  final List<VisitProgressItem> progress;
  const _GestationalAgeCard({required this.data, required this.isHindi, required this.progress});

  Color get _riskColor => switch (data.highRiskStatus) {
    'Yes' => AppColors.riskRed,
    'No' => AppColors.riskGreen,
    _ => AppColors.hintText,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.fieldFill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('GESTATIONAL AGE', style: AppTypography.titleSmall),
              Row(children: [
                Text('High-Risk Status : ', style: AppTypography.bodySmall),
                Text(data.highRiskStatus, style: AppTypography.bodyMedium.copyWith(color: _riskColor, fontWeight: FontWeight.w700)),
              ]),
            ],
          ),
          Text(
            data.gestationalWeek != null ? '${data.gestationalWeek} Weeks' : 'NA',
            style: AppTypography.headlineLarge.copyWith(color: AppColors.gradStart),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(child: _InfoChip(label: 'EDD', value: data.edd)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _InfoChip(
                  label: 'BPCR Score',
                  value: data.bpcrScorePercent != null ? '${data.bpcrScorePercent!.round()}%' : 'NA',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(progress.length * 2 - 1, (i) {
              if (i.isOdd) {
                final leftDone = progress[i ~/ 2].isCompleted;
                return Expanded(
                  child: SizedBox(
                    height: 28, // matches circle height, so the line centers against the circle, not the text below
                    child: Center(
                      child: _DashedLine(color: leftDone ? AppColors.riskGreen : AppColors.fieldFill),
                    ),
                  ),
                );
              }
              final v = progress[i ~/ 2];
              return Column(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: v.isCompleted ? AppColors.riskGreen : AppColors.white,
                      border: Border.all(color: v.isCompleted ? AppColors.riskGreen : AppColors.fieldFill, width: 1.5),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: v.isCompleted ? const Icon(Icons.check, size: 16, color: AppColors.white) : null,
                  ),
                  const SizedBox(height: 4),
                  Text('ANC Visit ${v.visitNumber}', style: AppTypography.bodySmall.copyWith(fontSize: 11, color: const Color(0xFF2F6FED),fontWeight: FontWeight.w600,)),
                  Text(v.weekRange, style: AppTypography.bodySmall.copyWith(fontSize: 10)),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String value;
  const _InfoChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.bgTop.withOpacity(0.4),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.titleSmall),
          Text(value, style: AppTypography.hint),
        ],
      ),
    );
  }
}

// ── Pregnancy Registration card ─────────────────────────────────────────────
class _RegistrationCard extends StatelessWidget {
  final PregnancyRegistrationModel reg;
  final bool isHindi;
  const _RegistrationCard({required this.reg, required this.isHindi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Color(0XFFE1E6FF),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/icons/Pregnant.png', width: 28, height: 32),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Pregnancy Registration', style: AppTypography.titleMedium),
                    Text('Registered Date - ${reg.registeredDate ?? "NA"}', style: AppTypography.bodySmall),
                  ],)
                ],
              ),
              Text('Status : ${reg.isRegistered ? "Yes" : "No"}',
                  style: AppTypography.bodyMedium.copyWith(
                    color: reg.isRegistered ? AppColors.riskGreen : AppColors.riskRed,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
         const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(child: _CheckRow(label: 'Pregnancy registered', checked: reg.isRegistered,  field: 'is_registered')),
              Expanded(child: _CheckRow(label: 'MCP Card received', checked: reg.mcpCardReceived, field: 'mcp_card_received')),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(child: _CheckRow(label: 'RCH ID generated', checked: reg.rchIdGenerated,  field: 'rch_id_generated')),
              Expanded(child: _CheckRow(label: 'ASHA assigned', checked: reg.ashaAssigned)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ),
    );
  }
}
class _CheckRow extends ConsumerWidget {
  final String label;
  final bool checked;
  final String? field; // null = not tappable (e.g. "ASHA assigned")
  const _CheckRow({required this.label, required this.checked, this.field});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = Row(
      children: [
        Icon(checked ? Icons.check_box : Icons.check_box_outline_blank,
            size: 24, color: checked ? AppColors.riskGreen : AppColors.hintText),
        const SizedBox(width: 4),
        Expanded(child: Text(label, style: AppTypography.bodyMedium, overflow: TextOverflow.ellipsis)),
      ],
    );
    if (field == null) return row;
    return InkWell(
      onTap: () => ref.read(ancServicesControllerProvider.notifier).toggleRegistrationField(field!, !checked),
      child: row,
    );
  }
}

// ── ANC visit timeline tile (expandable) ────────────────────────────────────
  class _AncVisitTile extends ConsumerStatefulWidget {
  final AncVisitTimelineItem visit;
  final bool isHindi;
  const _AncVisitTile({required this.visit, required this.isHindi});

  @override
  ConsumerState<_AncVisitTile> createState() => _AncVisitTileState();
  }
  class _AncVisitTileState extends ConsumerState<_AncVisitTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final v = widget.visit;
    final isCompleted = v.status == 'completed';
    final title = widget.isHindi ? (v.titleHi ?? v.titleEn ?? '') : (v.titleEn ?? v.titleHi ?? '');

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.fieldFill.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              alignment: Alignment.center,
              child: Text(
                '${v.visitNumber}',
                style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            title: Row(
              children: [
                Expanded(child: Text(title, style: AppTypography.bodyMedium)),
                Text(isCompleted ? '(Completed)' : '(Due)',
                    style: AppTypography.bodySmall.copyWith(color: isCompleted ? AppColors.riskGreen : AppColors.riskRed)),
              ],
            ),
            trailing: Icon(_expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            onTap: () => setState(() => _expanded = !_expanded),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.sm),
              child: Column(
                children: [
                  ...v.items.map((item) => InkWell(
                    onTap: () => ref.read(ancServicesControllerProvider.notifier)
                        .toggleChecklistItem(v.visitNumber, item.key, !item.checked),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.isHindi ? (item.labelHi ?? item.labelEn ?? '') : (item.labelEn ?? item.labelHi ?? ''),
                              style: AppTypography.bodyMedium,
                            ),
                          ),
                          Icon(item.checked ? Icons.check_box : Icons.check_box_outline_blank,
                              size: 20, color: item.checked ? AppColors.riskGreen : AppColors.hintText),
                        ],
                      ),
                    ),
                  )),
                  const Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status : ${isCompleted ? "Completed" : "Due"}',
                          style: AppTypography.bodySmall.copyWith(color: isCompleted ? AppColors.riskGreen : AppColors.riskRed)),
                      Text('Tests : ${v.testsCompleted}/${v.testsTotal}',
                          style: AppTypography.bodySmall.copyWith(color: AppColors.riskGreen)),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ── Medicine tracker card ───────────────────────────────────────────────────
class _MedicineTrackerCard extends ConsumerWidget {
  final Map<String, MedicineTrackerItem> tracker;
  final MaternalNutritionModel nutrition;
  const _MedicineTrackerCard({required this.tracker, required this.nutrition});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutritionChecks = [
      (label: 'Nutrition counselling received', field: 'nutrition_counselling_received', value: nutrition.nutritionCounsellingReceived),
      (label: 'Weight monitored', field: 'weight_monitored', value: nutrition.weightMonitored),
      (label: 'Supplementary nutrition received', field: 'supplementary_nutrition_received',  value: nutrition.supplementaryNutritionReceived),
    ];
    final nutritionDone = nutritionChecks.where((e) => e.value).length;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.fieldFill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(title: 'MEDICINE TRACKER'),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(child: _MedicineColumn(type: 'iron', item: tracker['iron'], ref: ref)),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: _MedicineColumn(type: 'calcium', item: tracker['calcium'], ref: ref)),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Maternal Nutrition', style: AppTypography.titleMedium),
              Text('$nutritionDone/3', style: AppTypography.titleMedium),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ...nutritionChecks.map((e) => InkWell(
            onTap: () => ref.read(ancServicesControllerProvider.notifier)
                .toggleMaternalNutritionField(e.field, !e.value),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(e.value ? Icons.check_box : Icons.check_box_outline_blank,
                      size: 20, color: e.value ? AppColors.bodyText : AppColors.hintText),
                  const SizedBox(width: 8),
                  Text(e.label, style: AppTypography.bodyMedium),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
class _MedicineColumn extends StatelessWidget {
  final String type;
  final MedicineTrackerItem? item;
  final WidgetRef ref;
  const _MedicineColumn({required this.type, required this.item, required this.ref});

  static const _benefits = {
    'iron': ['Prevents Anemia', 'Improves Maternal Health', "Supports Baby's Growth"],
    'calcium': ['Strong Bones', 'Prevents Hypertension', 'Supports Fetal Growth'],
  };

  @override
  Widget build(BuildContext context) {
    final taken = item?.taken ?? 0;
    final total = item?.total ?? (type == 'iron' ? 180 : 360);
    final progress = total == 0 ? 0.0 : taken / total;

    return Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF1F1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type[0].toUpperCase() + type.substring(1), style: AppTypography.titleMedium),
                Row(
                  children: [
                    Text('$taken/$total', style: AppTypography.bodyMedium),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => _MedicineCalendarDialog(medicineType: type),
                      ),
                      child: const Icon(Icons.calendar_month, size: 18, color: AppColors.bodyText),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress.clamp(0, 1),
                minHeight: 6,
                backgroundColor: AppColors.fieldFill,
                valueColor: const AlwaysStoppedAnimation(AppColors.riskGreen),
              ),
            ),
            const SizedBox(height: 12),

            Text('Benefits', style: AppTypography.bodyMedium.copyWith(color: const Color(0xFF2F6FED), fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 4),
            ..._benefits[type]!.map((b) => Text('· $b', style: AppTypography.bodySmall)),
          ],
        ),
      );

  }
}

// ── Immunization ──────────────────────────────────────────
class _ImmunizationRow extends ConsumerWidget {
  final ImmunizationItem item;
  const _ImmunizationRow({required this.item});

  String get _label => switch (item.doseType) {
    'dose_1' => 'Dose 1',
    'dose_2' => 'Dose 2',
    _ => 'Booster',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final received = item.status == 'received';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_label, style: AppTypography.bodyMedium.copyWith(color: AppColors.gradStart)),
              Text('Status : ${received ? "Received" : "No"}',
                  style: AppTypography.bodySmall.copyWith(color: received ? AppColors.riskGreen : AppColors.hintText)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date - ${item.date ?? "NA"}', style: AppTypography.bodySmall),
              IconButton(
                icon: Image.asset('assets/icons/edit.png', width: 18, height: 18),
                onPressed: () => _showDatePicker(context, ref),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      await ref.read(ancServicesControllerProvider.notifier).updateImmunization(
        item.doseType,
        status: 'received',
        receivedDate: picked.toIso8601String().split('T').first,
      );
    }
  }
}

// ── Ultrasound rows ──────────────────────────────────────────
class _UltrasoundRow extends ConsumerWidget {
  final UltrasoundItem item;
  const _UltrasoundRow({required this.item});

  String get _label => switch (item.scanType) {
    'pregnancy_scan' => 'Pregnancy Scans',
    'early_scan' => 'Early Scan',
    'anomaly_scan' => 'Anomaly Scan',
    _ => 'Growth Scan',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completed = item.status == 'completed';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Checkbox(
            value: completed,
            activeColor: AppColors.riskGreen,
            onChanged: (v) => ref.read(ancServicesControllerProvider.notifier).updateUltrasound(
              item.scanType,
              status: v == true ? 'completed' : 'due',
              scanDate: v == true ? DateTime.now().toIso8601String().split('T').first : null,
            ),
          ),
          Expanded(child: Text(_label, style: AppTypography.bodyMedium)),
          Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Status : "),
              Text(completed ? 'Completed' : 'Due',
                  style: AppTypography.bodySmall.copyWith(color: completed ? AppColors.riskGreen : AppColors.riskRed)),
            ],
          ),
        ],
      ),
    );
  }
}

//──────────────────────────────────────────
class _MedicineCalendarDialog extends ConsumerStatefulWidget {
  final String medicineType;
  const _MedicineCalendarDialog({required this.medicineType});

  @override
  ConsumerState<_MedicineCalendarDialog> createState() => _MedicineCalendarDialogState();
}
class _MedicineCalendarDialogState extends ConsumerState<_MedicineCalendarDialog> {
  DateTime _visibleMonth = DateTime(DateTime.now().year, DateTime.now().month);
  Set<String> _takenDates = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final dates = await ref.read(ancServicesControllerProvider.notifier).loadMedicineCalendar(widget.medicineType);
    setState(() {
      _takenDates = dates.toSet();
      _loading = false;
    });
  }

  void _changeMonth(int delta) {
    setState(() => _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + delta));
  }

  bool _busy = false;

  Future<void> _toggleDay(DateTime day) async {
    if (_busy) return;
    _busy = true;
    final isoDate = day.toIso8601String().split('T').first;
    final wasTaken = _takenDates.contains(isoDate);
    setState(() {
      wasTaken ? _takenDates.remove(isoDate) : _takenDates.add(isoDate);
    });
    try {
      await ref.read(ancServicesControllerProvider.notifier).toggleMedicineDate(widget.medicineType, day, !wasTaken);
    } finally {
      _busy = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    final daysInMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0).day;
    final leadingBlanks = firstDayOfMonth.weekday % 7; // Sunday-first grid
    final today = DateTime.now();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => _changeMonth(-1)),
                Text(
                  '${_monthName(_visibleMonth.month)} ${_visibleMonth.year}',
                  style: AppTypography.titleMedium,
                ),
                IconButton(icon: const Icon(Icons.chevron_right), onPressed: () => _changeMonth(1)),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_loading)
              const Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator())
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
                itemCount: leadingBlanks + daysInMonth,
                itemBuilder: (context, index) {
                  if (index < leadingBlanks) return const SizedBox.shrink();
                  final dayNum = index - leadingBlanks + 1;
                  final day = DateTime(_visibleMonth.year, _visibleMonth.month, dayNum);
                  final isoDate = day.toIso8601String().split('T').first;
                  final taken = _takenDates.contains(isoDate);
                  final isFuture = day.isAfter(DateTime(today.year, today.month, today.day));

                  return GestureDetector(
                    onTap: isFuture ? null : () => _toggleDay(day),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: taken ? AppColors.riskGreen : AppColors.fieldFill.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$dayNum',
                        style: AppTypography.bodySmall.copyWith(
                          color: taken ? AppColors.white : (isFuture ? AppColors.hintText : AppColors.bodyText),
                        ),
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Done')),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) => const [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ][month - 1];
}

//──────────────────────────────────────────
class _DashedLine extends StatelessWidget {
  final Color color;
  const _DashedLine({required this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, 2),
          painter: _DashedLinePainter(color: color),
        );
      },
    );
  }
}
class _DashedLinePainter extends CustomPainter {
  final Color color;
  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 4.0;
    const dashSpace = 4.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height / 2), Offset(startX + dashWidth, size.height / 2), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) => oldDelegate.color != color;
}

//──────────────────────────────────────────
class _ErrorView extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Could not load ANC services', style: AppTypography.bodyMedium),
          const SizedBox(height: AppSpacing.sm),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

//──────────────────────────────────────────
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

//──────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/ancstar.png', width: 20, height: 20),
        const SizedBox(width: 6),
        Text(title.toUpperCase(), style: AppTypography.titleMedium),
      ],
    );
  }
}