import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/patients.dart';

import '../../helpers/api_helper.dart';

class PatientsProvider extends ApiHelper with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<Patients> searchList = [];


  List<Patients> _patients = [];

  List<Patients> get patients{
    return [..._patients];
  }

  Future<bool> fetchAndSetPatients() async {
    if(_searchText.isNotEmpty){
      _patients.clear();
      searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _patients.add(item);
        }
      });
      notifyListeners();
    }else{
      http.Response response = await http.get(FETCH_PATIENTS_URL,headers:await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Patients> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            Patients.fromJson(item)
        );
      }
      _patients=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
      print(_patients[3].fullName);
      notifyListeners();
      if(response.statusCode==200)
        return true;
      return false;
    }


  }
}