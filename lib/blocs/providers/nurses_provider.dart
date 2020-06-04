import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/nurses.dart';

import '../../helpers/api_helper.dart';

class NursesProvider extends ApiHelper with ChangeNotifier{


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

  Future<bool> fetchAndSetNurses() async {
    if(_searchText.isNotEmpty){
      _nurses.clear();
      searchList.forEach((item){
        if(item.fullName.contains(_searchText)) {
          _nurses.add(item);
        }
      });
      notifyListeners();

    }else{
      http.Response response = await http.get(FETCH_NURSES_URL,headers:await getHeaders());
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
      print(_nurses[3].fullName);
      notifyListeners();
      if(response.statusCode==200)
        return true;
      return false;
    }


  }
}