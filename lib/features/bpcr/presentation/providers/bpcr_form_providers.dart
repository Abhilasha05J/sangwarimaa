import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/bpcr/data/model/facility_data.dart';
import 'package:sangwari_maa/features/bpcr/data/model/contact_person_data.dart';

part 'bpcr_form_providers.g.dart';

// ── Health Facility ID ──────────────────────────────────────────────────
// TODO(backend): replace mock list with a repository call that queries the
// health_facilities table by haversine distance from the beneficiary's
// registered address/GPS once that endpoint is confirmed.
@riverpod
List<FacilityData> nearbyFacilities(Ref ref) => const [
  FacilityData(type: 'PHC', name: 'Village Primary Health Centre', distanceKm: 3, etaMinutes: 10, schemeTags: ['JSY', 'JSSK'], lat: 21.25, lng: 81.63),
  FacilityData(type: 'CHC', name: 'Community Health Complex', distanceKm: 8, etaMinutes: 20, schemeTags: ['JSY', 'JSSK', 'PMSMA'], lat: 21.28, lng: 81.65),
  FacilityData(type: 'FRU', name: 'District First Referral Unit', distanceKm: 18, etaMinutes: 35, schemeTags: ['JSY', 'JSSK', 'PMSMA'], lat: 21.30, lng: 81.70),
];

// ── Skilled Birth Attendant ──────────────────────────────────────────────
@riverpod
List<ContactPersonData> skilledBirthAttendants(Ref ref) => const [
  ContactPersonData(roleLabel: 'MO', name: 'Dr. Anjali Sharma', subtitle: 'Medical Officer • CHC Raipur Main', availability: '24*7 Facility', phone: '0987654321', distanceKm: 2.4),
  ContactPersonData(roleLabel: 'Staff Nurse', name: 'Sunita Verma', subtitle: 'Lead Birthing Assistant • PHC Abhanpur', availability: 'OPD Hours (8am-8pm)', phone: '0987654321', distanceKm: 2.4),
];

@riverpod
ContactPersonData ashaContact(Ref ref) => const ContactPersonData(
  roleLabel: 'ASHA/MITANIN',
  name: 'Geeta Bai',
  phone: '0987654321',
  altPhone: '+91 98765 43211',
  altPhoneLabel: 'Husband: Ramesh',
  locationLabel: 'Village: Chandkhuri Ward 04 • Distance: 450m From House',
);

// TBA, like SBA, is fetched data — not a user-answered yes/no toggle.
// Empty list = no TBA on record for this beneficiary's village.
// TODO(backend): replace mock with a repository call once the TBA
// master-data endpoint is confirmed.
@riverpod
List<ContactPersonData> tbaContacts(Ref ref) => const [
  ContactPersonData(
    roleLabel: 'TBA',
    name: 'Anjali Sharma',
    phone: '0987654321',
    locationLabel: 'Village: Chandkhuri Ward 04 • Distance: 450m From House',
  ),
];

// ── Community Financial Support ──────────────────────────────────────────
// 5 independent yes/no rows — each community-leader type answered
// separately (matches client screenshot).
enum CommunitySupportType { panch, sarpanch, healers, schoolTeachers, other }

@riverpod
class CommunitySupportAnswers extends _$CommunitySupportAnswers {
  @override
  Map<CommunitySupportType, bool?> build() => {
    for (final t in CommunitySupportType.values) t: null,
  };

  void set(CommunitySupportType type, bool? value) {
    state = {...state, type: value};
  }
}

// ── Saved Money for Delivery ─────────────────────────────────────────────
@riverpod
class SelfSavingAnswer extends _$SelfSavingAnswer {
  @override
  bool? build() => null;
  void set(bool? v) => state = v;
}

@riverpod
class HusbandSavingSelected extends _$HusbandSavingSelected {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

@riverpod
class MotherInLawSavingSelected extends _$MotherInLawSavingSelected {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

// ── Blood Donor confirmation ──────────────────────────────────────────────
@riverpod
class CommunityDonorConfirmed extends _$CommunityDonorConfirmed {
  @override
  bool? build() => null;
  void set(bool v) => state = v;
}

// ── Transport Modality ────────────────────────────────────────────────────
enum DeliveryPlaceChoice { government, private, undecided }

@riverpod
class DeliveryPlaceSelection extends _$DeliveryPlaceSelection {
  @override
  DeliveryPlaceChoice? build() => null;
  void set(DeliveryPlaceChoice v) => state = v;
}

enum TransportOptionChoice { governmentAmbulance, privateAmbulance, ownVehicle }

@riverpod
class TransportOptionSelection extends _$TransportOptionSelection {
  @override
  TransportOptionChoice? build() => null;
  void set(TransportOptionChoice v) => state = v;
}

@riverpod
class AmbulanceSharedWithFamily extends _$AmbulanceSharedWithFamily {
  @override
  bool? build() => null;
  void set(bool v) => state = v;
}

enum OwnVehicleType { car, bike, other }

@riverpod
class OwnVehicleSelection extends _$OwnVehicleSelection {
  @override
  OwnVehicleType? build() => null;
  void set(OwnVehicleType v) => state = v;
}

enum BirthCompanionChoice { asha, husband, otherFamily }

@riverpod
class BirthCompanionSelection extends _$BirthCompanionSelection {
  @override
  BirthCompanionChoice? build() => null;
  void set(BirthCompanionChoice v) => state = v;
}