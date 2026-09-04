class FacilityData {
  final String type; // 'PHC' | 'CHC' | 'FRU'
  final String name;
  final double distanceKm;
  final int etaMinutes;
  final List<String> schemeTags; // JSY, JSSK, PMSMA
  final double lat;
  final double lng;

  const FacilityData({
    required this.type,
    required this.name,
    required this.distanceKm,
    required this.etaMinutes,
    required this.schemeTags,
    required this.lat,
    required this.lng,
  });
}