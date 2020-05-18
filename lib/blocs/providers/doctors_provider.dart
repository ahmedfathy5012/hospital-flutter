import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/doctors.dart';
import '../models/specialization.dart';

class DoctorsProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };



  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<Doctors> searchList = [];


  List<Doctors> _doctors = [];

  List<Doctors> get doctors{
    return [..._doctors];
  }

  Future<Doctors> fetchAndSetDoctors() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';

    if(_searchText.isNotEmpty){
        _doctors.clear();
        searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _doctors.add(item);
        }
      });
    }else{
      http.Response response = await http.get(url,headers:headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Doctors> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            Doctors.fromJson(item)
        );
      }

      _doctors=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
    }
    print(_doctors[3].fullName);
    notifyListeners();
  }
}