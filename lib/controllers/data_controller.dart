import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app_from_scratch/services/data_services.dart';

class DataController extends GetxController {
  //.obs - observable in Getx
  var list = [].obs;
  final service = DataServices();
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    var info = service.getUsers();
    list.addAll(await info);
  }
}
