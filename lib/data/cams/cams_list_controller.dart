import 'package:cams/data/cams/cams_list_data_view_model.dart';
import 'package:cams/data/cams/repository/cams_list_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CamsListController extends GetxController {
  final Dio _dio;
  late final CamsListRepository _repositoryCamsList = CamsListRepository(_dio);
  RxBool isLoadingGetAllCams = true.obs, hasError = false.obs;
  final String errorMessage = 'Повторите попытку';
  RxList<CamsListDataViewModel> cams = <CamsListDataViewModel>[].obs;

  CamsListController(this._dio);
  Future<void> getAllCams() async {
    isLoadingGetAllCams(true);
    final resultOrException = await _repositoryCamsList.getAllCams();
    resultOrException.fold(
        (left) => {isLoadingGetAllCams(false), hasError(true)},
        (data) => {isLoadingGetAllCams(false), cams(data)});
  }

  Future<void> onRefresh() async {
    hasError(false);
    cams.clear();
    await getAllCams();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    getAllCams();
  }
}
