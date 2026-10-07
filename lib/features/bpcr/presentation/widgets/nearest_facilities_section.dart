// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart' show LatLng;
// import 'package:sangwari_maa/core/constants/app_colors.dart';
// import 'package:sangwari_maa/core/constants/app_spacing.dart';
// import 'package:sangwari_maa/core/constants/app_typography.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/features/bpcr/data/datasource/bpcr_remote_datasource.dart';
// import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_nearest_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
// import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';
//
// // TODO: set this to the app's real applicationId (OSM tile servers ask for it).
// const _userAgentPackage = 'com.sangwari_maa.app';
//
// /// "Nearest health facilities": origin toggle (her address / current location),
// /// a map above, and the nearest facility of each type (up to 4) as tick-to-select cards.
// /// Ticking uses the same selection provider as the rest of the screen, so the
// /// existing Save button, "Saved facilities" and delivery-place picker all work.
// class NearestFacilitiesSection extends ConsumerWidget {
//   const NearestFacilitiesSection({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = AppLocalizations.of(context)!;
//     final origin = ref.watch(facilityOriginProvider);
//     final nearestAsync = ref.watch(nearestFacilitiesProvider);
//     final selectedIds = ref.watch(bpcrFacilitySelectionProvider);
//     final controller = ref.read(facilityOriginProvider.notifier);
//
//     Widget body;
//     if (origin.mode == FacilityOriginMode.gps && origin.locating) {
//       body = _StatusRow(text: l10n.bpcr_nearest_locating, loading: true);
//     } else if (origin.mode == FacilityOriginMode.gps && origin.issue != null) {
//       body = _GpsIssueNotice(issue: origin.issue!);
//     } else {
//       body = nearestAsync.when(
//         loading: () => const Padding(
//           padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
//           child: Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
//         ),
//         error: (e, _) => _Notice(
//           message: l10n.bpcr_facilities_load_error,
//           actions: [
//             _NoticeAction(l10n.bpcr_nearest_try_again, () => ref.invalidate(nearestFacilitiesProvider)),
//           ],
//         ),
//         data: (data) {
//           if (data == null) return const SizedBox.shrink();
//           if (data.facilities.isEmpty || data.origin == null) {
//             return _Notice(
//               message: switch (data.reason) {
//                 'no_village' => l10n.bpcr_nearest_no_village,
//                 'village_location_unavailable' => l10n.bpcr_nearest_village_no_location,
//                 _ => l10n.bpcr_nearest_none,
//               },
//               actions: [
//                 if (origin.mode == FacilityOriginMode.village)
//                   _NoticeAction(l10n.bpcr_nearest_use_location, controller.useCurrentLocation),
//               ],
//             );
//           }
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _NearestMap(origin: data.origin!, facilities: data.facilities, selectedIds: selectedIds),
//               const SizedBox(height: AppSpacing.md),
//               for (var i = 0; i < data.facilities.length; i++)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: AppSpacing.md),
//                   child: FacilityCard(
//                     facility: data.facilities[i],
//                     isSelected: selectedIds.contains(data.facilities[i].id),
//                     rank: i + 1,
//                     distanceLabel: data.facilities[i].distanceKm == null
//                         ? null
//                         : l10n.bpcr_nearest_distance_km(data.facilities[i].distanceKm!.toStringAsFixed(1)),
//                     onToggleSelect: () =>
//                         ref.read(bpcrFacilitySelectionProvider.notifier).toggle(data.facilities[i].id),
//                   ),
//                 ),
//             ],
//           );
//         },
//       );
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(l10n.bpcr_nearest_title, style: AppTypography.titleMedium),
//         const SizedBox(height: AppSpacing.xs),
//         Text(l10n.bpcr_nearest_subtitle,
//             style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
//         const SizedBox(height: AppSpacing.sm),
//         Wrap(
//           spacing: AppSpacing.sm,
//           children: [
//             ChoiceChip(
//               avatar: const Icon(Icons.home_outlined, size: 18),
//               label: Text(l10n.bpcr_nearest_use_address),
//               selected: origin.mode == FacilityOriginMode.village,
//               selectedColor: AppColors.pinkText.withValues(alpha: 0.12),
//               onSelected: (_) => controller.useVillage(),
//             ),
//             ChoiceChip(
//               avatar: const Icon(Icons.my_location, size: 18),
//               label: Text(l10n.bpcr_nearest_use_location),
//               selected: origin.mode == FacilityOriginMode.gps,
//               selectedColor: AppColors.pinkText.withValues(alpha: 0.12),
//               onSelected: (_) => controller.useCurrentLocation(),
//             ),
//           ],
//         ),
//         const SizedBox(height: AppSpacing.md),
//         body,
//       ],
//     );
//   }
// }
//
// class _NearestMap extends StatelessWidget {
//   final NearestOrigin origin;
//   final List<BpcrFacilityModel> facilities;
//   final Set<String> selectedIds;
//   const _NearestMap({required this.origin, required this.facilities, required this.selectedIds});
//
//   @override
//   Widget build(BuildContext context) {
//     final originPoint = LatLng(origin.latitude, origin.longitude);
//     final located = [
//       for (var i = 0; i < facilities.length; i++)
//         if (facilities[i].latitude != null && facilities[i].longitude != null) (i, facilities[i]),
//     ];
//     final points = [originPoint, for (final (_, f) in located) LatLng(f.latitude!, f.longitude!)];
//
//     // Keyed on the data (not on ticks) so the camera re-fits when the origin or
//     // results change, but ticking a card doesn't reset the map.
//     final mapKey = ValueKey(
//         '${origin.source}-${origin.latitude}-${origin.longitude}-${facilities.map((f) => f.id).join(',')}');
//
//     return SizedBox(
//       height: 220,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
//         child: FlutterMap(
//           key: mapKey,
//           options: MapOptions(
//             initialCameraFit: CameraFit.bounds(
//               bounds: LatLngBounds.fromPoints(points),
//               padding: const EdgeInsets.all(48),
//               maxZoom: 15,
//             ),
//             // Two-finger pan/zoom only, so one-finger drags still scroll the page.
//             interactionOptions: const InteractionOptions(
//               flags: InteractiveFlag.pinchZoom | InteractiveFlag.pinchMove | InteractiveFlag.doubleTapZoom,
//             ),
//           ),
//           children: [
//             TileLayer(
//               urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//               userAgentPackageName: _userAgentPackage,
//             ),
//             MarkerLayer(markers: [
//               Marker(
//                 point: originPoint,
//                 width: 36,
//                 height: 36,
//                 child: Icon(
//                   origin.source == 'gps' ? Icons.my_location : Icons.home_rounded,
//                   color: AppColors.pinkText,
//                   size: 30,
//                 ),
//               ),
//               for (final (i, f) in located)
//                 Marker(
//                   point: LatLng(f.latitude!, f.longitude!),
//                   width: 34,
//                   height: 34,
//                   child: _NumberPin(
//                     number: i + 1,
//                     color: selectedIds.contains(f.id) ? AppColors.riskGreen : AppColors.gradStart,
//                   ),
//                 ),
//             ]),
//             const RichAttributionWidget(
//               attributions: [TextSourceAttribution('OpenStreetMap contributors')],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _NumberPin extends StatelessWidget {
//   final int number;
//   final Color color;
//   const _NumberPin({required this.number, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white, width: 2),
//         boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
//       ),
//       child: Text('$number',
//           style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
//     );
//   }
// }
//
// class _StatusRow extends StatelessWidget {
//   final String text;
//   final bool loading;
//   const _StatusRow({required this.text, this.loading = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
//       child: Row(children: [
//         if (loading)
//           const SizedBox(
//             width: 18,
//             height: 18,
//             child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.pinkText),
//           ),
//         if (loading) const SizedBox(width: AppSpacing.sm),
//         Expanded(child: Text(text, style: AppTypography.bodyMedium)),
//       ]),
//     );
//   }
// }
//
// class _NoticeAction {
//   final String label;
//   final VoidCallback onTap;
//   const _NoticeAction(this.label, this.onTap);
// }
//
// class _Notice extends StatelessWidget {
//   final String message;
//   final List<_NoticeAction> actions;
//   const _Notice({required this.message, this.actions = const []});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(AppSpacing.md),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8F8F8),
//         borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(message, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
//           if (actions.isNotEmpty)
//             Wrap(
//               spacing: AppSpacing.sm,
//               children: [
//                 for (final a in actions)
//                   TextButton(
//                     onPressed: a.onTap,
//                     child: Text(a.label, style: const TextStyle(color: AppColors.pinkText)),
//                   ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// class _GpsIssueNotice extends ConsumerWidget {
//   final GpsIssue issue;
//   const _GpsIssueNotice({required this.issue});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = AppLocalizations.of(context)!;
//     final controller = ref.read(facilityOriginProvider.notifier);
//     final message = switch (issue) {
//       GpsIssue.serviceOff => l10n.bpcr_nearest_service_off,
//       GpsIssue.denied => l10n.bpcr_nearest_permission_denied,
//       GpsIssue.deniedForever => l10n.bpcr_nearest_permission_forever,
//       GpsIssue.failed => l10n.bpcr_nearest_location_failed,
//     };
//     return _Notice(
//       message: message,
//       actions: [
//         if (issue == GpsIssue.deniedForever)
//           _NoticeAction(l10n.bpcr_nearest_open_settings, Geolocator.openAppSettings)
//         else if (issue == GpsIssue.serviceOff)
//           _NoticeAction(l10n.bpcr_nearest_open_settings, Geolocator.openLocationSettings)
//         else
//           _NoticeAction(l10n.bpcr_nearest_try_again, controller.useCurrentLocation),
//         _NoticeAction(l10n.bpcr_nearest_use_address_instead, controller.useVillage),
//       ],
//     );
//   }
// }


