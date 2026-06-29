import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:sangwari_maa/core/constants/api_endpoints.dart';

part 'auth_remote_datasource.g.dart';

@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) = _AuthRemoteDataSource;

  @POST(ApiEndpoints.sendOtp)
  Future<HttpResponse<dynamic>> sendOtp(@Body() Map<String, dynamic> body);

  @POST(ApiEndpoints.verifyOtp)
  Future<HttpResponse<dynamic>> verifyOtp(@Body() Map<String, dynamic> body);

  @POST(ApiEndpoints.refresh)
  Future<HttpResponse<dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @POST(ApiEndpoints.logout)
  Future<HttpResponse<dynamic>> logout();

  @GET(ApiEndpoints.me)
  Future<HttpResponse<dynamic>> getMe();

  @POST(ApiEndpoints.updateFcm)
  Future<HttpResponse<dynamic>> updateFcmToken(@Body() Map<String, dynamic> body);
}