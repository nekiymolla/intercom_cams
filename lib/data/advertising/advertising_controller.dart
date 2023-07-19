import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'advertising_data_view_model.dart';
import 'advertising_repository/advertising_repository.dart';

class AdvertisingController extends GetxController {
  final Dio _dio;

  late final AdvertisingRepository _repositoryAdvertising =
      AdvertisingRepository(_dio);
  RxBool isLoadingGetAdvertising = true.obs, hasError = false.obs;
  final String errorMessage = 'Повторите попытку';
  RxList<AdvertisingDataViewModel> advertising =
      <AdvertisingDataViewModel>[].obs;

  AdvertisingController(this._dio);
  Future<void> getAdvertising() async {
    isLoadingGetAdvertising(true);
    final resultOrException = await _repositoryAdvertising.getAdvertising();
    resultOrException.fold(
        (left) => {isLoadingGetAdvertising(false), hasError(true)},
        (data) => {isLoadingGetAdvertising(false), advertising(data)});
  }

  Future<void> onRefresh() async {
    hasError(false);
    advertising.clear();
    await getAdvertising();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    getAdvertising();
  }
}