import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sangwari_maa/core/constants/app_colors.dart';
import 'package:sangwari_maa/core/constants/app_spacing.dart';
import 'package:sangwari_maa/core/constants/app_typography.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/features/bpcr/data/datasource/bpcr_remote_datasource.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_nearest_providers.dart';
import 'package:sangwari_maa/features/bpcr/presentation/providers/bpcr_providers.dart';
import 'package:sangwari_maa/features/bpcr/presentation/widgets/facility_card.dart';

/// "Nearest health facilities": origin toggle (her address / current location),
/// a map above, and the nearest facility of each type (up to 4) as tick-to-select cards.
/// Ticking uses the same selection provider as the rest of the screen, so the
/// existing Save button, "Saved facilities" and delivery-place picker all work.
class NearestFacilitiesSection extends ConsumerWidget {
  const NearestFacilitiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final origin = ref.watch(facilityOriginProvider);
    final nearestAsync = ref.watch(nearestFacilitiesProvider);
    final selectedIds = ref.watch(bpcrFacilitySelectionProvider);
    final controller = ref.read(facilityOriginProvider.notifier);
    final routeTarget = ref.watch(routeTargetProvider);
    final routeAsync = ref.watch(facilityRouteProvider);
    final routeValue = routeAsync.asData?.value;
    final activeRoute = (routeValue != null && routeValue.available) ? routeValue : null;

