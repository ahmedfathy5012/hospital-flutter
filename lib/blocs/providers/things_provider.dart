import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/thing_extension.dart';


class DoctorsProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };



  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<ThingsExtension> searchList = [];


  List<ThingsExtension> _diagnoses = [];

  List<ThingsExtension> get doctors{
    return [..._diagnoses];
  }

  Future<void> fetchAndSetDiagnoses() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';

    if(_searchText.isNotEmpty){
      _diagnoses.clear();
      searchList.forEach((item){
        if(item.patient_full_name.contains(_searchText)) {
          _diagnoses.add(item);
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

      _diagnoses=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
    }

    notifyListeners();
  }
}