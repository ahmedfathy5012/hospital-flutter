import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/doctors.dart';
import '../models/specialization.dart';

import 'package:devida/helpers/pref_services.dart';
import 'package:devida/helpers/api_helper.dart';

class DoctorsProvider extends ApiHelper with ChangeNotifier {

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

  Future<bool> fetchAndSetDoctors() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    //Map<String,String> headers = await getHeaders();
    if(_searchText.isNotEmpty){
        _doctors.clear();
        searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _doctors.add(item);
          notifyListeners();
        }
      });
    }else{
      final response = await http.get(FETCH_DOCTORS_URL,headers: await getHeaders());
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
      print(_doctors[3].fullName);
      notifyListeners();
      if(response.statusCode==200)
        return true;
      return false;
    }


  }

}