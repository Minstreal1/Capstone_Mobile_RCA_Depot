import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../app/base/base_api_service.dart';
import '../../app/base/base_common.dart';
import '../../app/base/base_link.dart';

class AuthService extends ApiService {
  Future<void> register() async {
    final response = await http.post(Uri.parse(BaseLink.register),
        body: jsonEncode({
          "username": "abc113",
          "password": "string",
          "email": "abc@gmail.com",
          "firstName": "Nguyen",
          "lastName": "string",
          "phoneNumber": "07942188220",
          "residentCode": "string"
        }),
        headers: BaseCommon.instance.headerRequest(isAuth: false));
    log('StatusCode ${response.statusCode} - ${BaseLink.register}');
    log('Body ${response.body}');
    if (response.statusCode == 200) {
      log(jsonEncode(response.body));
    }
    throw Exception(json.decode(response.body)['message']);
  }

  Future<String> login(
      {required String username, required String password}) async {
    return fetchDataObjectWithPost(BaseLink.login, (p0) => p0['token'],
        body: {"username": username, "password": password}, isAuth: false);
  }
}
