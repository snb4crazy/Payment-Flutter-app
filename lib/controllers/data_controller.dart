import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_from_scratch/services/data_services.dart';

class DataController extends GetxController {
  //.obs - observable in Getx
  var list = [].obs;
  final service = DataServices();
  var _loading = false.obs;

  get loading {
    return _loading;
  }

  get newList {
    //if status = true, return object
    return list.where((e) => e['status']).map((e) => e).toList();
  }

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    try {
      _loading.value = false;
      var info = service.getUsers();
      list.addAll(await info);
    } catch (e) {
      print('Excpeption _loadData');
      print(e);
    } finally {
      _loading.value = true;
    }
  }
}
