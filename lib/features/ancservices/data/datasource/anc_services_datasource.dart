import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'anc_services_datasource.g.dart';

@RestApi()
abstract class AncServicesDatasource {
  factory AncServicesDatasource(Dio dio,
      {String baseUrl}) = _AncServicesDatasource;

  @GET('/api/v1/women/anc-services')
  Future<HttpResponse<dynamic>> getAncServices();

  @PATCH('/api/v1/women/anc-services/visit/{visitNumber}/checklist')
  Future<HttpResponse<dynamic>> updateChecklistItem(
      @Path('visitNumber') int visitNumber,
      @Body() Map<String, dynamic> body,
      );

  @PATCH('/api/v1/women/anc-services/maternal-nutrition')
  Future<HttpResponse<dynamic>> updateMaternalNutritionField(@Body() Map<String, dynamic> body);

  @POST('/api/v1/women/anc-services/medicine/{medicineType}/mark-taken')
  Future<HttpResponse<dynamic>> markMedicineTaken(
      @Path('medicineType') String medicineType);

  @PATCH('/api/v1/women/anc-services/immunization/{doseType}')
  Future<HttpResponse<dynamic>> updateImmunization(
      @Path('doseType') String doseType,
      @Body() Map<String, dynamic> body,);

  @PATCH('/api/v1/women/anc-services/ultrasound/{scanType}')
  Future<HttpResponse<dynamic>> updateUltrasound(
      @Path('scanType') String scanType,
      @Body() Map<String, dynamic> body,);

  @PATCH('/api/v1/women/anc-services/registration')
  Future<HttpResponse<dynamic>> updateRegistrationField(@Body() Map<String, dynamic> body);

  @GET('/api/v1/women/anc-services/medicine/{medicineType}/calendar')
  Future<HttpResponse<dynamic>> getMedicineCalendar(@Path('medicineType') String medicineType);

  @PATCH('/api/v1/women/anc-services/medicine/{medicineType}/date/{takenDate}')
  Future<HttpResponse<dynamic>> toggleMedicineDate(
      @Path('medicineType') String medicineType,
      @Path('takenDate') String takenDate, // 'YYYY-MM-DD'
      @Body() Map<String, dynamic> body,
      );
}