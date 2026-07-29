import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bpcr_danger_signs_provider.g.dart';

@riverpod
class BpcrDangerSignsSelection extends _$BpcrDangerSignsSelection {
  @override
  Set<int> build(String componentKey) => <int>{};

  void toggle(int index) {
    final next = {...state};
    if (!next.add(index)) next.remove(index);
    state = next;
  }
}