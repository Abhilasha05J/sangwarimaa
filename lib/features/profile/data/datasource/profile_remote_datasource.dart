import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:sangwari_maa/core/constants/api_endpoints.dart';

part 'profile_remote_datasource.g.dart';

@RestApi()
abstract class ProfileRemoteDataSource {
  factory ProfileRemoteDataSource(Dio dio, {String baseUrl}) = _ProfileRemoteDataSource;

  @PATCH(ApiEndpoints.womenProfile)
  Future<HttpResponse<dynamic>> updateWomenProfile(@Body() Map<String, dynamic> body);

  @PATCH(ApiEndpoints.mitaninProfile)
  Future<HttpResponse<dynamic>> updateMitaninProfile(@Body() Map<String, dynamic> body);
}