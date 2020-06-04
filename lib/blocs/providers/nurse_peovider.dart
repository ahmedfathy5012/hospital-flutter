import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/nurse.dart';

import 'package:http/http.dart' as http;

import '../../helpers/api_helper.dart';

class NurseProvider extends ApiHelper with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Nurse _nurse ;


  Nurse get nurse {
    return _nurse;
  }

  Future<bool> fetchAndSetNurse(int id) async {
    final response = await http.get(FETCH_NURSE_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _nurse = Nurse.fromJson(extractedData['data']);
    print(_nurse.first_name);
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
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

    final response = await http.post(UPDATE_NURSE_URL(id),headers:await getHeaders(),
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _nurse = Nurse.fromJson(extractedData['data']);
    print(_nurse.blood.blood_id);
    notifyListeners();
  }


  Future<http.Response> addNurse(int id , Nurse nurse , String identification_number) async {

    Map<String,dynamic> body = {
    'Identification_number' : nurse.identification_number.toString(),
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

    final response = await http.post(ADD_NURSE_URL,headers:await getHeaders(),
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
