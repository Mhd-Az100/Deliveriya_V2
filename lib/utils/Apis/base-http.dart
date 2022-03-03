import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dilivirya/model/deletePutPost_model.dart';
import 'package:http/http.dart' as http;
import '../Error/app_exceptions.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 20;
  //GET
  Future<dynamic> get({String? baseUrl, String? api, String? token}) async {
    var uri = Uri.parse(baseUrl! + api!);
    try {
      var response;
      token == ''
          ? response = await http
              .get(uri)
              .timeout(const Duration(seconds: TIME_OUT_DURATION))
          : response = await http.get(uri, headers: {
              'Authorization': 'Bearer $token'
            }).timeout(Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(
      {String? baseUrl, String? api, dynamic body, String? token}) async {
    var uri = Uri.parse(baseUrl! + api!);

    try {
      var response;
      token == ''
          ? body != ''
              ? response = await http
                  .post(uri, body: body)
                  .timeout(const Duration(seconds: TIME_OUT_DURATION))
              : response = await http
                  .post(
                    uri,
                  )
                  .timeout(const Duration(seconds: TIME_OUT_DURATION))
          : body != ''
              ? response = await http.post(uri, body: body, headers: {
                  'Authorization': 'Bearer $token'
                }).timeout(const Duration(seconds: TIME_OUT_DURATION))
              : response = await http.post(uri, headers: {
                  'Authorization': 'Bearer $token'
                }).timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE
  Future<dynamic> delete({String? baseUrl, String? api, String? token}) async {
    var uri = Uri.parse(baseUrl! + api!);

    try {
      var response;
      token == ''
          ? response = await http
              .delete(uri)
              .timeout(const Duration(seconds: TIME_OUT_DURATION))
          : response = await http.delete(uri, headers: {
              'Authorization': 'Bearer $token'
            }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //Put
  Future<dynamic> put(
      {String? baseUrl, String? api, dynamic body, String? token}) async {
    var uri = Uri.parse(baseUrl! + api!);
    var payload = json.encode(body);
    try {
      var response;
      token == ''
          ? response = await http
              .put(uri, body: payload)
              .timeout(const Duration(seconds: TIME_OUT_DURATION))
          : response = await http.put(uri, body: payload, headers: {
              'Authorization': 'Bearer $token'
            }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        var responseJson = jsonDecode(response.body);
        var error = Errors.fromJson(responseJson['errors'][0]);
        throw BadRequestException(error.msg, response.request!.url.toString());
      case 401:
        return false;
      case 403:
        var responseJson = jsonDecode(response.body);
        var error = Errors.fromJson(responseJson['errors'][0]);
        throw AuthorizationException(
            error.msg, response.request!.url.toString());
      case 422:
        var responseJson = jsonDecode(response.body);
        var error = Errors.fromJson(responseJson['errors'][0]);
        throw BadRequestException(error.msg, response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
