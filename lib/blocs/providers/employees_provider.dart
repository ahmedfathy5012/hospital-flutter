import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/employees.dart';

class EmployeesProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<Employees> searchList = [];

  List<Employees> _employees = [];

  List<Employees> get doctors{
    return [..._employees];
  }

  Future<Employees> fetchAndSetEmployees() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/employees';
    if(_searchText.isNotEmpty){
      _employees.clear();
      searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _employees.add(item);
        }
      });
    }else{
      http.Response response = await http.get(url,headers:headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Employees> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            Employees.fromJson(item)
        );
      }
      _employees=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
    }

    print(_employees[3].fullName);
    notifyListeners();
  }
}