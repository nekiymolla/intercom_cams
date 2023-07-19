import 'package:cams/data/advertising/advertising_controller.dart';
import 'package:cams/widgets/containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/cams/cams_list_controller.dart';
import '../data/token.dart';

class CamsPage extends StatefulWidget {
  const CamsPage({super.key});

  @override
  State<CamsPage> createState() => _CamsPageState();
}

class _CamsPageState extends State<CamsPage> {
  var activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CamsListController(SessionManager.api));
    Get.lazyPut(() => AdvertisingController(SessionManager.api));

    return loadingBodyContainer(context);
  }
}
