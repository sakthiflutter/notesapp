import 'dart:convert';

import 'package:get/get_connect/connect.dart';





class ApiProvider extends GetConnect {

  Future<String> update(String id,String title,String description) async {
    var body={
      "title":title,
      "description":description
    };
    final response = await put(
        'http://159.89.161.169:3001/api/user/notes/${id}',jsonEncode(body));
    print(1234);
    print(response.body);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return  '';
    }
  }
}