import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

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
        var jwt = await _secureStorage.read(key: 'access');
        var response = await _client.get(Uri.https(_baseURL, path),
            headers: {'Authorization': 'Bearer $jwt'});
        print(
            'Respose body at customhttp getRequest is ${response.body} and res code is ${response.statusCode}');
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');

        return jsonDecode(response.body);
      } else {
        var response = await _client.get(Uri.https(_baseURL, path));
        print(
            'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
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
        var jwt = await _secureStorage.read(key: 'access');

        var uri = Uri.https(_baseURL, path, queryParameters);
        var response = await _client.get(uri, headers: {
          'Authorization': 'Bearer $jwt',
          "Content-Type": "application/json; charset=UTF-8"
        });
        print(
            'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
        if (response.statusCode != 200)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return jsonDecode(response.body);
      } else {
        var response = await _client.get(Uri.https(_baseURL, path));
        print(
            'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
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
        var jwt = await _secureStorage.read(key: 'access');
        var response = await _client.post(
          Uri.https(_baseURL, path),
          headers: {
            'Authorization': 'Bearer $jwt',
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(body),
        );
        print(
            'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
        if (response.statusCode != 200 && response.statusCode != 201)
          throw Failure(
              '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
        return json.decode(response.body);
      } else {
        var response = await _client.post(
          Uri.https(_baseURL, path),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json; charset=UTF-8"},
        );
        print(
            'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
        if (response.statusCode != 200 && response.statusCode != 201)
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

  Future<void> postMultipartRequest(
      {File file,
      String filename,
      String path,
      Map<String, dynamic> body,
      bool requireAuth = false}) async {
    print('map is $body');
    try {
      if (requireAuth) {
        var jwt = await _secureStorage.read(key: 'access');
        var request = MultipartRequest('POST', Uri.https(_baseURL, path));
        Map<String, String> headers = {
          "Authorization": "Bearer $jwt",
          "Content-type": "multipart/form-data"
        };
        request.files.add(
          MultipartFile(
            'file',
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: filename,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
        request.headers.addAll(headers);
        request.fields.addAll(body);
        print("request: " + request.toString());
        var response = await request.send();
        print("This is response:" + response.toString());
        // return response.statusCode;
        // var response = await _client.post(
        //   Uri.https(_baseURL, path),
        //   headers: {
        //     'Authorization': 'Bearer $jwt',
        //     "Content-Type": "application/json; charset=UTF-8"
        //   },
        //   body: jsonEncode(body),
        // );
        // print('Res code at multipart getreq is ${response.statusCode}');
        // if (response.statusCode != 200 && response.statusCode != 201)
        //   throw Failure('${response.reasonPhrase}');
        // return response;
      }
      // else {
      //   var response = await _client.post(
      //     Uri.https(_baseURL, path),
      //     body: jsonEncode(body),
      //     headers: {"Content-Type": "application/json; charset=UTF-8"},
      //   );
      //   print(
      //       'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
      //   if (response.statusCode != 200 && response.statusCode != 201)
      //     throw Failure(
      //         '${response.reasonPhrase}: ${json.decode(response.body)['err']}');
      //   return json.decode(response.body);
      // }
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
        var jwt = await _secureStorage.read(key: 'access');
        var response = await _client.post(
          Uri.https(_baseURL, path),
          headers: {'Authorization': jwt},
          body: body,
        );
        print(
            'Respose body at customhttp is ${response.body} and res code is ${response.statusCode}');
      } else {
        await _client.post(Uri.https(_baseURL, path), body: body);
      }
    } catch (e) {}
  }
}
