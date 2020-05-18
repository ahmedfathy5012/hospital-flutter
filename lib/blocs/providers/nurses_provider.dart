import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/nurses.dart';

class NursesProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };




  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<Nurses> searchList = [];

  List<Nurses> _nurses = [];

  List<Nurses> get doctors{
    return [..._nurses];
  }

  Future<Nurses> fetchAndSetNurses() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/nurses';

    if(_searchText.isNotEmpty){
      _nurses.clear();
      searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _nurses.add(item);
        }
      });
    }else{
      http.Response response = await http.get(url,headers:headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Nurses> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            Nurses.fromJson(item)
        );
      }
      _nurses=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
    }

    print(_nurses[3].fullName);
    notifyListeners();
  }
}