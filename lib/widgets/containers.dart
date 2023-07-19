import 'dart:io';

import 'package:cams/data/advertising/advertising_controller.dart';
import 'package:cams/data/advertising/advertising_data_view_model.dart';
import 'package:cams/data/cams/cams_list_controller.dart';
import 'package:cams/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

import '../data/token.dart';
import 'dialog.dart';

VlcPlayerController createControllerFromUrl(String url) {
  final VlcPlayerController _videoPlayerController =
      VlcPlayerController.network(
    url,
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );
  print('creating ${url}');
  return _videoPlayerController;
}

CamsListController get _controllerCamsList => Get.find<CamsListController>();
AdvertisingController get _controllerAdvert =>
    Get.find<AdvertisingController>();

final apiProvider = Provider(create: (ref) => SessionManager());

Widget OneCamContainer(BuildContext context, int index) {
  Future<void> OpenDoor() async {
    SessionManager.api.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    try {
      apiProvider;
      var response = await SessionManager.api.post(
        ("http://api.relay.keenetic.pro/api/v1/relay/"),
        data: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      if (response.statusCode == 200) {
        showSuccessOpenDoor(context);
        final access_token = response.data!['access'];
        SessionManager().updatetoken(access_token);
      } else {}
    } catch (e) {}
  }

  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF11171e),
      borderRadius: BorderRadius.circular(30),
    ),
    height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 0),
            transitionBuilder: ((child, animation) => SizeTransition(
                  child: child,
                  sizeFactor: animation,
                )),
            child: VlcPlayer(
              key: ValueKey(index),
              placeholder: const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
              controller: createControllerFromUrl(
                  _controllerCamsList.cams[index].url ?? ""),
              aspectRatio: 16 / 9,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    OpenDoor();
                  },
                )),
          ],
        ),
      ],
    ),
  );
}

class AllCamsList extends StatefulWidget {
  final ValueSetter<int> cameraIndexChanged;
  const AllCamsList({super.key, required this.cameraIndexChanged});

  @override
  State<AllCamsList> createState() => _AllCamsListState();
}

class _AllCamsListState extends State<AllCamsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _controllerCamsList.cams.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() => widget.cameraIndexChanged.call(index));
                },
                child: simpleText(
                    'ул. ${_controllerCamsList.cams[index].house} ' +
                        'подъезд: ${_controllerCamsList.cams[index].entry_number}',
                    Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Advertising container

Widget advertising(BuildContext context, int index) {
  return SizedBox(
    height: 100,
    child: Image.network(
      '${_controllerAdvert.advertising[index].url}',
      fit: BoxFit.cover,
    ),
  );
}

// body of CamPage

class bodyCamsPage extends StatefulWidget {
  const bodyCamsPage({super.key});

  @override
  State<bodyCamsPage> createState() => _bodyCamsPageState();
}

class _bodyCamsPageState extends State<bodyCamsPage> {
  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0e1217),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF0e1217),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                advertising(context, 0),
                SizedBox(
                  height: 5,
                ),
                OneCamContainer(context, activeIndex),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1.2,
                ),
                SizedBox(
                    child: AllCamsList(
                  cameraIndexChanged: (int index) =>
                      setState(() => activeIndex = index),
                )),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Loading body

Widget loadingBodyContainer(BuildContext context) => Obx((() => Column(
      children: <Widget>[
        Expanded(
            child: _controllerCamsList.isLoadingGetAllCams.value ||
                    _controllerAdvert.isLoadingGetAdvertising.value
                ? const Center(
                    // ignore: unnecessary_const
                    child: const CircularProgressIndicator(
                    color: Color(0xFF04764E),
                  ))
                : errorConnection())
      ],
    )));

//Error Connection

@override
Widget errorConnection() {
  return RefreshIndicator(
      onRefresh: _controllerCamsList.onRefresh,
      child: Container(
          color: Colors.white,
          child: (_controllerCamsList.hasError.isTrue ||
                  _controllerAdvert.hasError.isTrue)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Потеряна связь с интернетом',
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 5,
                      ),
                      OutlinedButton(
                          onPressed: (_controllerCamsList.onRefresh),
                          child: Text(
                            "Обновить",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.blue)),
                          ))
                    ],
                  ),
                )
              : bodyCamsPage()));
}
