import 'dart:convert';

import 'package:http/http.dart' as http;

final String apiUrl = "https://randomuser.me/api/?results=10";

List<dynamic> _users = [];

Future<dynamic> fetchUsers() async {
  var result = await http
      .get(Uri.parse(apiUrl), headers: {"Accept": "application/json"});

  _users = jsonDecode(result.body)['results'];
  return _users;
}
