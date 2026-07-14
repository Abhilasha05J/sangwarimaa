import 'package:sangwari_maa/core/errors/exceptions.dart';
import 'package:sangwari_maa/core/errors/failures.dart';
import 'package:sangwari_maa/features/ancservices/data/datasource/anc_services_datasource.dart';
import 'package:sangwari_maa/features/ancservices/data/model/anc_services_model.dart';

class AncServicesRepository {
  final AncServicesDatasource _datasource;

  AncServicesRepository(this._datasource);

  Map<String, dynamic> _unwrap(dynamic responseData) {
    final envelope = responseData as Map<String, dynamic>;
    if (envelope['success'] != true) {
      throw ServerException(
          envelope['error']?['message'] as String? ?? 'Something went wrong');
    }
    return envelope['data'] as Map<String, dynamic>;
  }

  Future<AncServicesModel> getAncServices() async {
    try {
      final response = await _datasource.getAncServices();
      final data = _unwrap(response.response.data);
      return AncServicesModel.fromJson(data);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<Map<String, dynamic>> updateChecklistItem(int visitNumber, String itemKey, bool checked) async {
    try {
      final response = await _datasource.updateChecklistItem(visitNumber, {
        'item_key': itemKey,
        'checked': checked,
      });
      return _unwrap(response.response.data);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<MaternalNutritionModel> updateMaternalNutritionField(String field, bool checked) async {
    try {
      final response = await _datasource.updateMaternalNutritionField({'field': field, 'checked': checked});
      final data = _unwrap(response.response.data);
      return MaternalNutritionModel(
        nutritionCounsellingReceived: data['nutrition_counselling_received'] as bool,
        weightMonitored: data['weight_monitored'] as bool,
        supplementaryNutritionReceived: data['supplementary_nutrition_received'] as bool,
      );
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<MedicineTrackerItem> markMedicineTaken(String medicineType) async {
    try {
      final response = await _datasource.markMedicineTaken(medicineType);
      final data = _unwrap(response.response.data);
      return MedicineTrackerItem(
          taken: data['doses_taken'] as int, total: data['total_doses'] as int);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<ImmunizationItem> updateImmunization(String doseType,
      {required String status, String? receivedDate}) async {
    try {
      final response = await _datasource.updateImmunization(doseType, {
        'status': status,
        if (receivedDate != null) 'received_date': receivedDate,
      });
      final data = _unwrap(response.response.data);
      return ImmunizationItem(doseType: data['dose_type'] as String,
          status: data['status'] as String,
          date: data['date'] as String?);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<UltrasoundItem> updateUltrasound(String scanType,
      {required String status, String? scanDate}) async {
    try {
      final response = await _datasource.updateUltrasound(scanType, {
        'status': status,
        if (scanDate != null) 'scan_date': scanDate,
      });
      final data = _unwrap(response.response.data);
      return UltrasoundItem(scanType: data['scan_type'] as String,
          status: data['status'] as String,
          scanDate: data['scan_date'] as String?);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  // ── Add these methods ──
  Future<PregnancyRegistrationModel> updateRegistrationField(String field, bool checked) async {
    try {
      final response = await _datasource.updateRegistrationField({'field': field, 'checked': checked});
      final data = _unwrap(response.response.data);
      return PregnancyRegistrationModel(
        isRegistered: data['is_registered'] as bool,
        registeredDate: data['registered_date'] as String?,
        rchIdGenerated: data['rch_id_generated'] as bool,
        mcpCardReceived: data['mcp_card_received'] as bool,
        ashaAssigned: false, // caller must merge this back in from existing state — see controller patch
      );
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<List<String>> getMedicineCalendar(String medicineType) async {
    try {
      final response = await _datasource.getMedicineCalendar(medicineType);
      final data = _unwrap(response.response.data);
      return (data['taken_dates'] as List).cast<String>();
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }

  Future<MedicineTrackerItem> toggleMedicineDate(String medicineType, String isoDate, bool taken) async {
    try {
      final response = await _datasource.toggleMedicineDate(medicineType, isoDate, {'taken': taken});
      final data = _unwrap(response.response.data);
      return MedicineTrackerItem(taken: data['doses_taken'] as int, total: data['total_doses'] as int);
    } catch (e) {
      throw mapExceptionToFailure(e);
    }
  }
}