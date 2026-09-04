class ContactPersonData {
  final String roleLabel;     // 'MO', 'Staff Nurse', 'ASHA/Mitanin', 'TBA'
  final String name;
  final String? subtitle;     // designation + facility, or relation
  final String? availability; // '24*7 Facility', 'OPD Hours (8am-8pm)'
  final String phone;
  final String? altPhone;
  final String? altPhoneLabel;
  final double? distanceKm;
  final String? locationLabel; // village/ward text
  final double? lat;
  final double? lng;

  const ContactPersonData({
    required this.roleLabel,
    required this.name,
    this.subtitle,
    this.availability,
    required this.phone,
    this.altPhone,
    this.altPhoneLabel,
    this.distanceKm,
    this.locationLabel,
    this.lat,
    this.lng,
  });
}