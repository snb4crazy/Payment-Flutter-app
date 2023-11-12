import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:payment_app_from_scratch/models/data_model.dart';

class DataServices {
  final String _baseUrl = 'http://host/api/';

  Future<List<DataModel>> getUsers() async {
    var apiUrl = '/getRoute';
    http.Response response = await http.get(Uri.parse(_baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        //success
        print(await json.decode(response.body));
        List<dynamic> list = await json.decode(response.body);
        //worked before creating a Model
        //return list.map((e) => e).toList();
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        //failed
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
    //below mapping for local json, before integration of the API
    var info = rootBundle.loadString('json/data.json');
    var list = json.decode(await info);
    return Future.delayed(
        const Duration(seconds: 2), () => list.map((e) => e).toList());
  }
}