    Widget body;
    if (origin.mode == FacilityOriginMode.gps && origin.locating) {
      body = _StatusRow(text: l10n.bpcr_nearest_locating, loading: true);
    } else if (origin.mode == FacilityOriginMode.gps && origin.issue != null) {
      body = _GpsIssueNotice(issue: origin.issue!);
    } else {
      body = nearestAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Center(child: CircularProgressIndicator(color: AppColors.pinkText)),
        ),
        error: (e, _) => _Notice(
          message: l10n.bpcr_facilities_load_error,
          actions: [
            _NoticeAction(l10n.bpcr_nearest_try_again, () => ref.invalidate(nearestFacilitiesProvider)),
          ],
        ),
        data: (data) {
          if (data == null) return const SizedBox.shrink();
          if (data.facilities.isEmpty || data.origin == null) {
            return _Notice(
              message: switch (data.reason) {
                'no_village' => l10n.bpcr_nearest_no_village,
                'village_location_unavailable' => l10n.bpcr_nearest_village_no_location,
                _ => l10n.bpcr_nearest_none,
              },
              actions: [
                if (origin.mode == FacilityOriginMode.village)
                  _NoticeAction(l10n.bpcr_nearest_use_location, controller.useCurrentLocation),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NearestMap(
                origin: data.origin!,
                facilities: data.facilities,
                selectedIds: selectedIds,
                routePolyline: activeRoute?.polyline,
              ),
              const SizedBox(height: AppSpacing.md),
              for (var i = 0; i < data.facilities.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: FacilityCard(
                    facility: data.facilities[i],
                    isSelected: selectedIds.contains(data.facilities[i].id),
                    rank: i + 1,
                    distanceLabel: data.facilities[i].distanceKm == null
                        ? null
                        : l10n.bpcr_nearest_distance_km(data.facilities[i].distanceKm!.toStringAsFixed(1)),
                    onToggleSelect: () =>
                        ref.read(bpcrFacilitySelectionProvider.notifier).toggle(data.facilities[i].id),
                    // Route preview: a separate button, so tapping the card still just ticks it.
                    onShowRoute: () => ref
                        .read(routeTargetProvider.notifier)
                        .set(routeTarget == data.facilities[i].id ? null : data.facilities[i].id),
                    routeLabel: routeTarget == data.facilities[i].id
                        ? l10n.bpcr_nearest_route_hide
                        : l10n.bpcr_nearest_route_show,
                    routeLoading: routeTarget == data.facilities[i].id && routeAsync.isLoading,
                    routeSummary:
                    routeTarget == data.facilities[i].id ? _routeSummary(l10n, routeAsync) : null,
                  ),
                ),
            ],
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.bpcr_nearest_title, style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.xs),
        Text(l10n.bpcr_nearest_subtitle,
            style: AppTypography.bodySmall.copyWith(color: AppColors.hintText)),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            ChoiceChip(
              avatar: const Icon(Icons.home_outlined, size: 18),
              label: Text(l10n.bpcr_nearest_use_address),
              selected: origin.mode == FacilityOriginMode.village,
              selectedColor: AppColors.pinkText.withValues(alpha: 0.12),
              onSelected: (_) => controller.useVillage(),
            ),
            ChoiceChip(
              avatar: const Icon(Icons.my_location, size: 18),
              label: Text(l10n.bpcr_nearest_use_location),
              selected: origin.mode == FacilityOriginMode.gps,
              selectedColor: AppColors.pinkText.withValues(alpha: 0.12),
              onSelected: (_) => controller.useCurrentLocation(),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        body,
      ],
    );
  }
}

