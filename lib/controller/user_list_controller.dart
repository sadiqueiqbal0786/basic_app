import 'dart:developer';

import 'package:basic_app/model/user_model.dart';
import 'package:dio/dio.dart';

class UserListController {
  static Future<List<User>> getUserList() async {
    Dio dio = Dio();
    final response = await dio.get('https://reqres.in/api/users');
    if (response.statusCode == 200) {
      final responseData = response.data['data'];

      List<User> userList =
          responseData.map<User>((element) => User.fromJson(element)).toList();
      log('$userList');
      return userList;
    }
    return [];
  }
}
