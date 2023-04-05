import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kanggo_flutter_developer_dandy/data/model/list_user_response_model.dart';

abstract class RemoteDataSource {
  Future listUsers(int index);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final baseUrl = "https://reqres.in/api/";
  Dio dio = Dio();

  @override
  Future listUsers(int index) async {
    try {
      final url = "${baseUrl}users?page=$index";
      final result = await dio.get(url);

      if (result.statusCode == 200) {
        return ListUserResponseModel.fromJson(result.data);
      } else {
        return "Error";
      }
    } catch (e) {
      debugPrint("Catch Error Data $e");
      return e;
    }
  }
}
