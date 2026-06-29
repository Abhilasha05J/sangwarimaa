import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import '../model/women_register_request_model.dart';

part 'registration_remote_datasource.g.dart';

@RestApi()
abstract class RegistrationRemoteDataSource {
  factory RegistrationRemoteDataSource(Dio dio, {String baseUrl}) =
  _RegistrationRemoteDataSource;

  @POST(ApiEndpoints.womenRegister)
  Future<HttpResponse<dynamic>> registerWoman(@Body() WomenRegisterRequestModel body);
}