class _NearestMap extends StatefulWidget {
  final NearestOrigin origin;
  final List<BpcrFacilityModel> facilities;
  final Set<String> selectedIds;
  final String? routePolyline; // encoded polyline of the route she asked for, if any
  const _NearestMap({
    required this.origin,
    required this.facilities,
    required this.selectedIds,
    this.routePolyline,
  });

  @override
  State<_NearestMap> createState() => _NearestMapState();
}

class _NearestMapState extends State<_NearestMap> {
  GoogleMapController? _controller;
  // Pin images are drawn once and cached: 'origin', and '<rank>-s' / '<rank>-u' (selected / unselected).
  final Map<String, BitmapDescriptor> _icons = {};
  List<LatLng> _routePoints = const [];

  String _dataKey(_NearestMap w) =>
      '${w.origin.source}-${w.origin.latitude}-${w.origin.longitude}-${w.facilities.map((f) => f.id).join(',')}';

  String _pinKey(int index) =>
      '${index + 1}-${widget.selectedIds.contains(widget.facilities[index].id) ? 's' : 'u'}';

  static List<LatLng> _decode(String? encoded) =>
      (encoded == null || encoded.isEmpty) ? const [] : _decodePolyline(encoded);

  @override
  void initState() {
    super.initState();
    _routePoints = _decode(widget.routePolyline);
    _loadIcons();
  }

