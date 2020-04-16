import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/doctors.dart';
import '../models/specialization.dart';

class DoctorsProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  List<Doctors> _doctors = [
    Doctors(id: 1,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 2,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 3,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 4,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 5,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 6,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 7,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy',image: 'assets/images/3.png', specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 8,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy',image: 'assets/images/3.png', specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 9,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy',image: 'assets/images/3.png', specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 10,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy',image: 'assets/images/3.png', specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
    Doctors(id: 11,fullName: 'Ahmed Mohamed Fathy', showName: 'Ahmed Fathy', image: 'assets/images/3.png',specialization: Specialization(specialization_id: 1, specialization_name: 'Nervouse Doctor')),
  ];

  List<Doctors> get doctors{
    return [..._doctors];
  }

  Future<Doctors> fetchAndSetDoctors() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Doctors> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Doctors.fromJson(item)
      );
    }
    _doctors=loadedProducts;
    print(_doctors[3].fullName);
    notifyListeners();
  }
}