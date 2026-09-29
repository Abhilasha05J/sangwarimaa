import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';

part 'bpcr_answers_providers.g.dart';

// ── shared enums ────────────────────────────────────────────────────────
// DeliveryPlaceChoice removed: "where to deliver" is now which selected
// facility she ticks, not government/private/undecided — see
// DeliveryFacilityAnswer below and the Health Facility ID page.
enum TransportOptionChoice { governmentAmbulance, privateAmbulance, ownVehicle }
enum OwnVehicleType { car, bike, other }
enum BirthCompanionChoice { asha, husband, otherFamily }
enum CommunitySupportType { panch, sarpanch, healers, schoolTeachers, other }

String? _s(Map m, String k) => (m[k] as String?);
bool? _b(Map m, String k) => (m[k] as bool?);

// ── Transport ───────────────────────────────────────────────────────────
// hospital_name/delivery_place dropped from here — that question now lives
// on the Health Facility ID screen as "which selected facility is she
// delivering at", saved separately (see DeliveryFacilityAnswer).

class TransportDraft {
  TransportOptionChoice? option;
  bool? ambulanceSharedWithFamily;
  String privateProviderName, privateContact;
  OwnVehicleType? ownVehicle;
  String driverName, driverNumber;
  BirthCompanionChoice? companion;
  String companionName, companionContact, companionRelation;

  TransportDraft({
    this.option,
    this.ambulanceSharedWithFamily, this.privateProviderName = '', this.privateContact = '',
    this.ownVehicle, this.driverName = '', this.driverNumber = '',
    this.companion, this.companionName = '', this.companionContact = '', this.companionRelation = '',
  });

  /// Always returns a NEW instance — never mutate a TransportDraft in
  /// place and reassign it as riverpod state; Riverpod won't detect the
  /// change and the UI silently won't update. Always go through this.
  TransportDraft clone() => TransportDraft(
    option: option,
    ambulanceSharedWithFamily: ambulanceSharedWithFamily,
    privateProviderName: privateProviderName,
    privateContact: privateContact,
    ownVehicle: ownVehicle,
    driverName: driverName,
    driverNumber: driverNumber,
    companion: companion,
    companionName: companionName,
    companionContact: companionContact,
    companionRelation: companionRelation,
  );

  factory TransportDraft.fromAnswers(Map<String, dynamic> a) {
    final ga = (a['government_ambulance'] as Map?) ?? {};
    final pa = (a['private_ambulance'] as Map?) ?? {};
    final ov = (a['own_vehicle'] as Map?) ?? {};
    final bc = (a['birth_companion'] as Map?) ?? {};
    TransportOptionChoice? option;
    if (_b(ga, 'shared_with_family') != null) option = TransportOptionChoice.governmentAmbulance;
    if (_s(pa, 'name') != null || _s(pa, 'phone') != null) option = TransportOptionChoice.privateAmbulance;
    if (_s(ov, 'type') != null) option = TransportOptionChoice.ownVehicle;
    final companionWho = {'asha': BirthCompanionChoice.asha, 'husband': BirthCompanionChoice.husband,
      'other_family': BirthCompanionChoice.otherFamily}[_s(bc, 'who')];
    final ovType = {'car': OwnVehicleType.car, 'bike': OwnVehicleType.bike, 'other': OwnVehicleType.other}[_s(ov, 'type')];

    return TransportDraft(
      option: option,
      ambulanceSharedWithFamily: _b(ga, 'shared_with_family'),
      privateProviderName: _s(pa, 'name') ?? '',
      privateContact: _s(pa, 'phone') ?? '',
      ownVehicle: ovType,
      driverName: _s(ov, 'driver_name') ?? '',
      driverNumber: _s(ov, 'driver_phone') ?? '',
      companion: companionWho,
      companionName: _s(bc, 'name') ?? '',
      companionContact: _s(bc, 'phone') ?? '',
      companionRelation: _s(bc, 'relation') ?? '',
    );
  }

  Map<String, dynamic> toAnswers() => {
    'government_ambulance': {'shared_with_family': option == TransportOptionChoice.governmentAmbulance ? ambulanceSharedWithFamily : null},
    'private_ambulance': option == TransportOptionChoice.privateAmbulance
        ? {'name': privateProviderName, 'phone': privateContact} : {'name': null, 'phone': null},
    'own_vehicle': option == TransportOptionChoice.ownVehicle
        ? {'type': ownVehicle?.toString().split('.').last, 'driver_name': driverName, 'driver_phone': driverNumber}
        : {'type': null, 'driver_name': null, 'driver_phone': null},
    'birth_companion': {
      'who': companion == BirthCompanionChoice.otherFamily ? 'other_family' : companion?.toString().split('.').last,
      'name': companion == BirthCompanionChoice.otherFamily ? companionName : null,
      'phone': companion == BirthCompanionChoice.otherFamily ? companionContact : null,
      'relation': companion == BirthCompanionChoice.otherFamily ? companionRelation : null,
    },
  };
}

@riverpod
class TransportAnswers extends _$TransportAnswers {
  @override
  Future<TransportDraft> build() async {
    final result = await ref.read(bpcrRepositoryProvider).getAnswers('transport');
    return result.fold((f) => throw f, (a) => TransportDraft.fromAnswers(a));
  }

  /// mutate() runs on a FRESH COPY of the current draft, then that copy
  /// becomes the new state. Never mutate the existing instance in place —
  /// see TransportDraft.clone()'s doc comment for why.
  void edit(void Function(TransportDraft) mutate) {
    final current = state.asData?.value;
    if (current == null) return;
    final next = current.clone();
    mutate(next);
    state = AsyncData(next);
  }

