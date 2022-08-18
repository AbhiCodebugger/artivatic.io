import 'package:artivatic_assignment/model/mymodel.dart';
import 'package:artivatic_assignment/services/api_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  MyModel _list = MyModel();
  MyModel get list => _list;

  bool isLoading = false;

  /// Fetching data with getx and storing inside empty list

  Future<void> fetch() async {
    try {
      isLoading = true;
      var data = await _apiService.fetchData();
      _list = data;
      isLoading = false;
    } catch (e) {
      debugPrint(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}
