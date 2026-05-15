import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/registration/presentation/controller/registration_controller.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/app_text_field.dart';

/// Screen 5 — Registration.
///
/// Three sections:
///   A) Mother's Profile — name, mobile, age, husband's age, DOB,
///                         address, blood group, gestational age, LMP, EDD
///   B) Health Center Selection — village (dropdown), PHC (dropdown)
///   C) Digital Health Consent — checkbox + consent text
///
/// Route: /register
class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Mother's Profile controllers
  final _nameCtrl     = TextEditingController();
  final _mobileCtrl   = TextEditingController();
  final _ageCtrl      = TextEditingController();
  final _husbAgeCtrl  = TextEditingController();
  final _dobCtrl      = TextEditingController();
  final _addressCtrl  = TextEditingController();
  final _gestCtrl     = TextEditingController();
  final _lmpCtrl      = TextEditingController();
  final _eddCtrl      = TextEditingController();

  String? _selectedBloodGroup;
  String? _selectedVillage;
  String? _selectedPhc;
  bool _consentGiven = false;

  static const List<String> _bloodGroups = [
    'A+', 'A−', 'B+', 'B−', 'AB+', 'AB−', 'O+', 'O−',
  ];

  // Demo lists — replace with API data via Riverpod providers
  static const List<String> _villages = [
    'Raipur Village', 'Bilaspur Village', 'Durg Village',
    'Korba Village', 'Jagdalpur Village',
  ];
  static const List<String> _phcs = [
    'PHC Raipur North', 'PHC Bilaspur Central', 'PHC Durg South',
    'PHC Korba East', 'PHC Jagdalpur West',
  ];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _mobileCtrl.dispose();
    _ageCtrl.dispose();
    _husbAgeCtrl.dispose();
    _dobCtrl.dispose();
    _addressCtrl.dispose();
    _gestCtrl.dispose();
    _lmpCtrl.dispose();
    _eddCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate(TextEditingController ctrl) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().add(const Duration(days: 300)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.gradStart,
            onPrimary: AppColors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      ctrl.text =
          '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
    }
  }

  void _onSubmit() {
    final l10n = AppLocalizations.of(context)!;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_consentGiven) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.consentRequired)),
      );
      return;
    }
    ref.read(registrationControllerProvider.notifier).register(
          name: _nameCtrl.text.trim(),
          mobile: _mobileCtrl.text.trim(),
          age: int.tryParse(_ageCtrl.text) ?? 0,
          husbandAge: int.tryParse(_husbAgeCtrl.text) ?? 0,
          dob: _dobCtrl.text,
          address: _addressCtrl.text.trim(),
          bloodGroup: _selectedBloodGroup ?? '',
          gestationalAge: int.tryParse(_gestCtrl.text) ?? 0,
          lmp: _lmpCtrl.text,
          edd: _eddCtrl.text,
          village: _selectedVillage ?? '',
          phc: _selectedPhc ?? '',
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    ref.listen<AsyncValue<void>>(registrationControllerProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        ),
        data: (_) => context.go('/womensdashboard'),
      );
    });

    final isLoading =
        ref.watch(registrationControllerProvider).isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: TopBar(l10n: l10n),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH, vertical: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab bar
              Container(
                color: const Color(0xFFE8F4FD),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenH, vertical: AppSpacing.sm),
                child: Row(
                  children: [
                    Text(
                      '${l10n.alreadyHaveAccount} ${l10n.loginTitle}',
                      style: AppTypography.bodyMedium,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context.pushNamed('login'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xCC004AC1),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          border: Border.all(color: AppColors.greyBorder),
                          borderRadius:
                          BorderRadius.circular(AppSpacing.radiusSm),
                        ),
                        child: Row(
                          children: [
                            Text(l10n.mobileOtp,
                                style: AppTypography.bodySmall
                                    .copyWith(color: AppColors.bodyText)),
                            const SizedBox(width: AppSpacing.xs),
                            const Icon(Icons.phone_android,
                                size: 14, color: AppColors.hintText),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ── Title ──────────────────────────────────────────────────
              // after the tab Container, before the title Text
              const SizedBox(height: AppSpacing.md),
              Center(
                child: Text(l10n.registerTitle,
                    style: AppTypography.titleMedium,
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Section A: Mother's Profile ───────────────────────────
              _SectionCard(
                icon: Icons.person,
                title: l10n.mothersProfile,
                child: _MothersProfileSection(
                  l10n: l10n,
                  nameCtrl: _nameCtrl,
                  mobileCtrl: _mobileCtrl,
                  ageCtrl: _ageCtrl,
                  husbAgeCtrl: _husbAgeCtrl,
                  dobCtrl: _dobCtrl,
                  addressCtrl: _addressCtrl,
                  gestCtrl: _gestCtrl,
                  lmpCtrl: _lmpCtrl,
                  eddCtrl: _eddCtrl,
                  selectedBloodGroup: _selectedBloodGroup,
                  bloodGroups: _bloodGroups,
                  onBloodGroupChanged: (v) =>
                      setState(() => _selectedBloodGroup = v),
                  onPickDate: _pickDate,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              // ── Section B: Health Center Selection ────────────────────
              _SectionCard(
                svgAsset: 'assets/icons/location.svg',
                title: l10n.healthCenter,
                child: _HealthCenterSection(
                  l10n: l10n,
                  villages: _villages,
                  phcs: _phcs,
                  selectedVillage: _selectedVillage,
                  selectedPhc: _selectedPhc,
                  onVillageChanged: (v) =>
                      setState(() => _selectedVillage = v),
                  onPhcChanged: (v) => setState(() => _selectedPhc = v),
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              // ── Section C: Digital Health Consent ────────────────────
              _ConsentSection(
                l10n: l10n,
                value: _consentGiven,
                onChanged: (v) => setState(() => _consentGiven = v ?? false),
              ),

              const SizedBox(height: AppSpacing.xl),

              // ── Complete Registration CTA ─────────────────────────────
              AppPrimaryButton(
                label: l10n.completeReg,
                showArrow: false,
                isLoading: isLoading,
                onTap: _onSubmit,
              ),

              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),

    );
  }
}

// ── Section Card ──────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String? svgAsset;      // new
  final IconData? icon;
  final String title;
  final Widget child;

  const _SectionCard({
    this.svgAsset,
    this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.greyBorder),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (svgAsset != null)
                SvgPicture.asset(
                  svgAsset!,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.pinkText,
                    BlendMode.srcIn,
                  ),
                )
              else if (icon != null)
                Icon(icon, color: AppColors.pinkText, size: 20
                ),
              const SizedBox(width: AppSpacing.xs),
              Text(title, style: AppTypography.pinkLabelLg),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}

// ── Mother's Profile Section ──────────────────────────────────────────────

class _MothersProfileSection extends StatelessWidget {
  final AppLocalizations l10n;
  final TextEditingController nameCtrl;
  final TextEditingController mobileCtrl;
  final TextEditingController ageCtrl;
  final TextEditingController husbAgeCtrl;
  final TextEditingController dobCtrl;
  final TextEditingController addressCtrl;
  final TextEditingController gestCtrl;
  final TextEditingController lmpCtrl;
  final TextEditingController eddCtrl;
  final String? selectedBloodGroup;
  final List<String> bloodGroups;
  final ValueChanged<String?> onBloodGroupChanged;
  final Future<void> Function(TextEditingController) onPickDate;

  const _MothersProfileSection({
    required this.l10n,
    required this.nameCtrl,
    required this.mobileCtrl,
    required this.ageCtrl,
    required this.husbAgeCtrl,
    required this.dobCtrl,
    required this.addressCtrl,
    required this.gestCtrl,
    required this.lmpCtrl,
    required this.eddCtrl,
    required this.selectedBloodGroup,
    required this.bloodGroups,
    required this.onBloodGroupChanged,
    required this.onPickDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Full Name
        Text(l10n.fullName, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        AppTextField(
          hint: l10n.fullNameHint,
          controller: nameCtrl,
          textCapitalization: TextCapitalization.words,
          validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Required' : null,
        ),
        const SizedBox(height: AppSpacing.md),

        // Mobile Number
        Text(l10n.mobileNumber, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        AppTextField(
          hint: '+91',
          controller: mobileCtrl,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          validator: (v) =>
              (v == null || v.length != 10) ? l10n.invalidMobile : null,
        ),
        const SizedBox(height: AppSpacing.md),

        // Age + Husband's Age (side by side)
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.age, style: AppTypography.fieldLabel),
                  const SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    hint: l10n.ageHint,
                    controller: ageCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.husbandsAge, style: AppTypography.fieldLabel),
                  const SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    hint: l10n.ageHint,
                    controller: husbAgeCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),

        // Date of Birth
        Text(l10n.dateOfBirth, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        AppTextField(
          hint: l10n.dateHint,
          controller: dobCtrl,
          readOnly: true,
          onTap: () => onPickDate(dobCtrl),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Icon(Icons.calendar_month_outlined,
                color: AppColors.hintText, size: 20),
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Current Address
        Text(l10n.currentAddress, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        AppTextField(
          hint: l10n.addressHint,
          controller: addressCtrl,
          maxLines: 3,
          textCapitalization: TextCapitalization.sentences,
        ),
        const SizedBox(height: AppSpacing.md),

        // Blood Group + Gestational Age (side by side)
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.bloodGroup, style: AppTypography.fieldLabel),
                  const SizedBox(height: AppSpacing.xs),
                  _DropdownField(
                    hint: l10n.bloodGroupHint,
                    value: selectedBloodGroup,
                    items: bloodGroups,
                    onChanged: onBloodGroupChanged,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.gestationalAge, style: AppTypography.fieldLabel),
                  const SizedBox(height: AppSpacing.xs),
                  AppTextField(
                    hint: l10n.gestationalAgeHint,
                    controller: gestCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),

        // LMP Details
        Text(l10n.lmpDetails, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        AppTextField(
          hint: l10n.lmpDate,
          controller: lmpCtrl,
          readOnly: true,
          onTap: () => onPickDate(lmpCtrl),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Icon(Icons.calendar_month_outlined,
                color: AppColors.hintText, size: 20),
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Expected EDD
        Text(l10n.expectedDeliveryDate, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        AppTextField(
          hint: l10n.eddHint,
          controller: eddCtrl,
          readOnly: true,
          onTap: () => onPickDate(eddCtrl),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Icon(Icons.calendar_month_outlined,
                color: AppColors.hintText, size: 20),
          ),
        ),
      ],
    );
  }
}

// ── Health Center Section ─────────────────────────────────────────────────

class _HealthCenterSection extends StatelessWidget {
  final AppLocalizations l10n;
  final List<String> villages;
  final List<String> phcs;
  final String? selectedVillage;
  final String? selectedPhc;
  final ValueChanged<String?> onVillageChanged;
  final ValueChanged<String?> onPhcChanged;

  const _HealthCenterSection({
    required this.l10n,
    required this.villages,
    required this.phcs,
    required this.selectedVillage,
    required this.selectedPhc,
    required this.onVillageChanged,
    required this.onPhcChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Select Village
        Text(l10n.selectVillage, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        _DropdownField(
          hint: l10n.selectVillageHint,
          value: selectedVillage,
          items: villages,
          onChanged: onVillageChanged,
        ),
        const SizedBox(height: AppSpacing.md),

        // PHC
        Text(l10n.phc, style: AppTypography.fieldLabel),
        const SizedBox(height: AppSpacing.xs),
        _DropdownField(
          hint: l10n.phcHint,
          value: selectedPhc,
          items: phcs,
          onChanged: onPhcChanged,
        ),
      ],
    );
  }
}

// ── Consent Section ───────────────────────────────────────────────────────

class _ConsentSection extends StatelessWidget {
  final AppLocalizations l10n;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _ConsentSection({
    required this.l10n,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3F3),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.greyBorder),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.consentTitle,
                    style: AppTypography.titleMedium
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: AppSpacing.xs),
                Text(l10n.consentBody,
                    style: AppTypography.bodySmall
                        .copyWith(color: AppColors.bodyText)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reusable Dropdown Field ───────────────────────────────────────────────

class _DropdownField extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint, style: AppTypography.hint),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down,
              color: AppColors.hintText),
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child:
                        Text(e, style: AppTypography.bodyMedium),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
