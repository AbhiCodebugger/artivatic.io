import 'package:artivatic_assignment/model/mymodel.dart';
import 'package:artivatic_assignment/services/api_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  MyModel _list = MyModel();
  MyModel get list => _list;
  List<Rows> listRows = [];
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;

  /// Fetching data with getx and storing inside empty list

  Future<void> fetch() async {
    try {
      isLoading = true;
      var data = await _apiService.fetchData();
      _list = data;
      listRows = _list.rows!;
      print('listRows $_list');
      isLoading = false;
    } catch (e) {
      debugPrint(e.toString());
    }
    update();
  }

  void searchData(String query) async {
    print(query);
    _list.rows = listRows.where((e) {
      if (e.title == null) {
        return e.title == 'Not Found';
      } else {
        return e.title!.toLowerCase().contains(query);
      }
    }).toList();
    update();
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}