  @override
  void didUpdateWidget(covariant _NearestMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    final routeChanged = oldWidget.routePolyline != widget.routePolyline;
    if (routeChanged) _routePoints = _decode(widget.routePolyline);
    _loadIcons();
    // Re-fit when the origin, results or route change; ticking a card must not move the camera.
    if (routeChanged || _dataKey(oldWidget) != _dataKey(widget)) _fitCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _loadIcons() async {
    var changed = false;
    if (!_icons.containsKey('origin')) {
      _icons['origin'] = await _drawPin(color: AppColors.pinkText);
      changed = true;
    }
    for (var i = 0; i < widget.facilities.length; i++) {
      final key = _pinKey(i);
      if (_icons.containsKey(key)) continue;
      final selected = key.endsWith('-s');
      _icons[key] = await _drawPin(
        color: selected ? AppColors.riskGreen : AppColors.gradStart,
        label: '${i + 1}',
      );
      changed = true;
    }
    if (changed && mounted) setState(() {});
  }

  List<LatLng> get _points => [
    LatLng(widget.origin.latitude, widget.origin.longitude),
    for (final f in widget.facilities)
      if (f.latitude != null && f.longitude != null) LatLng(f.latitude!, f.longitude!),
  ];

  /// Fits everything (her location + the facilities), or just the route when one is showing.
  Future<void> _fitCamera({Duration delay = const Duration(milliseconds: 300)}) async {
    final c = _controller;
    if (c == null) return;
    final pts = _routePoints.length >= 2 ? _routePoints : _points;
    final lats = pts.map((p) => p.latitude);
    final lngs = pts.map((p) => p.longitude);
    final minLat = lats.reduce(math.min), maxLat = lats.reduce(math.max);
    final minLng = lngs.reduce(math.min), maxLng = lngs.reduce(math.max);
    try {
      // newLatLngBounds throws if the map hasn't been laid out yet, so give it a moment.
      if (delay > Duration.zero) await Future<void>.delayed(delay);
      if (!mounted) return;
      if ((maxLat - minLat) < 0.0005 && (maxLng - minLng) < 0.0005) {
        await c.animateCamera(CameraUpdate.newLatLngZoom(pts.first, 15));
      } else {
        await c.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng)),
          48,
        ));
      }
    } catch (_) {
      // Camera fit is cosmetic; never let it break the screen.
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final origin = LatLng(widget.origin.latitude, widget.origin.longitude);
    final markers = <Marker>{
      if (_icons['origin'] != null)
        Marker(
          markerId: const MarkerId('origin'),
          position: origin,
          icon: _icons['origin']!,
          anchor: const Offset(0.5, 0.5),
        ),
      for (var i = 0; i < widget.facilities.length; i++)
        if (widget.facilities[i].latitude != null &&
            widget.facilities[i].longitude != null &&
            _icons[_pinKey(i)] != null)
          Marker(
            markerId: MarkerId(widget.facilities[i].id),
            position: LatLng(widget.facilities[i].latitude!, widget.facilities[i].longitude!),
            icon: _icons[_pinKey(i)]!,
            anchor: const Offset(0.5, 0.5),
            infoWindow: InfoWindow(
              title: '${i + 1}. ${widget.facilities[i].name}',
              snippet: widget.facilities[i].facilityType,
            ),
          ),
    };
    final polylines = <Polyline>{
      if (_routePoints.length >= 2)
        Polyline(
          polylineId: const PolylineId('route'),
          points: _routePoints,
          color: AppColors.gradStart,
          width: 5,
        ),
    };

    return SizedBox(
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: origin, zoom: 13),
                markers: markers,
                polylines: polylines,
                onMapCreated: (c) {
                  _controller = c;
                  _fitCamera();
                },
                // The map sits inside a scrolling page: no one-finger panning, so the page
                // still scrolls. She can zoom with the +/- buttons and tap a pin for its name.
                scrollGesturesEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                zoomControlsEnabled: true,
                myLocationButtonEnabled: false,
                compassEnabled: false,
              ),
            ),
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.sm,
              child: FloatingActionButton.small(
                heroTag: null,
                elevation: 2,
                backgroundColor: Colors.white,
                foregroundColor: AppColors.pinkText,
                tooltip: l10n.bpcr_nearest_recenter,
                onPressed: () => _fitCamera(delay: Duration.zero),
                child: const Icon(Icons.center_focus_strong),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Draws a round numbered pin (or, with no label, a "you are here" dot) as a PNG.
Future<BitmapDescriptor> _drawPin({required Color color, String? label}) async {
  const logical = 34.0;
  const scale = 3.0; // draw at 3x so it stays sharp on dense screens
  const px = logical * scale;
  const center = Offset(px / 2, px / 2);

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawCircle(center, px / 2, Paint()..color = Colors.white);
  canvas.drawCircle(center, px / 2 - 3 * scale, Paint()..color = color);
  if (label != null) {
    final tp = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(color: Colors.white, fontSize: 15 * scale, fontWeight: FontWeight.w700),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  } else {
    canvas.drawCircle(center, 4 * scale, Paint()..color = Colors.white);
  }
  final image = await recorder.endRecording().toImage(px.toInt(), px.toInt());
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  return BitmapDescriptor.bytes(data!.buffer.asUint8List(), width: logical, height: logical);
}

class _StatusRow extends StatelessWidget {
  final String text;
  final bool loading;
  const _StatusRow({required this.text, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(children: [
        if (loading)
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.pinkText),
          ),
        if (loading) const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(text, style: AppTypography.bodyMedium)),
      ]),
    );
  }
}

