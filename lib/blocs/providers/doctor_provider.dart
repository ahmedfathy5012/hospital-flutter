import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/doctor.dart';

import 'package:http/http.dart' as http;

import '../../helpers/api_helper.dart';

class DoctorProvider extends ApiHelper with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Doctor _doctor ;


  Doctor get doctor {
    return _doctor;
  }

  Future<bool> fetchAndSetDoctor(int id) async {
    final response = await http.get(FETCH_DOCTOR_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _doctor = Doctor.fromJson(extractedData['data']);
    print('ROLE IS ${_doctor.user.user_role.toString()}');
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }

  Future<Doctor> updateDoctor(int id , Doctor doctor) async {
    Map<String,dynamic> body = {
      'first_name' : doctor.first_name,
        'second_name': doctor.second_name,
      'third_name' : doctor.third_name,
      'specialization_id' : doctor.specialization_id.toString(),
      'nationality_id' : doctor.nationality_id.toString(),
      'job_id' : doctor.job_id.toString(),
      'sex_id' : doctor.gender_id.toString(),
      'blood_id' : doctor.blood_id.toString(),
        'notes' : doctor.notes== null ? ' ' : doctor.notes,
        'image' : doctor.image == null ? ' ' : doctor.image,
         'address' : doctor.address,
         'phone' : doctor.phone,
         'email' : doctor.email,
      'social_status': doctor.social_status,
         'date_of_hiring':doctor.date_of_hiring.toString(),
      'date_of_birth' : doctor.date_of_birth.toString(),
      'user_role_id' : doctor.user_role_id.toString(),

    };
    final response = await http.post(UPDATE_DOCTOR_URL(id),headers:await getHeaders(),
     body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _doctor = Doctor.fromJson(extractedData['data']);
    print(_doctor.blood.blood_id);
    notifyListeners();
  }


  Future<http.Response> addDoctor(int id , Doctor doctor) async {

    Map<String,dynamic> body = {
      'Identification_number' : doctor.identification_number.toString(),
      'first_name' : doctor.first_name.toString(),
      'second_name': doctor.second_name.toString(),
      'third_name' : doctor.third_name.toString(),
      'specialization_id' : doctor.specialization_id.toString(),
      'nationality_id' : doctor.nationality_id.toString(),
      'job_id' : doctor.job_id.toString(),
      'sex_id' : doctor.gender_id.toString(),
      'blood_id' : doctor.blood_id.toString(),
      'notes' : doctor.notes== null ? ' ' : doctor.notes,
      'image' : doctor.image == null ? ' ' : doctor.image,
      'address' : doctor.address.toString(),
      'phone' : doctor.phone.toString(),
      'email' : doctor.email.toString(),
      'social_status': doctor.social_status.toString(),
      'date_of_hiring': DateTime.now().toString(),
      'date_of_birth' : doctor.date_of_birth.toString(),
      'user_role_id' : doctor.user_role_id.toString()
    };



    final response = await http.post(ADD_DOCTOR_URL,headers:await getHeaders(),
        body:  body
    );
    //if(json.decode(response.body).message.contains('users_identification_number_unique'))
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('${extractedData}');

    //final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //_doctor = Doctor.fromJson(extractedData['data']);
    //print(_doctor.first_name);
    notifyListeners();
    return response;
  }
}
