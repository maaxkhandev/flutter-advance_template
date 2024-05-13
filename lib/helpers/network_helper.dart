// ignore_for_file: constant_identifier_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../config/constants.dart';

enum RequestMethod { GET, POST, PATCH, DELETE, PUT }

var dio = Dio();

class NetworkHelper {
  static Future<dynamic> apiRequest(
    String url, {
    required RequestMethod method,
    Map<String, dynamic>? body,
  }) async {
    try {
      late Response response;
      dio.options.baseUrl = Constants.apiBaseUrl;

      switch (method) {
        case RequestMethod.GET:
          response = await dio.get(url);
          break;
        case RequestMethod.POST:
          response = await dio.post(url, data: body);
          break;
        case RequestMethod.PATCH:
          response = await dio.patch(url, data: body);
          break;
        case RequestMethod.PUT:
          response = await dio.put(url, data: body);
          break;
        case RequestMethod.DELETE:
          response = await dio.delete(url);
          break;
      }

      debugPrint('Network helper response  ${response.data['data']}');

      // Return Response Data
      return response.data['data'];
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response?.data.toString());
        throw (e.response?.data['data']);
      } else {
        debugPrint(e.message);
        throw (e.message ?? '');
      }
    }
  }

  static Future<dynamic> apiRequestFieldsAndFiles(
    String url, {
    required RequestMethod method,
    String? fileKey,
    List<File>? files,
    required Map<String, dynamic> body,
  }) async {
    try {
      // Create FormData
      var formData = FormData();
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value));
      });
      if (files != null) {
        for (var file in files) {
          formData.files
              .add(MapEntry(fileKey!, await MultipartFile.fromFile(file.path)));
        }
      }

      // Send Request
      dio.options.baseUrl = Constants.apiBaseUrl;
      // final fullUrl = '${Constants.apiBaseUrl}$url';
      var response = await dio.post(url, data: formData);
      // debugPrint(response.data['data'].toString());

      // Return Response Data
      return response.data['data'];
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response?.data.toString());
        throw (e.response?.data);
      } else {
        debugPrint(e.message);
        throw (e.message ?? '');
      }
    }
  }

// after login set authorization token for overall requests or when me route hit or when when app open
  static addAuthorizationHeader(String token) {
    dio.options.headers.addAll({
      'Authorization': token,
    });
  }

// after logut remove authorization token
  static removeAuthorizationHeader() {
    dio.options.headers.removeWhere((key, value) => key == 'Authorization');
  }
}

// usage

// getData() {
//   NetworkHelper.apiRequest(
//     'your url ',
//     method: RequestMethod.POST,
//     body: {},
//   );
// }
