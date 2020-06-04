import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../models/count.dart';

import 'package:devida/helpers/api_helper.dart';

class CountProvider extends ApiHelper with ChangeNotifier {


  Count _count;

  Count get count => _count;


  Future<bool> fetchCount()async{
    final response = await http.get(FETCH_COUNT_URL,headers:await getHeaders());
    var extractedData;
    try{
      extractedData = json.decode(response.body) as Map<String, dynamic>;
    } catch(e){
      return false;
    }
    _count = Count.fromJson(extractedData['data']);
    print(extractedData);
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }
}