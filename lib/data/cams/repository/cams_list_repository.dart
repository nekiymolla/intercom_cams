import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../cams_list_data_view_model.dart';

class CamsListRepository {
  final Dio _dio;

  static const String _url = 'http://api.relay.keenetic.pro/api/v1/cameras/';

  CamsListRepository(this._dio);
  Future<Either<String, List<CamsListDataViewModel>>> getAllCams() async {
    try {
      final response = await _dio.get(_url);
      print('cams_list_repository is work');
      final camsListData = (response.data as List)
          .map((final element) => CamsListDataViewModel.fromJson(element))
          .toList();
      return Right(camsListData);
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }
}
