import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/core/services/destination_service.dart';
import 'package:sangwari_maa/features/auth/data/model/user_model.dart';
import 'package:sangwari_maa/features/auth/presentation/controller/auth_controller.dart';
import 'package:sangwari_maa/features/registration/data/model/women_register_request_model.dart';
import 'package:sangwari_maa/features/registration/presentation/controller/registration_controller.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'package:sangwari_maa/shared/widgets/app_bar.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/app_text_field.dart';

const _otpGreen = Color(0xFF2E7D32);

/// Route: /register
class RegistrationPage extends ConsumerStatefulWidget {
  /// Set when arriving from OtpVerificationPage (OTP already verified there).
  /// Null when arriving directly — this page then collects + verifies OTP
  /// inline before unlocking the rest of the form.
  final String? initialMobile;
  const RegistrationPage({super.key, this.initialMobile});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isResolving = false;

  final _nameCtrl    = TextEditingController();
  final _mobileCtrl  = TextEditingController();
  final _otpCtrl     = TextEditingController();
  final _ageCtrl     = TextEditingController();
  final _dobCtrl     = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _villageCtrl  = TextEditingController();
  final _districtCtrl = TextEditingController();
  final _gestCtrl    = TextEditingController();
  final _lmpCtrl     = TextEditingController();
  final _eddCtrl     = TextEditingController();

  String? _selectedBloodGroup;
  bool _consentGiven = false;

  bool _otpSent = false;
  bool _verified = false;
  bool _isSendingOtp = false;
  bool _isVerifyingOtp = false;

  static const List<String> _bloodGroups = [
    'A+', 'A−', 'B+', 'B−', 'AB+', 'AB−', 'O+', 'O−',
  ];

  bool get _isUnlocked => widget.initialMobile != null || _verified;

  @override
  void initState() {
    super.initState();
    if (widget.initialMobile != null) {
      _mobileCtrl.text = widget.initialMobile!;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _mobileCtrl.dispose();
    _otpCtrl.dispose();
    _ageCtrl.dispose();
    _dobCtrl.dispose();
    _addressCtrl.dispose();
    _gestCtrl.dispose();
    _lmpCtrl.dispose();
    _eddCtrl.dispose();
    _villageCtrl.dispose();
    _districtCtrl.dispose();
    super.dispose();
  }

  // ── Date helpers ─────────────────────────────────────────────────────────

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}';

  DateTime? _parseDate(String s) {
    final parts = s.split('-');
    if (parts.length != 3) return null;
    final d = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    final y = int.tryParse(parts[2]);
    if (d == null || m == null || y == null) return null;
    try {
      return DateTime(y, m, d);
    } catch (_) {
      return null;
    }
  }

