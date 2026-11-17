import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import 'package:sangwari_maa/features/careteam/data/model/care_team_models.dart';

part 'care_team_remote_datasource.g.dart';

@RestApi()
abstract class CareTeamRemoteDataSource {
  factory CareTeamRemoteDataSource(Dio dio, {String baseUrl}) = _CareTeamRemoteDataSource;

  @GET(ApiEndpoints.ashaOptions)
  Future<HttpResponse<AshaOptionsResponse>> getOptions({
    @Query('q') String? q,
    @Query('lang') required String lang,
    @Query('limit') int? limit,
  });

  @GET(ApiEndpoints.asha)
  Future<HttpResponse<CareTeamResponse>> getCareTeam({@Query('lang') required String lang});

  @PUT(ApiEndpoints.ashaSelection)
  Future<HttpResponse<CareTeamResponse>> saveCareTeam(
    @Body() Map<String, dynamic> body, {
    @Query('lang') required String lang,
  });
}
