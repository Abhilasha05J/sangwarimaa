import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/shared/widgets/app_primary_button.dart';
import 'package:sangwari_maa/shared/widgets/app_text_field.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_blood_donor_model.dart';

/// Result handed back on submit. isCommunity decides whether `relation`
/// (family) or `address` (community) was collected — the other is null.
class AddDonorResult {
  final String name, bloodGroup, phone;
  final String? relation, address;
  AddDonorResult({required this.name, required this.bloodGroup, required this.phone, this.relation, this.address});
}

Future<AddDonorResult?> showAddDonorSheet(BuildContext context, {required bool isCommunity}) {
  return showModalBottomSheet<AddDonorResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusLg))),
    builder: (_) => _AddDonorSheet(isCommunity: isCommunity),
  );
}

class _AddDonorSheet extends StatefulWidget {
  final bool isCommunity;
  const _AddDonorSheet({required this.isCommunity});

  @override
  State<_AddDonorSheet> createState() => _AddDonorSheetState();
}

class _AddDonorSheetState extends State<_AddDonorSheet> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _relationCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  String? _bloodGroup;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _relationCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  bool get _valid =>
      _nameCtrl.text.trim().isNotEmpty && _bloodGroup != null && _phoneCtrl.text.trim().length == 10;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isCommunity ? l10n.bpcr_add_community_donors : l10n.bpcr_add_family_member,
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(hint: l10n.bpcr_name_hint, controller: _nameCtrl, onChanged: (_) => setState(() {})),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: kBloodGroups.map((bg) => ChoiceChip(
                label: Text(bg),
                selected: _bloodGroup == bg,
                onSelected: (_) => setState(() => _bloodGroup = bg),
                selectedColor: AppColors.gradStart.withOpacity(0.2),
              )).toList(),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (!widget.isCommunity)
              AppTextField(hint: l10n.bpcr_relation_hint, controller: _relationCtrl)
            else
              AppTextField(hint: l10n.bpcr_donor_address_hint, controller: _addressCtrl),
            const SizedBox(height: AppSpacing.sm),
            AppTextField(
              hint: l10n.bpcr_contact_hint, controller: _phoneCtrl,
              keyboardType: TextInputType.phone, onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: AppSpacing.md),
            AppPrimaryButton(
              label: l10n.save,
              onTap: !_valid ? null : () => Navigator.of(context).pop(AddDonorResult(
                name: _nameCtrl.text.trim(),
                bloodGroup: _bloodGroup!,
                phone: _phoneCtrl.text.trim(),
                relation: widget.isCommunity ? null : _relationCtrl.text.trim(),
                address: widget.isCommunity ? _addressCtrl.text.trim() : null,
              )),
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom),
          ],
        ),
      ),
    );
  }
}