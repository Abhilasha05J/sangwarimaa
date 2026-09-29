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