class _NoticeAction {
  final String label;
  final VoidCallback onTap;
  const _NoticeAction(this.label, this.onTap);
}

class _Notice extends StatelessWidget {
  final String message;
  final List<_NoticeAction> actions;
  const _Notice({required this.message, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message, style: AppTypography.bodyMedium.copyWith(color: AppColors.hintText)),
          if (actions.isNotEmpty)
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                for (final a in actions)
                  TextButton(
                    onPressed: a.onTap,
                    child: Text(a.label, style: const TextStyle(color: AppColors.pinkText)),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _GpsIssueNotice extends ConsumerWidget {
  final GpsIssue issue;
  const _GpsIssueNotice({required this.issue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.read(facilityOriginProvider.notifier);
    final message = switch (issue) {
      GpsIssue.serviceOff => l10n.bpcr_nearest_service_off,
      GpsIssue.denied => l10n.bpcr_nearest_permission_denied,
      GpsIssue.deniedForever => l10n.bpcr_nearest_permission_forever,
      GpsIssue.failed => l10n.bpcr_nearest_location_failed,
    };
    return _Notice(
      message: message,
      actions: [
        if (issue == GpsIssue.deniedForever)
          _NoticeAction(l10n.bpcr_nearest_open_settings, Geolocator.openAppSettings)
        else if (issue == GpsIssue.serviceOff)
          _NoticeAction(l10n.bpcr_nearest_open_settings, Geolocator.openLocationSettings)
        else
          _NoticeAction(l10n.bpcr_nearest_try_again, controller.useCurrentLocation),
        _NoticeAction(l10n.bpcr_nearest_use_address_instead, controller.useVillage),
      ],
    );
  }
}


/// "By road: 3.2 km · 7 min", the "unavailable" message, or null while there is nothing to show.
String? _routeSummary(AppLocalizations l10n, AsyncValue<FacilityRouteResponse?> async) {
  if (async.isLoading) return null;
  if (async.hasError) return l10n.bpcr_nearest_route_unavailable;
  final r = async.asData?.value;
  if (r == null) return null;
  if (!r.available) return l10n.bpcr_nearest_route_unavailable;
  return l10n.bpcr_nearest_route_summary(
    (r.distanceM / 1000).toStringAsFixed(1),
    _formatDuration(l10n, r.durationS),
  );
}

String _formatDuration(AppLocalizations l10n, int seconds) {
  final minutes = math.max(1, (seconds / 60).round());
  if (minutes < 60) return l10n.bpcr_nearest_route_min(minutes.toString());
  return l10n.bpcr_nearest_route_hr_min((minutes ~/ 60).toString(), (minutes % 60).toString());
}

/// Standard Google encoded-polyline decoder (so no extra package is needed).
List<LatLng> _decodePolyline(String encoded) {
  final points = <LatLng>[];
  var index = 0, lat = 0, lng = 0;
  try {
    while (index < encoded.length) {
      for (var axis = 0; axis < 2; axis++) {
        var shift = 0, result = 0;
        int b;
        do {
          b = encoded.codeUnitAt(index++) - 63;
          result |= (b & 0x1f) << shift;
          shift += 5;
        } while (b >= 0x20);
        final delta = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
        if (axis == 0) {
          lat += delta;
        } else {
          lng += delta;
        }
      }
      points.add(LatLng(lat / 1e5, lng / 1e5));
    }
  } on RangeError {
    // Truncated string: keep the points decoded so far.
  }
  return points;
}