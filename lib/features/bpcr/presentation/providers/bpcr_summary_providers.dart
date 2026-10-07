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