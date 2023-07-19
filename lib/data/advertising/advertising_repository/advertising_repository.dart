import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../advertising_data_view_model.dart';

class AdvertisingRepository {
  final Dio _dio;

  static const String _url = 'http://api.relay.keenetic.pro/api/v1/media/';

  AdvertisingRepository(this._dio);
  Future<Either<String, List<AdvertisingDataViewModel>>>
      getAdvertising() async {
    try {
      final response = await _dio.get(_url);
      print('ad_is_work');
      final adData = (response.data as List)
          .map((final element) => AdvertisingDataViewModel.fromJson(element))
          .toList();
      return Right(adData);
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }
}
