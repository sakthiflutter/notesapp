import 'dart:convert';

import 'package:get/get_connect/connect.dart';

import '../models/listofnote.dart';

class ApiProvider extends GetConnect {

  Future<Listofnote> fetchnotes() async {
    final response = await get(
        'http://159.89.161.169:3001/api/user/notes');
    print(response.body);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return  listofnoteFromJson(response.bodyString??'');
    }
  }
  Future<String> deletenotes(String id) async {
    final response = await delete(
        'http://159.89.161.169:3001/api/user/notes/${id}');
    print(response.body);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return jsonDecode(response.body)['message'];

    }
  }
}