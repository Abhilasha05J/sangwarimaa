import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import '../model/village_model.dart';

part 'village_remote_datasource.g.dart';

// Add to ApiEndpoints (wherever womenRegister etc. live):
//   static const String villages = '/villages';

@RestApi()
abstract class VillageRemoteDataSource {
  factory VillageRemoteDataSource(Dio dio, {String baseUrl}) =
      _VillageRemoteDataSource;

  @GET(ApiEndpoints.villages)
  Future<HttpResponse<VillageListResponse>> searchVillages({
    @Query('q') String? q,
    @Query('block') String? block,
    @Query('limit') int limit = 50,
  });
}

// Thin wrapper matching the endpoint's {"villages": [...]} envelope.
class VillageListResponse {
  final List<VillageModel> villages;
  VillageListResponse({required this.villages});

  factory VillageListResponse.fromJson(Map<String, dynamic> json) =>
      VillageListResponse(
        villages: (json['villages'] as List)
            .map((e) => VillageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
