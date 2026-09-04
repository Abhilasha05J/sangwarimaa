import 'package:flutter/material.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';

/// Two independent-looking checkboxes (Yes / No) that behave as one
/// tri-state answer: tapping Yes selects true, tapping No selects false,
/// tapping the already-selected one clears back to null (undecided).
class BpcrYesNoCheckboxPair extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const BpcrYesNoCheckboxPair({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _option(label: 'Yes', selected: value == true, onTap: () => onChanged(value == true ? null : true)),
        const SizedBox(width: 24),
        _option(label: 'No', selected: value == false, onTap: () => onChanged(value == false ? null : false)),
      ],
    );
  }

  Widget _option({required String label, required bool selected, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: selected,
              onChanged: (_) => onTap(),
              activeColor: AppColors.gradStart,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.bodyLarge),
        ],
      ),
    );
  }
}