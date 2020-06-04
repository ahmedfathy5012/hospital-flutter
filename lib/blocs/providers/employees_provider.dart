import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/employees.dart';

import '../../helpers/api_helper.dart';

class EmployeesProvider extends ApiHelper with ChangeNotifier{
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

  Future<bool> fetchAndSetEmployees() async {

    if(_searchText.isNotEmpty){
      _employees.clear();
      searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _employees.add(item);
        }
      });
      notifyListeners();

    }else{
      http.Response response = await http.get(FETCH_EMPLOYEES_URL,headers:await getHeaders());
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
      print(_employees[3].fullName);
      notifyListeners();
      if(response.statusCode==200)
        return true;
      return false;
    }


  }
}