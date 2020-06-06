import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/anesthetics.dart';

import '../../helpers/api_helper.dart';

class AnestheticsProvider extends ApiHelper with ChangeNotifier{



  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<Anesthetics> searchList = [];

  List<Anesthetics> _anesthetics = [];

  List<Anesthetics> get anesthetics{
    return [..._anesthetics];
  }

  Future<Anesthetics> fetchAndSetAnesthetics() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/anesthetics';
    if(_searchText.isNotEmpty){
      _anesthetics.clear();
      searchList.forEach((item){
        if(item.title.contains(_searchText)) {
          _anesthetics.add(item);
        }
      });
    }else{
      http.Response response = await http.get(FETCH_ANESRHETICS_URL,headers:await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Anesthetics> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            Anesthetics.fromJson(item)
        );
      }
      _anesthetics=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
    }

    print(_anesthetics[3].title);
    notifyListeners();
  }
}