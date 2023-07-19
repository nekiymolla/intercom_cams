// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// import '../data/advertising/advertising_controller.dart';
// import '../data/cams/cams_list_controller.dart';

// CamsListController get _controllerCamsList => Get.find<CamsListController>();
// AdvertisingController get _controllerAdvert =>
//     Get.find<AdvertisingController>();

// Widget _body(BuildContext context) => Obx((() => Column(
//       children: <Widget>[
//         Expanded(
//             child: _controllerCamsList.isLoadingGetAllCams.value &&
//                     _controllerAdvert.isLoadingGetAdvertising.value
//                 ? const Center(
//                     // ignore: unnecessary_const
//                     child: const CircularProgressIndicator(
//                     color: Color(0xFF04764E),
//                   ))
//                 : _restaurantsList())
//       ],
//     )));
