import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/patients.dart';


class PatientsProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  List<Patients> _patients = [];

  List<Patients> get patients{
    return [..._patients];
  }

  Future<Patients> fetchAndSetPatients() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/patients';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Patients> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Patients.fromJson(item)
      );
    }
    _patients=loadedProducts;
    print(_patients[3].fullName);
    notifyListeners();
  }
}