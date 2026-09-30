// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_summary_models.dart';
//
// part 'bpcr_summary_providers.g.dart';
//
// // TODO(backend): all values below are mock/static, matching the client
// // screenshot exactly. Replace with a repository call to the scoring
// // engine once bpcr_assessments schema + score computation are confirmed.
//
// @riverpod
// int bpcrScore(Ref ref) => 72;
//
// @riverpod
// String bpcrCurrentProgressLabel(Ref ref) => 'Week 34 + 2 Days';
//
// @riverpod
// String bpcrDueDateLabel(Ref ref) => '15 Sept 2026';
//
// @riverpod
// List<JourneyMilestone> journeyMilestones(Ref ref) => const [
//   JourneyMilestone(
//     weekLabel: 'WEEK 18 • COMPLETED',
//     title: 'Registration & MCP Card',
//     description: 'Successfully registered at Primary Health Center.',
//     status: MilestoneStatus.completed,
//   ),
//   JourneyMilestone(
//     weekLabel: 'WEEK 22 • COMPLETED',
//     title: 'Facility Selected',
//     description: 'District Hospital Bilaspur identified for birth.',
//     status: MilestoneStatus.completed,
//   ),
//   JourneyMilestone(
//     weekLabel: 'WEEK 24 • COMPLETED',
//     title: 'Transport Selected',
//     description: 'Arranged 102/108 Ambulance service and backup vehicle.',
//     status: MilestoneStatus.completed,
//   ),
//   JourneyMilestone(
//     weekLabel: 'WEEK 28 • COMPLETED',
//     title: 'Blood Donor Identified',
//     description: 'Two compatible volunteer donors confirmed (Amit & Priya).',
//     status: MilestoneStatus.completed,
//   ),
//   JourneyMilestone(
//     weekLabel: 'WEEK 32 • ACTION REQUIRED',
//     title: 'Delivery Bag Prepared',
//     description: 'Pack baby essentials, mother\'s clean clothes, and MCP card file.',
//     status: MilestoneStatus.actionRequired,
//     ctaLabel: 'Complete Checklist Now',
//   ),
//   JourneyMilestone(
//     weekLabel: 'WEEK 36 • UPCOMING',
//     title: 'Final Readiness Review',
//     description: 'Comprehensive review with ASHA worker & medical officer.',
//     status: MilestoneStatus.upcoming,
//   ),
// ];
//
// @riverpod
// List<DomainChecklistItem> domainChecklist(Ref ref) => const [
//   DomainChecklistItem(label: 'Pregnancy registration (MCP card)', subtitle: 'Score weight: 10 pts', scoreEarned: 10, scoreMax: 10, status: DomainStatus.completed),
//   DomainChecklistItem(label: 'Minimum 4 ANC completions', subtitle: 'Score weight: 10 pts', scoreEarned: 10, scoreMax: 10, status: DomainStatus.completed),
//   DomainChecklistItem(label: 'Identification of birth facility', subtitle: 'Score weight: 10 pts', scoreEarned: 10, scoreMax: 10, status: DomainStatus.completed),
//   DomainChecklistItem(label: 'Birth companion designated', subtitle: 'Score weight: 10 pts', scoreEarned: 10, scoreMax: 10, status: DomainStatus.completed),
//   DomainChecklistItem(label: 'Emergency transport arrangement', subtitle: '24/7 Driver Contact Unverified', scoreEarned: 0, scoreMax: 10, status: DomainStatus.pending),
//   DomainChecklistItem(label: 'Arrangement for blood donor', subtitle: 'Consent card submission pending', scoreEarned: 0, scoreMax: 8, status: DomainStatus.action),
//   DomainChecklistItem(label: 'Funds for birth & emergency', subtitle: 'Score weight: 8 pts', scoreEarned: 8, scoreMax: 8, status: DomainStatus.completed),
//   DomainChecklistItem(label: 'Danger signs awareness', subtitle: 'Score weight: 14 pts', scoreEarned: 14, scoreMax: 14, status: DomainStatus.completed),
// ];
//
// @riverpod
// List<EmergencyContact> emergencyContacts(Ref ref) => const [
//   EmergencyContact(label: 'Rekha (ASHA Worker)', number: '99812-XXXXX'),
//   EmergencyContact(label: 'Suresh (Husband)', number: '70001-XXXXX'),
//   EmergencyContact(label: 'Amit (Blood Donor)', number: '94252-XXXXX'),
// ];

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';

import 'package:sangwari_maa/features/bpcr/data/model/bpcr_score_model.dart';

part 'bpcr_summary_providers.g.dart';

@riverpod
Future<BpcrScoreModel> bpcrScore(Ref ref) async {
  final result = await ref.read(bpcrRepositoryProvider).getScore();
  return result.fold((f) => throw f, (r) => r);
}

@riverpod
Future<EmergencyHubModel> bpcrEmergencyHub(Ref ref) async {
  final result = await ref.read(bpcrRepositoryProvider).getEmergencyHub();
  return result.fold((f) => throw f, (r) => r);
}

const kDeliveryBagKeys = ['baby_essentials', 'mother_clean_clothes', 'mcp_card_file'];

/// Unlike the other answer screens (draft + explicit Save), each delivery
/// bag item saves the instant she ticks it — it's a 3-item checklist, not
/// a form, and the summary card's score should reflect a tick immediately.
@riverpod
class DeliveryBagAnswers extends _$DeliveryBagAnswers {
  @override
  Future<Map<String, bool>> build() async {
    final result = await ref.read(bpcrRepositoryProvider).getAnswers('delivery_bag');
    return result.fold((f) => throw f, (a) => {
      for (final k in kDeliveryBagKeys) k: a[k] == true,
    });
  }

  Future<bool> toggle(String key) async {
    final current = state.asData?.value;
    if (current == null) return false;
    final next = {...current, key: !(current[key] ?? false)};
    state = AsyncData(next); // optimistic — flips instantly, no spinner for a single checkbox
    final result = await ref.read(bpcrRepositoryProvider).saveAnswers('delivery_bag', next);
    return result.fold((f) {
      state = AsyncData(current); // revert on failure
      return false;
    }, (_) {
      ref.invalidate(bpcrScoreProvider); // score card should reflect the new tick
      return true;
    });
  }
}