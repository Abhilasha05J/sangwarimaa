// import 'package:geolocator/geolocator.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:sangwari_maa/features/bpcr/data/datasource/bpcr_remote_datasource.dart';
// import 'bpcr_providers.dart';
//
// part 'bpcr_nearest_providers.g.dart';
//
// /// Where "nearest" is measured from.
// enum FacilityOriginMode { village, gps }
//
// enum GpsIssue { serviceOff, denied, deniedForever, failed }
//
// class FacilityOriginState {
//   final FacilityOriginMode mode;
//   final bool locating;
//   final double? lat;
//   final double? lng;
//   final GpsIssue? issue;
//
//   const FacilityOriginState._(this.mode, {this.locating = false, this.lat, this.lng, this.issue});
//
//   const FacilityOriginState.village() : this._(FacilityOriginMode.village);
//   const FacilityOriginState.locating() : this._(FacilityOriginMode.gps, locating: true);
//   const FacilityOriginState.gps(double lat, double lng) : this._(FacilityOriginMode.gps, lat: lat, lng: lng);
//   const FacilityOriginState.failed(GpsIssue issue) : this._(FacilityOriginMode.gps, issue: issue);
//
//   bool get hasFix => lat != null && lng != null;
// }
//
// /// Starts on her village (no permission prompt). She can switch to GPS.
// @riverpod
// class FacilityOrigin extends _$FacilityOrigin {
//   @override
//   FacilityOriginState build() => const FacilityOriginState.village();
//
//   void useVillage() => state = const FacilityOriginState.village();
//
//   Future<void> useCurrentLocation() async {
//     state = const FacilityOriginState.locating();
//     try {
//       if (!await Geolocator.isLocationServiceEnabled()) {
//         if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.serviceOff);
//         return;
//       }
//       var permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//       }
//       if (permission == LocationPermission.deniedForever) {
//         if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.deniedForever);
//         return;
//       }
//       if (permission == LocationPermission.denied) {
//         if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.denied);
//         return;
//       }
//       final pos = await Geolocator.getCurrentPosition(
//         locationSettings: const LocationSettings(
//           accuracy: LocationAccuracy.high,
//           timeLimit: Duration(seconds: 15),
//         ),
//       );
//       if (ref.mounted) state = FacilityOriginState.gps(pos.latitude, pos.longitude);
//     } catch (_) {
//       if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.failed);
//     }
//   }
// }
//
// /// The nearest facility of each type (up to 4) for the current origin. Returns null while GPS is
// /// still locating or has failed (the section widget shows that state itself).
// @riverpod
// Future<NearestFacilitiesResponse?> nearestFacilities(Ref ref) async {
//   final origin = ref.watch(facilityOriginProvider);
//   final repo = ref.read(bpcrRepositoryProvider);
//
//   if (origin.mode == FacilityOriginMode.gps) {
//     if (!origin.hasFix) return null;
//     final result = await repo.getNearestFacilities(source: 'gps', lat: origin.lat, lng: origin.lng);
//     return result.fold((f) => throw f, (r) => r);
//   }
//   final result = await repo.getNearestFacilities(source: 'village');
//   return result.fold((f) => throw f, (r) => r);
// }
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/features/bpcr/data/datasource/bpcr_remote_datasource.dart';
import 'bpcr_providers.dart';

part 'bpcr_nearest_providers.g.dart';

/// Where "nearest" is measured from.
enum FacilityOriginMode { village, gps }

enum GpsIssue { serviceOff, denied, deniedForever, failed }

class FacilityOriginState {
  final FacilityOriginMode mode;
  final bool locating;
  final double? lat;
  final double? lng;
  final GpsIssue? issue;

  const FacilityOriginState._(this.mode, {this.locating = false, this.lat, this.lng, this.issue});

  const FacilityOriginState.village() : this._(FacilityOriginMode.village);
  const FacilityOriginState.locating() : this._(FacilityOriginMode.gps, locating: true);
  const FacilityOriginState.gps(double lat, double lng) : this._(FacilityOriginMode.gps, lat: lat, lng: lng);
  const FacilityOriginState.failed(GpsIssue issue) : this._(FacilityOriginMode.gps, issue: issue);

  bool get hasFix => lat != null && lng != null;
}

/// Starts on her village (no permission prompt). She can switch to GPS.
@riverpod
class FacilityOrigin extends _$FacilityOrigin {
  @override
  FacilityOriginState build() => const FacilityOriginState.village();

  void useVillage() {
    ref.read(routeTargetProvider.notifier).set(null);
    state = const FacilityOriginState.village();
  }

  Future<void> useCurrentLocation() async {
    ref.read(routeTargetProvider.notifier).set(null);
    state = const FacilityOriginState.locating();
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.serviceOff);
        return;
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.deniedForever);
        return;
      }
      if (permission == LocationPermission.denied) {
        if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.denied);
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );
      if (ref.mounted) state = FacilityOriginState.gps(pos.latitude, pos.longitude);
    } catch (_) {
      if (ref.mounted) state = const FacilityOriginState.failed(GpsIssue.failed);
    }
  }
}

/// The nearest facility of each type (up to 4) for the current origin. Returns null while GPS is
/// still locating or has failed (the section widget shows that state itself).
@riverpod
Future<NearestFacilitiesResponse?> nearestFacilities(Ref ref) async {
  final origin = ref.watch(facilityOriginProvider);
  final repo = ref.read(bpcrRepositoryProvider);

  if (origin.mode == FacilityOriginMode.gps) {
    if (!origin.hasFix) return null;
    final result = await repo.getNearestFacilities(source: 'gps', lat: origin.lat, lng: origin.lng);
    return result.fold((f) => throw f, (r) => r);
  }
  final result = await repo.getNearestFacilities(source: 'village');
  return result.fold((f) => throw f, (r) => r);
}

/// Which nearest-facility card she tapped "Show route" on (null = none).
@riverpod
class RouteTarget extends _$RouteTarget {
  @override
  String? build() => null;
  void set(String? facilityId) => state = facilityId;
}

// Every route request is billed by Google, so never auto-retry a failed one.
Duration? _noRetry(int retryCount, Object error) => null;

/// Road route from her origin to the tapped facility. Fetched only when a card's
/// "Show route" is tapped; null while nothing is selected.
@Riverpod(retry: _noRetry)
Future<FacilityRouteResponse?> facilityRoute(Ref ref) async {
  final facilityId = ref.watch(routeTargetProvider);
  if (facilityId == null) return null;
  final origin = ref.watch(facilityOriginProvider);
  final repo = ref.read(bpcrRepositoryProvider);

  if (origin.mode == FacilityOriginMode.gps) {
    if (!origin.hasFix) return null;
    final result = await repo.getFacilityRoute(facilityId, source: 'gps', lat: origin.lat, lng: origin.lng);
    return result.fold((f) => throw f, (r) => r);
  }
  final result = await repo.getFacilityRoute(facilityId, source: 'village');
  return result.fold((f) => throw f, (r) => r);
}