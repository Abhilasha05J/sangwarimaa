class EmergencyArgs {
  final String dangerSign;       // e.g. "Excessive Bleeding"
  final String mitaninName;
  final String mitaninLocation;
  final String mitaninPhone;
  final String facilityName;     // e.g. "Community Health Centre"
  final double facilityDistKm;
  final String familyPhone;

  const EmergencyArgs({
    required this.dangerSign,
    required this.mitaninName,
    required this.mitaninLocation,
    required this.mitaninPhone,
    required this.facilityName,
    required this.facilityDistKm,
    required this.familyPhone,
  });
}
