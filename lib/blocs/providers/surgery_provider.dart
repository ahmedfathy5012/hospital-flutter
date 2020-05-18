import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Surgery.dart';
import '../models/thing_extension.dart';


class SurgeryProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Surgery _surgery ;
  Surgery get surgery{
    return _surgery;
  }
  Future<void> fetchAndSetSurgery(int id) async {
    String url = 'http://192.168.153.1/hospital-api/public/api/operation/$id';
    final response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _surgery = Surgery.fromJson(extractedData['data']);
    print(_surgery.id);
    notifyListeners();
  }


  Future<Surgery> updateSurgery(int id , Surgery surgery) async {
    Map<String,dynamic> body = {
      'anesthesiologist_id' : surgery.anesthesiologist_id.toString(),
      'surgeon_id': surgery.surgeon_id.toString(),
      'patient_id' : surgery.patient_id.toString(),
      'anesthetic_id' : surgery.anesthetic_id.toString(),
      'name_of_surgery' : surgery.name_of_surgery,
      'date_of_surgery' : surgery.date_of_surgery,
    };

    String url = 'http://192.168.153.1/hospital-api/public/api/update-operation/$id';
    final response = await http.post(url,headers:headers,
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _surgery = Surgery.fromJson(extractedData['data']);
    notifyListeners();
  }


  Future<http.Response> addSurgery(int id , Surgery surgery) async {

    Map<String,dynamic> body = {
      'anesthesiologist_id' : surgery.anesthesiologist_id.toString(),
      'surgeon_id': surgery.surgeon_id.toString(),
      'patient_id' : surgery.patient_id.toString(),
      'anesthetic_id' : surgery.anesthetic_id.toString(),
      'name_of_surgery' : surgery.name_of_surgery,
      'date_of_surgery' : surgery.date_of_surgery,
    };


    String url = 'http://192.168.153.1/hospital-api/public/api/add-operation';
    final response = await http.post(url,headers:headers,
    body:  body
    );
    //if(json.decode(response.body).message.contains('users_identification_number_unique'))
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('${response.statusCode}');
    notifyListeners();
    return response;
  }





  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<ThingsExtension> searchList = [];


  List<ThingsExtension> _surgeries = [];

  List<ThingsExtension> get surgeries{
    return [..._surgeries];
  }

  Future<void> fetchAndSetSurgeries() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/operations';

    if(_searchText.isNotEmpty){
      _surgeries.clear();
      searchList.forEach((item){
        if(item.patient_full_name.contains(_searchText)) {
          _surgeries.add(item);
        }
      });
    }else{
      http.Response response = await http.get(url,headers:headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ThingsExtension> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            ThingsExtension.fromJson(item)
        );
      }

      _surgeries=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
    }

    notifyListeners();
  }

}