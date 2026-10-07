import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_blood_donor_model.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_facility_model.dart';
import 'package:sangwari_maa/features/bpcr/data/model/bpcr_sba_model.dart';

part 'bpcr_remote_datasource.g.dart';

Map<String, dynamic> _unwrap(Map<String, dynamic> json) =>
    (json['data'] as Map<String, dynamic>?) ?? json;
@RestApi()
abstract class BpcrRemoteDataSource {
  factory BpcrRemoteDataSource(Dio dio, {String baseUrl}) = _BpcrRemoteDataSource;

  @GET(ApiEndpoints.bpcrFacilities)
  Future<HttpResponse<FacilitiesResponse>> getFacilities({@Query('q') String? q});

  @PUT(ApiEndpoints.bpcrFacilitySelection)
  Future<HttpResponse<dynamic>> saveFacilitySelection(@Body() Map<String, dynamic> body);

  @GET(ApiEndpoints.bpcrSba)
  Future<HttpResponse<SbaResponse>> getSba();

  @GET('${ApiEndpoints.bpcrAnswers}/{component}')
  Future<HttpResponse<AnswerResponse>> getAnswers(@Path('component') String component);

  @PUT('${ApiEndpoints.bpcrAnswers}/{component}')
  Future<HttpResponse<AnswerResponse>> saveAnswers(
    @Path('component') String component,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiEndpoints.bpcrBloodDonors)
  Future<HttpResponse<BloodDonorListResponse>> getBloodDonors();

  @POST(ApiEndpoints.bpcrBloodDonors)
  Future<HttpResponse<dynamic>> addBloodDonor(@Body() Map<String, dynamic> body);

  @DELETE('${ApiEndpoints.bpcrBloodDonors}/{id}')
  Future<HttpResponse<dynamic>> deleteBloodDonor(@Path('id') String id);

  @GET(ApiEndpoints.bpcrScore)
  Future<HttpResponse<dynamic>> getScoreRaw();

  @GET(ApiEndpoints.bpcrEmergencyHub)
  Future<HttpResponse<dynamic>> getEmergencyHubRaw();

  @GET(ApiEndpoints.bpcrNearestFacilities)
  Future<HttpResponse<NearestFacilitiesResponse>> getNearestFacilities({
    @Query('source') required String source,
    @Query('lat') double? lat,
    @Query('lng') double? lng,
    @Query('limit') int? limit,
  });

  @GET('${ApiEndpoints.bpcrFacilities}/{id}/route')
  Future<HttpResponse<FacilityRouteResponse>> getFacilityRoute(
      @Path('id') String id, {
        @Query('source') required String source,
        @Query('lat') double? lat,
        @Query('lng') double? lng,
      });
}
class FacilitiesResponse {
  final List<BpcrFacilityModel> catchment;
  final List<BpcrFacilityModel> results;
  final List<BpcrFacilityModel> selected;
  FacilitiesResponse({required this.catchment, required this.results, required this.selected});

  factory FacilitiesResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return FacilitiesResponse(
      catchment: (json['catchment'] as List? ?? []).map((e) => BpcrFacilityModel.fromJson(e)).toList(),
      results:   (json['results'] as List? ?? []).map((e) => BpcrFacilityModel.fromJson(e)).toList(),
      selected:  (json['selected'] as List? ?? []).map((e) => BpcrFacilityModel.fromJson(e)).toList(),
    );
  }
}

class NearestOrigin {
  final String source; // 'gps' | 'village'
  final double latitude;
  final double longitude;
  final String? villageName;
  NearestOrigin({required this.source, required this.latitude, required this.longitude, this.villageName});

  factory NearestOrigin.fromJson(Map<String, dynamic> json) => NearestOrigin(
    source: json['source'] as String? ?? 'village',
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    villageName: json['village_name'] as String?,
  );
}

class NearestFacilitiesResponse {
  final NearestOrigin? origin;
  final String? reason; // no_village | village_location_unavailable | no_located_facilities
  final List<BpcrFacilityModel> facilities;
  NearestFacilitiesResponse({required this.origin, required this.reason, required this.facilities});

  factory NearestFacilitiesResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return NearestFacilitiesResponse(
      origin: json['origin'] == null ? null : NearestOrigin.fromJson(json['origin'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      facilities: (json['facilities'] as List? ?? []).map((e) => BpcrFacilityModel.fromJson(e)).toList(),
    );
  }
}

class FacilityRouteResponse {
  final bool available;
  final String? reason; // route_unavailable | no_village | village_location_unavailable
  final int distanceM;
  final int durationS;
  final String? polyline; // Google encoded polyline
  FacilityRouteResponse({
    required this.available,
    this.reason,
    this.distanceM = 0,
    this.durationS = 0,
    this.polyline,
  });

  factory FacilityRouteResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return FacilityRouteResponse(
      available: json['available'] as bool? ?? false,
      reason: json['reason'] as String?,
      distanceM: (json['distance_m'] as num?)?.toInt() ?? 0,
      durationS: (json['duration_s'] as num?)?.toInt() ?? 0,
      polyline: json['polyline'] as String?,
    );
  }
}

class SbaResponse {
  final List<SbaFacilityModel> facilities;
  final AshaContactModel? asha;
  SbaResponse({required this.facilities, required this.asha});

  factory SbaResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return SbaResponse(
      facilities: (json['facilities'] as List? ?? []).map((e) => SbaFacilityModel.fromJson(e)).toList(),
      asha: json['asha'] == null ? null : AshaContactModel.fromJson(json['asha']),
    );
  }
}

class AnswerResponse {
  final String component;
  final Map<String, dynamic> answers;
  AnswerResponse({required this.component, required this.answers});
  factory AnswerResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return AnswerResponse(
      component: json['component'] as String? ?? '',
      answers: Map<String, dynamic>.from(json['answers'] ?? {}),
    );
  }
}

class BloodDonorListResponse {
  final String? selfBloodGroup;
  final List<BloodDonorModel> family;
  final List<BloodDonorModel> community;
  BloodDonorListResponse({required this.selfBloodGroup, required this.family, required this.community});

  factory BloodDonorListResponse.fromJson(Map<String, dynamic> raw) {
    final json = _unwrap(raw);
    return BloodDonorListResponse(
      selfBloodGroup: json['self_blood_group'] as String?,
      family: (json['family'] as List? ?? []).map((e) => BloodDonorModel.fromJson(e)).toList(),
      community: (json['community'] as List? ?? []).map((e) => BloodDonorModel.fromJson(e)).toList(),
    );
  }
}