  int _calculateAge(DateTime dob) {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  Future<void> _pickDate(TextEditingController ctrl, {bool isLmp = false}) async {
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
    if (picked == null) return;

    setState(() {
      ctrl.text = _formatDate(picked);
      if (isLmp) {
        // EDD is backend-computed (lmp + 280 days) — derive it here too so
        // the UI shows the right value, but it is never sent for editing,
        // only displayed.
        final edd = picked.add(const Duration(days: 280));
        _eddCtrl.text = _formatDate(edd);
        // Gestational age suggestion — editable afterwards if adjustment needed.
        final weeks = (DateTime.now().difference(picked).inDays / 7).floor();
        if (weeks >= 0) _gestCtrl.text = weeks.toString();
      }
    });
  }

  String? _toIsoDate(String ddMMyyyy) {
    final d = _parseDate(ddMMyyyy);
    if (d == null) return null;
    return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  String? _normalizeBloodGroup(String? group) {
    if (group == null) return null;
    return group.replaceAll('−', '-');
  }

  // ── Cross-field validators ───────────────────────────────────────────────

  String? _dobValidator(String? _) {
    if (!_isUnlocked) return null;
    final l10n = AppLocalizations.of(context)!;
    if (_dobCtrl.text.isEmpty) return null; // optional field server-side
    final dob = _parseDate(_dobCtrl.text);
    if (dob == null) return null;
    if (dob.isAfter(DateTime.now())) return l10n.dobFutureError;
    return null;
  }

  String? _ageValidator(String? v) {
    if (!_isUnlocked) return null;
    final l10n = AppLocalizations.of(context)!;
    if (v == null || v.isEmpty) return l10n.required;
    final age = int.tryParse(v);
    if (age == null) return l10n.invalidValue;
    if (age < 14 || age > 55) return l10n.ageRangeError;
    if (_dobCtrl.text.isNotEmpty) {
      final dob = _parseDate(_dobCtrl.text);
      if (dob != null && !dob.isAfter(DateTime.now())) {
        final computed = _calculateAge(dob);
        if ((computed - age).abs() > 1) return l10n.ageDobMismatch;
      }
    }
    return null;
  }

  String? _lmpValidator(String? _) {
    if (!_isUnlocked) return null;
    final l10n = AppLocalizations.of(context)!;
    if (_lmpCtrl.text.isEmpty) return l10n.required;
    final lmp = _parseDate(_lmpCtrl.text);
    if (lmp == null) return null;
    final now = DateTime.now();
    if (lmp.isAfter(now)) return l10n.lmpFutureError;
    if (now.difference(lmp).inDays > 294) return l10n.lmpTooOldError;
    return null;
  }

  // ── Inline OTP actions ───────────────────────────────────────────────────

  void _onSendOtp() {
    final mobile = _mobileCtrl.text.trim();
    final l10n = AppLocalizations.of(context)!;
    if (mobile.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.invalidMobile)));
      return;
    }
    setState(() => _isSendingOtp = true);
    ref.read(authControllerProvider.notifier).sendOtp(mobile);
  }

  void _onVerifyOtp() {
    final otp = _otpCtrl.text.trim();
    final l10n = AppLocalizations.of(context)!;
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.invalidOtp)));
      return;
    }
    setState(() => _isVerifyingOtp = true);
    ref.read(authControllerProvider.notifier).verifyOtp(_mobileCtrl.text.trim(), otp);
  }

  void _onSubmit() {
    final l10n = AppLocalizations.of(context)!;
    if (!_isUnlocked) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_consentGiven) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.consentRequired)));
      return;
    }
    ref.read(registrationControllerProvider.notifier).register(
      WomenRegisterRequestModel(
        name: _nameCtrl.text.trim(),
        age: int.tryParse(_ageCtrl.text) ?? 0,
      //  husbandAge: int.tryParse(_husbAgeCtrl.text),
        dob: _toIsoDate(_dobCtrl.text),
        address: _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
        village: _villageCtrl.text.trim().isEmpty ? null : _villageCtrl.text.trim(),
        district: _districtCtrl.text.trim().isEmpty ? null : _districtCtrl.text.trim(),
        lmp: _toIsoDate(_lmpCtrl.text) ?? '',
        bloodGroup: _normalizeBloodGroup(_selectedBloodGroup),
        preferredLanguage: ref.read(localeProvider).languageCode,
        consent: _consentGiven,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (widget.initialMobile == null) {
      ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
        final wasLoading = previous?.isLoading ?? false;
        if (!wasLoading) return;

        next.whenOrNull(
          error: (e, _) {
            setState(() {
              _isSendingOtp = false;
              _isVerifyingOtp = false;
            });
            final message = e is Failure ? e.message : e.toString();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          },
          data: (_) {
            if (_isSendingOtp) {
              setState(() {
                _isSendingOtp = false;
                _otpSent = true;
              });
              return;
            }
            // if (_isVerifyingOtp) {
            //   final controller = ref.read(authControllerProvider.notifier);
            //   final isNewUser = controller.isNewUser;
            //   setState(() => _isVerifyingOtp = false);
            //
            //   if (!isNewUser) {
            //     // Existing account — verify-otp already returned a valid JWT, so log
            //     // them straight into their dashboard instead of forcing a second OTP
            //     // cycle on the Login screen.
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text(l10n.welcomeBackLoggedIn)),
            //     );
            //     switch (controller.role) {
            //       case UserRole.pregnantWoman:
            //         context.go('/womensdashboard');
            //         break;
            //       case UserRole.asha:
            //       case UserRole.anm:
            //         context.go('/mitanindashboard');
            //         break;
            //       case UserRole.blockAdmin:
            //       case UserRole.pi:
            //       case UserRole.superAdmin:
            //         context.go('/admindashboard'); // still pending per earlier conversation
            //         break;
            //       case null:
            //         context.go('/womensdashboard');
            //     }
            //     return;
            //   }
            //   setState(() => _verified = true);
            // }
            if (_isVerifyingOtp) {
              setState(() => _isVerifyingOtp = false);

              // Don't branch on isNewUser here — it only tells us if the User row
              // was just created, NOT if the beneficiary profile is complete.
              // Always call resolveDestination so the beneficiary table is checked.
              setState(() => _isResolving = true); // ADD _isResolving field like OTP page
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final destination = await resolveDestination();
                if (!mounted) return;
                setState(() => _isResolving = false);
                switch (destination) {
                  case SplashDestination():
                    context.go('/');
                  case DashboardDestination(:final path):
                    context.go(path);
                  case RegistrationDestination():
                  // Already on registration page — just unlock the form
                    setState(() => _verified = true);
                }
              });
              return;
            }
          },
        );
      });
    }

    ref.listen<AsyncValue<void>>(registrationControllerProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e is Failure ? e.message : e.toString())),
        ),
        //data: (_) => context.go('/womensdashboard'),
        data: (_) {
          // Registration success = profile complete by definition.
          // Read role from auth controller — already stored in TokenStorageService
          // during verify-otp, so this is always available.
          final role = ref.read(authControllerProvider.notifier).role;
          switch (role) {
            case UserRole.asha:
            case UserRole.anm:
              context.go('/mitanindashboard');
            case UserRole.blockAdmin:
            case UserRole.pi:
            case UserRole.superAdmin:
              context.go('/'); // fallback until admin dashboard exists
            case UserRole.pregnantWoman:
            case null:
              context.go('/womensdashboard');
          }
        },
      );
    });

    final isRegistering = ref.watch(registrationControllerProvider).isLoading;
    final isNewUserFlow = widget.initialMobile != null;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: TopBar(l10n: l10n),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenH,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isNewUserFlow) ...[
                _InfoBanner(text: l10n.newUserCompleteRegistration),
                const SizedBox(height: AppSpacing.md),
              ],

              // _LoginBanner(l10n: l10n),
              // const SizedBox(height: AppSpacing.md),

              if (!isNewUserFlow) ...[
                _LoginBanner(l10n: l10n),
                const SizedBox(height: AppSpacing.md),
              ],

              Center(
                child: Text(l10n.registerTitle, style: AppTypography.titleMedium, textAlign: TextAlign.center),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Mother's Profile ────────────────────────────────────────
              _SectionCard(
                svgAsset: "assets/icons/motherprofile.png",
                title: l10n.mothersProfile,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.fullName, style: AppTypography.fieldLabel),
                    const SizedBox(height: AppSpacing.xs),
                    AppTextField(
                      hint: l10n.fullNameHint,
                      controller: _nameCtrl,
                      textCapitalization: TextCapitalization.words,
                      validator: (v) => (v == null || v.trim().isEmpty) ? l10n.required : null,
                    ),
                    const SizedBox(height: AppSpacing.md),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children : [
                      Text(l10n.mobileNumber, style: AppTypography.fieldLabel),
                      if (!_isUnlocked) ...[
                        const SizedBox(width: AppSpacing.sm),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: _isSendingOtp ? null : _onSendOtp,
                          child: _isSendingOtp
                              ? const SizedBox(
                            width: 14, height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2, color: _otpGreen),
                          )
                              : Text(
                            _otpSent ? l10n.resendOtp : l10n.sendOtp,
                            style: AppTypography.bodyMedium.copyWith(
                              color: _otpGreen,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ]
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    AppTextField(
                      hint: '+91',
                      controller: _mobileCtrl,
                      readOnly: _isUnlocked || _otpSent,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (v) => (v == null || v.length != 10) ? l10n.invalidMobile : null,
                    ),

                    if (!_isUnlocked && _otpSent) ...[
                      const SizedBox(height: AppSpacing.md),
                      Text(l10n.enterOtp, style: AppTypography.fieldLabel),
                      const SizedBox(height: AppSpacing.xs),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppTextField(
                              hint: l10n.enterOtp,
                              controller: _otpCtrl,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _otpGreen,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  //borderRadius: BorderRadius.circular(0),
                                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                                ),
                              ),
                              onPressed: (_isVerifyingOtp || _isResolving) ? null : _onVerifyOtp,
                              child: (_isVerifyingOtp || _isResolving)
                                  ? const SizedBox(
                                width: 18, height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                                  : Text(l10n.verifyOtp),
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: AppSpacing.md),

                    // ── Locked until verified — dimmed, not removed ───────
                    IgnorePointer(
                      ignoring: !_isUnlocked,
                      child: Opacity(
                        opacity: _isUnlocked ? 1.0 : 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(l10n.dateOfBirth, style: AppTypography.fieldLabel),
                                      const SizedBox(height: AppSpacing.xs),
                                      AppTextField(
                                        hint: l10n.dateHint,
                                        controller: _dobCtrl,
                                        readOnly: true,
                                        onTap: _isUnlocked ? () => _pickDate(_dobCtrl) : null,
                                        validator: _dobValidator,
                                        suffixIcon: const Padding(
                                          padding: EdgeInsets.all(AppSpacing.md),
                                          child: Icon(Icons.calendar_month_outlined, color: AppColors.hintText, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.md),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(l10n.age, style: AppTypography.fieldLabel),
                                      const SizedBox(height: AppSpacing.xs),
                                      AppTextField(
                                        hint: l10n.ageHint,
                                        controller: _ageCtrl,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        validator: _ageValidator,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.md),

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
                                        value: _selectedBloodGroup,
                                        items: _bloodGroups,
                                        onChanged: _isUnlocked
                                            ? (v) => setState(() => _selectedBloodGroup = v)
                                            : null,
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
                                        controller: _gestCtrl,
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

                            Text(l10n.lmpDetails, style: AppTypography.fieldLabel),
                            const SizedBox(height: AppSpacing.xs),
                            AppTextField(
                              hint: l10n.lmpDate,
                              controller: _lmpCtrl,
                              readOnly: true,
                              onTap: _isUnlocked ? () => _pickDate(_lmpCtrl, isLmp: true) : null,
                              validator: _lmpValidator,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.all(AppSpacing.md),
                                child: Icon(Icons.calendar_month_outlined, color: AppColors.hintText, size: 20),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),

                            Text(l10n.expectedDeliveryDate, style: AppTypography.fieldLabel),
                            const SizedBox(height: AppSpacing.xs),
                            AppTextField(
                              hint: l10n.eddHint,
                              controller: _eddCtrl,
                              readOnly: true,
                              onTap: null, // EDD is computed from LMP, never manually editable
                              suffixIcon: const Padding(
                                padding: EdgeInsets.all(AppSpacing.md),
                                child: Icon(Icons.calculate_outlined, color: AppColors.hintText, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              // ── Health Center — always visible, locked until verified ──
              IgnorePointer(
                ignoring: !_isUnlocked,
                child: Opacity(
                  opacity: _isUnlocked ? 1.0 : 0.4,
                  child: _SectionCard(
                    svgAsset: "assets/icons/location.png",
                    title: l10n.address,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(l10n.currentAddress, style: AppTypography.fieldLabel),
                        const SizedBox(height: AppSpacing.xs),
                        AppTextField(
                          hint: l10n.addressHint,
                          controller: _addressCtrl,
                          maxLines: 3,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(l10n.village, style: AppTypography.fieldLabel),
                        const SizedBox(height: AppSpacing.xs),
                        AppTextField(
                          hint: l10n.village,
                          controller: _villageCtrl,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(l10n.district, style: AppTypography.fieldLabel),
                        const SizedBox(height: AppSpacing.xs),
                        AppTextField(
                          hint: l10n.district,
                          controller: _districtCtrl,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              IgnorePointer(
                ignoring: !_isUnlocked,
                child: Opacity(
                  opacity: _isUnlocked ? 1.0 : 0.4,
                  child: _ConsentSection(
                    l10n: l10n,
                    value: _consentGiven,
                    onChanged: (v) => setState(() => _consentGiven = v ?? false),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              Opacity(
                opacity: _isUnlocked ? 1.0 : 0.5,
                child: AppPrimaryButton(
                  label: l10n.completeReg,
                  showArrow: false,
                  isLoading: isRegistering,
                  onTap: _isUnlocked ? _onSubmit : null,
                ),
              ),

              SizedBox(height: AppSpacing.md + MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Info banner ──────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  final String text;
  const _InfoBanner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: const Color(0xFFFFD54F)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, size: 18, color: Color(0xFFF9A825)),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(text, style: AppTypography.bodySmall.copyWith(color: const Color(0xFF6D4C00))),
          ),
        ],
      ),
    );
  }
}

// ── Login banner ──────────────────────────────────────────────────────────

class _LoginBanner extends StatelessWidget {
  final AppLocalizations l10n;
  const _LoginBanner({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE8F4FD),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: AppSpacing.sm,
        children: [
          Text('${l10n.alreadyHaveAccount} ${l10n.loginTitle}', style: AppTypography.bodyMedium),
          GestureDetector(
            onTap: () => context.pushNamed('login'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Color(0xCC004AC1), blurRadius: 4, spreadRadius: 0, offset: Offset(0, 0)),
                ],
                border: Border.all(color: AppColors.greyBorder),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.mobileOtp, style: AppTypography.bodySmall.copyWith(color: AppColors.bodyText)),
                  const SizedBox(width: AppSpacing.xs),
                  const Icon(Icons.phone_android, size: 14, color: AppColors.hintText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Card ──────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String? svgAsset;
  final IconData? icon;
  final String title;
  final Widget child;

  const _SectionCard({this.svgAsset, this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                Image.asset(svgAsset!, width: 20, height: 20, color: AppColors.pinkText)
              else if (icon != null)
                Icon(icon, color: AppColors.pinkText, size: 20),
              const SizedBox(width: AppSpacing.xs),
              Flexible(child: Text(title, style: AppTypography.pinkLabelLg, overflow: TextOverflow.ellipsis)),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}

// ── Consent Section ───────────────────────────────────────────────────────

class _ConsentSection extends StatelessWidget {
  final AppLocalizations l10n;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _ConsentSection({required this.l10n, required this.value, required this.onChanged});

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
            width: 24, height: 24,
            child: Checkbox(value: value, onChanged: onChanged, materialTapTargetSize: MaterialTapTargetSize.padded),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.consentTitle, style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: AppSpacing.xs),
                Text(l10n.consentBody, style: AppTypography.bodySmall.copyWith(color: AppColors.bodyText)),
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
  final ValueChanged<String?>? onChanged;

  const _DropdownField({required this.hint, required this.value, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final menuItems = items
        .map((e) => DropdownMenuItem(value: e, child: Text(e, style: AppTypography.bodyMedium)))
        .toList(growable: false);

    return Container(
      decoration: BoxDecoration(color: AppColors.fieldFill, borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint, style: AppTypography.hint),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.hintText),
          items: menuItems,
          onChanged: onChanged,
        ),
      ),
    );
  }
}