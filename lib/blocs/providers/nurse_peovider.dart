import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/nurse.dart';

import 'package:http/http.dart' as http;

class NurseProvider with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Nurse _nurse ;


  Nurse get nurse {
    return _nurse;
  }

  Future<Nurse> fetchAndSetNurse(int id) async {
    String url = 'http://192.168.153.1/hospital-api/public/api/nurse/$id';
    final response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _nurse = Nurse.fromJson(extractedData['data']);
    print(_nurse.first_name);
    notifyListeners();
  }

  Future<Nurse> updateNurse(int id , Nurse nurse) async {
    Map<String,dynamic> body = {
      'first_name' : nurse.first_name,
      'second_name': nurse.second_name,
      'third_name' : nurse.third_name,
      'nationality_id' : nurse.nationality_id.toString(),
      'job_id' : nurse.job_id.toString(),
      'sex_id' : nurse.gender_id.toString(),
      'blood_id' : nurse.blood_id.toString(),
      'notes' : nurse.notes,
      'image' : nurse.image,
      'address' : nurse.address,
      'phone' : nurse.phone,
      'email' : nurse.email,
      'social_status': nurse.social_status,
      'date_of_hiring':nurse.date_of_hiring.toString(),
      'date_of_birth' : nurse.date_of_birth.toString(),
    };

    String url = 'http://192.168.153.1/hospital-api/public/api/update-nurse/$id';
    final response = await http.post(url,headers:headers,
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _nurse = Nurse.fromJson(extractedData['data']);
    print(_nurse.blood.blood_id);
    notifyListeners();
  }


  Future<http.Response> addNurse(int id , Nurse nurse , String identification_number) async {

    Map<String,dynamic> body = {
    'Identification_number' : identification_number.toString(),
    'first_name' : nurse.first_name.toString(),
    'second_name': nurse.second_name.toString(),
    'third_name' : nurse.third_name.toString(),
    'nationality_id' : nurse.nationality_id.toString(),
    'job_id' : nurse.job_id.toString(),
    'sex_id' : nurse.gender_id.toString(),
    'blood_id' : nurse.blood_id.toString(),
    if(nurse.notes != null)
      'notes' : nurse.notes.toString(),
    if(nurse.image != null)
    'image' : nurse.image.toString(),
    'address' : nurse.address.toString(),
    'phone' : nurse.phone.toString(),
    'email' : nurse.email.toString(),
    'social_status': nurse.social_status.toString(),
    'date_of_hiring': DateTime.now().toString(),
    'date_of_birth' : nurse.date_of_birth.toString(),
    };


    String url = 'http://192.168.153.1/hospital-api/public/api/add-nurse';
    final response = await http.post(url,headers:headers,
    body:  body
    );
    //if(json.decode(response.body).message.contains('users_identification_number_unique'))
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('${response.statusCode}');

    //final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //_doctor = Doctor.fromJson(extractedData['data']);
    //print(_doctor.first_name);
    notifyListeners();
    return response;
  }




}
