import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Failure.dart';

class CustomHttpClient {
  final String _baseURL;
  final Client _client;
  final FlutterSecureStorage _secureStorage;
  CustomHttpClient(this._baseURL, this._client, this._secureStorage);

  Future<dynamic> getRequest(String path, {@required bool requireAuth}) async {
    try {
      if (requireAuth) {
        var response = await _client.get(Uri.https(_baseURL, path),
            headers: {'Authorization': await _secureStorage.read(key: 'JWT')});
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return jsonDecode(response.body);
      } else {
        var response = await _client.get(Uri.https(_baseURL, path));
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return jsonDecode(response.body);
      }
    } on SocketException {
      throw Failure('Internet connection error');
    } on HttpException {
      throw Failure('Couldn\'t fetch data');
    } on FormatException {
      throw Failure('Response format error');
    } on ClientException {
      throw Failure('Connection Interrupted');
    }
  }

  Future<dynamic> getRequestWithParams(String path, var queryParameters,
      {@required bool requireAuth}) async {
    try {
      if (requireAuth) {
        var uri = Uri.https(_baseURL, path, queryParameters);
        var response = await _client.get(uri,
            headers: {'Authorization': await _secureStorage.read(key: 'JWT')});
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return jsonDecode(response.body);
      } else {
        var response = await _client.get(Uri.https(_baseURL, path));
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return jsonDecode(response.body);
      }
    } on SocketException {
      throw Failure('Internet connection error');
    } on HttpException {
      throw Failure('Couldn\'t fetch data');
    } on FormatException {
      throw Failure('Response format error');
    } on ClientException {
      throw Failure('Connection Interrupted');
    }
  }

  Future<dynamic> postRequest(String path, Map body,
      {bool requireAuth = false}) async {
    try {
      if (requireAuth) {
        var jwt = await _secureStorage.read(key: 'JWT');
        var response = await _client.post(
          Uri.https(_baseURL, path),
          headers: {
            'Authorization': jwt,
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: body,
        );
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return json.decode(response.body);
      } else {
        var response = await _client.post(
          Uri.https(_baseURL, path),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json; charset=UTF-8"},
        );
        print('Respose body at customhttp is ${response.body}');
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return json.decode(response.body);
      }
    } on SocketException {
      throw Failure('Internet connection error');
    } on HttpException {
      throw Failure('Couldn\'t fetch data');
    } on FormatException {
      throw Failure('Response format error');
    } on ClientException {
      throw Failure('Connection Interrupted');
    }
  }

  Future<void> unhandledPostRequest(String path, Map body,
      {@required bool requireAuth}) async {
    try {
      if (requireAuth) {
        var jwt = await _secureStorage.read(key: 'JWT');
        var response = await _client.post(
          Uri.https(_baseURL, path),
          headers: {'Authorization': jwt},
          body: body,
        );
        print(response);
      } else {
        await _client.post(Uri.https(_baseURL, path), body: body);
      }
    } catch (e) {}
  }
}
