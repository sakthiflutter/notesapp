import 'dart:convert';

import 'package:get/get_connect/connect.dart';

import '../models/addnote.dart';



class ApiProvider extends GetConnect {

  Future<Addnote> addnotes(String title,String description) async {
    var body={
      "title":title,
      "description":description
    };
    final response = await post(
        'http://159.89.161.169:3001/api/user/notes',jsonEncode(body));
    print(response.body);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return  addnoteFromJson(response.bodyString??'');
    }
  }
}