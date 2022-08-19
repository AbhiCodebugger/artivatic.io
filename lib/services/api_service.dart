import 'dart:convert';
import 'package:artivatic_assignment/model/mymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<MyModel> fetchData({String? query}) async {
    try {
      Uri url = Uri.parse(
          'https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf');
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        MyModel modelData = MyModel.fromJson(json.decode(response.body));
        // if (query != null) {
        //   modelData.rows!
        //       .where((element) => element.title!.toLowerCase().contains(query))
        //       .toList();
        // }
        debugPrint('modelData.rows');
        return modelData;
      } else {
        return MyModel();
      }
    } catch (e) {
      debugPrint('Catch :${e.toString()}');
      throw Exception(e);
    }
  }
}
