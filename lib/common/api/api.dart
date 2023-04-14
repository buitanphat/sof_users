import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';

import 'api_error.dart';

class Api {
  Future<Map<String, String>> getDefaultHeaders() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    Map<String, String> defaultHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json;charset=utf-t',
      'os': Platform.isIOS ? 'ios' : 'android',
      'app_version': version,
      HttpHeaders.authorizationHeader: ''
    };
    return defaultHeaders;
  }

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = await getDefaultHeaders();
      final uri = Uri.parse(url);
      final response = await http.get(uri, headers: headers);
      responseJson = _parseResponse(response);
    } on SocketException {
      throw ApiErrorNetwork('No Internet connection');
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = await getDefaultHeaders();
      final uri = Uri.parse(url);
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      responseJson = _parseResponse(response);
    } on SocketException {
      throw ApiErrorNetwork('No Internet connection');
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = await getDefaultHeaders();
      final uri = Uri.parse(url);
      final response =
          await http.put(uri, headers: headers, body: jsonEncode(body));
      responseJson = _parseResponse(response);
    } on SocketException {
      throw ApiErrorNetwork('No Internet connection');
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = await getDefaultHeaders();
      final uri = Uri.parse(url);
      final response = await http.delete(uri, headers: headers);
      responseJson = _parseResponse(response);
    } on SocketException {
      throw ApiErrorNetwork('No Internet connection');
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  dynamic _parseResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 244:
        dynamic responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw ApiErrorBadRequest(response.body);
      case 401:
      case 403:
        throw ApiErrorUnauthorised(response.body);
      case 444:
      case 500:
      default:
        throw ApiErrorNetwork(
            'Server error StatusCode : ${response.statusCode}');
    }
  }
}
