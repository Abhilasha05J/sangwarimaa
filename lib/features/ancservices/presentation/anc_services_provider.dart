import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import 'package:sangwari_maa/features/ancservices/data/datasource/anc_services_datasource.dart';
import 'package:sangwari_maa/features/ancservices/data/repository/anc_services_repository.dart';
part 'anc_services_provider.g.dart';

@riverpod
AncServicesDatasource ancServicesDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AncServicesDatasource(dio);
}

@riverpod
AncServicesRepository ancServicesRepository(Ref ref) {
  return AncServicesRepository(ref.watch(ancServicesDatasourceProvider));
}