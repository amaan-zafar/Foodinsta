import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as diop;
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
        if (response.statusCode == 401) {
          print('doing');
          String firebaseId = await _secureStorage.read(key: 'firebase');
          var response = await _client.post(
            Uri.https(_baseURL, 'users/login/'),
            body: jsonEncode({"firebase_id": firebaseId}),
            headers: {"Content-Type": "application/json; charset=UTF-8"},
          );
          var decodedRes = json.decode(response.body);
          int status = decodedRes['status'];
          print(status);
          if (status == 1) {
            await _secureStorage.write(
                key: 'access', value: decodedRes['access']);
            await _secureStorage.write(
                key: 'refresh', value: decodedRes['refresh']);
          }
        }
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
        var jwt = await _secureStorage.read(key: 'access');
        var response = await _client.post(
          Uri.https(_baseURL, path),
          headers: {
            'Authorization': 'Bearer $jwt',
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(body),
        );
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
      {diop.FormData formData, bool requireAuth = false}) async {
    try {
      if (requireAuth) {
        var jwt = await _secureStorage.read(key: 'access');
        var dio = diop.Dio();
        diop.Response response =
            await dio.post('https://foodinsta.herokuapp.com/products/new/',
                data: formData,
                options: diop.Options(
                  headers: {
                    // 'accept': '*/*',
                    'Authorization': 'Bearer $jwt',
                    "Content-Type": "multipart/form-data"
                  },
                ));
        print(response.data);
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

  // Future<void> unhandledPostRequest(String path, Map body,
  //     {@required bool requireAuth}) async {
  //   try {
  //     if (requireAuth) {
  //       var jwt = await _secureStorage.read(key: 'access');
  //       var response = await _client.post(
  //         Uri.https(_baseURL, path),
  //         headers: {'Authorization': jwt},
  //         body: body,
  //       );
  //     } else {
  //       await _client.post(Uri.https(_baseURL, path), body: body);
  //     }
  //   } catch (e) {}
  // }
}

// Mehul Jain5:34 PM
// formData = new FormData.fromMap({
//           "course_id": valueOfDropDown ?? note.courseuuid,
//           "title": title,
//           "text": info,
//           "remindertime": dateAndTime ?? note.reminderTime,
//           "notify": notif,
//           "attachment_1": list[0],
//         });
// MultipartFile multipat =
//               await MultipartFile.fromFile(filePath, filename: fileName);
// Mehul Jain5:35 PM
// Response response = await dio.post(
//           "https://studydeck.bits-sutechteam.org/back/user/note/update/$staticId/",
//           data: formData);
