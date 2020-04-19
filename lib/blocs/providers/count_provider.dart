import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../models/count.dart';

class CountProvider with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  Count _count;

  Count get count{
    return _count;
  }

  Future<void> fetchCount()async{
    String url = 'http://192.168.153.1/hospital-api/public/api/data-count';
    final response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _count = Count.fromJson(extractedData['data']);
    notifyListeners();
  }
}