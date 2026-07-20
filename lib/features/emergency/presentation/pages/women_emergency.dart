import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';

class EmergencyDialSheet {
  static void show(
      BuildContext context, {
        String? mitaninPhone,
        String? familyPhone,
        String? husbandPhone,
      }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _EmergencyDialSheetContent(
        mitaninPhone: mitaninPhone,
        familyPhone: familyPhone,
        husbandPhone: husbandPhone,
      ),
    );
  }
}

class _EmergencyDialSheetContent extends StatelessWidget {
  final String? mitaninPhone;
  final String? familyPhone;
  final String? husbandPhone;

  const _EmergencyDialSheetContent({
    this.mitaninPhone,
    this.familyPhone,
    this.husbandPhone,
  });

  Future<void> _call(String number) async {
    // Use action.DIAL (not action.CALL) — opens the dialer with the
    // number pre-filled rather than calling directly, which works
    // without CALL_PHONE runtime permission and is the recommended
    // approach for most apps.
    final uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch tel:$number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFF0EE),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusLg),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.xxl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Drag handle ──────────────────────────────────────────────
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.hintText.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // ── Title ────────────────────────────────────────────────────
          Text(
            'Emergency medical services',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Always-shown: 108 & 102 ──────────────────────────────────
          _DialRow(label: 'Call 108', onCall: () => _call('108')),
          const SizedBox(height: AppSpacing.lg),
          _DialRow(label: 'Call 102', onCall: () => _call('102')),
          const SizedBox(height: AppSpacing.lg),

          // ── Optional numbers ─────────────────────────────────────────
          if (mitaninPhone != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _DialRow(
              label: 'Call Mitanin',
              onCall: () => _call(mitaninPhone!),
            ),
          ],
          if (husbandPhone != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _DialRow(
              label: 'Call Husband',
              onCall: () => _call(husbandPhone!),
            ),
          ],
          if (familyPhone != null) ...[
            const SizedBox(height: AppSpacing.lg),
            _DialRow(
              label: 'Call Family',
              onCall: () => _call(familyPhone!),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single row: label on left, salmon call button on right
// ─────────────────────────────────────────────────────────────────────────────
class _DialRow extends StatelessWidget {
  final String label;
  final VoidCallback onCall;

  const _DialRow({required this.label, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            //fontSize: 22,
          ),
        ),
        GestureDetector(
          onTap: onCall,
          child: Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/icons/callemer.png'),
          ),
        ),
      ],
    );
  }
}