  Future<bool> save() async {
    final draft = state.asData?.value;
    if (draft == null) return false;
    final result = await ref.read(bpcrRepositoryProvider).saveAnswers('transport', draft.toAnswers());
    return result.fold((f) => false, (_) => true);
  }
}

// ── Saved money ─────────────────────────────────────────────────────────

class SavedMoneyDraft {
  bool? selfSaving;
  bool husbandSelected;
  String husbandName, husbandContact;
  bool milSelected;
  String milName, milContact, milRelation;

  SavedMoneyDraft({
    this.selfSaving, this.husbandSelected = false, this.husbandName = '', this.husbandContact = '',
    this.milSelected = false, this.milName = '', this.milContact = '', this.milRelation = '',
  });

  SavedMoneyDraft clone() => SavedMoneyDraft(
    selfSaving: selfSaving,
    husbandSelected: husbandSelected, husbandName: husbandName, husbandContact: husbandContact,
    milSelected: milSelected, milName: milName, milContact: milContact, milRelation: milRelation,
  );

  factory SavedMoneyDraft.fromAnswers(Map<String, dynamic> a) {
    final fs = (a['family_saving'] as Map?) ?? {};
    final h = (fs['husband'] as Map?) ?? {};
    final m = (fs['mother_in_law'] as Map?) ?? {};
    return SavedMoneyDraft(
      selfSaving: _b(a, 'self_saving'),
      husbandSelected: _b(h, 'selected') ?? false,
      husbandName: _s(h, 'name') ?? '',
      husbandContact: _s(h, 'phone') ?? '',
      milSelected: _b(m, 'selected') ?? false,
      milName: _s(m, 'name') ?? '',
      milContact: _s(m, 'phone') ?? '',
      milRelation: _s(m, 'relation') ?? '',
    );
  }

  Map<String, dynamic> toAnswers() => {
    'self_saving': selfSaving,
    'family_saving': {
      'husband': {'selected': husbandSelected, 'name': husbandSelected ? husbandName : null,
        'phone': husbandSelected ? husbandContact : null, 'relation': husbandSelected ? 'Husband' : null},
      'mother_in_law': {'selected': milSelected, 'name': milSelected ? milName : null,
        'phone': milSelected ? milContact : null, 'relation': milSelected ? milRelation : null},
    },
  };
}

@riverpod
class SavedMoneyAnswers extends _$SavedMoneyAnswers {
  @override
  Future<SavedMoneyDraft> build() async {
    final result = await ref.read(bpcrRepositoryProvider).getAnswers('saved_money');
    return result.fold((f) => throw f, (a) => SavedMoneyDraft.fromAnswers(a));
  }

  void edit(void Function(SavedMoneyDraft) mutate) {
    final current = state.asData?.value;
    if (current == null) return;
    final next = current.clone();
    mutate(next);
    state = AsyncData(next);
  }

  Future<bool> save() async {
    final draft = state.asData?.value;
    if (draft == null) return false;
    final result = await ref.read(bpcrRepositoryProvider).saveAnswers('saved_money', draft.toAnswers());
    return result.fold((f) => false, (_) => true);
  }
}

// ── Community financial support (unchanged — already worked) ─────────────

const _communitySupportKeys = {
  CommunitySupportType.panch: 'panch',
  CommunitySupportType.sarpanch: 'sarpanch',
  CommunitySupportType.healers: 'healers',
  CommunitySupportType.schoolTeachers: 'school_teachers',
  CommunitySupportType.other: 'other',
};

@riverpod
class CommunitySupportAnswers extends _$CommunitySupportAnswers {
  @override
  Future<Map<CommunitySupportType, bool?>> build() async {
    final result = await ref.read(bpcrRepositoryProvider).getAnswers('community_financial_support');
    return result.fold((f) => throw f, (a) => {
      for (final t in CommunitySupportType.values) t: a[_communitySupportKeys[t]] as bool?,
    });
  }

  void set(CommunitySupportType type, bool? value) {
    state.whenData((map) => state = AsyncData({...map, type: value}));
  }

  Future<bool> save() async {
    final map = state.asData?.value;
    if (map == null) return false;
    final answers = {for (final e in map.entries) _communitySupportKeys[e.key]!: e.value};
    final result = await ref.read(bpcrRepositoryProvider).saveAnswers('community_financial_support', answers);
    return result.fold((f) => false, (_) => true);
  }
}

// ── Delivery facility: "where are you planning to deliver" ──────────────
// Lives on the Health Facility ID screen now (ticks one of her SELECTED
// facilities), saved via the same generic answers endpoint under a new
// component key. Backend needs 'delivery_facility' added to
// BPCR_ANSWER_COMPONENTS in app/schemas/women.py — see backend patch note.

@riverpod
class DeliveryFacilityAnswer extends _$DeliveryFacilityAnswer {
  @override
  Future<String?> build() async {
    final result = await ref.read(bpcrRepositoryProvider).getAnswers('delivery_facility');
    return result.fold((f) => throw f, (a) => a['facility_id'] as String?);
  }

  void set(String? facilityId) => state = AsyncData(facilityId);

  Future<bool> save() async {
    if (!state.hasValue) return false;
    final result = await ref.read(bpcrRepositoryProvider)
        .saveAnswers('delivery_facility', {'facility_id': state.value});
    return result.fold((f) => false, (_) => true);
  }
}