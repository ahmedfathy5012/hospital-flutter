import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/patient.dart';
import '../models/patient_case.dart';

import 'package:http/http.dart' as http;

import '../../helpers/api_helper.dart';

class PatientProvider extends ApiHelper with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Patient _patient ;


  Patient get patient {
    return _patient;
  }



  PatientCase _patientCase ;


  PatientCase get patientCase {
    return _patientCase;
  }

  Future<bool> fetchAndSetPatient(int id) async {
    final response = await http.get(FETCH_PATIENT_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _patient = Patient.fromJson(extractedData['data']);
    //print(_patient.first_name);
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }


  Future<bool> fetchAndSetPatientCase(int id) async {
    final response = await http.get(FETCH_CASE_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _patientCase = PatientCase.fromJson(extractedData['data']);
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }

  Future<Patient> updatePatient(int id , Patient patient) async {
    Map<String,dynamic> body = {
      'first_name' : patient.first_name,
      'second_name': patient.second_name,
      'third_name' : patient.third_name,
      'nationality_id' : patient.nationality_id.toString(),
      'job' : patient.job,
      'sex_id' : patient.gender_id.toString(),
      'blood_id' : patient.blood_id.toString(),
      'notes' : patient.notes,
      'image' : patient.image,
      'address' : patient.address,
      'phone' : patient.phone,
      'email' : patient.email,
      'social_status': patient.social_status,
      'date_of_file':patient.date_of_file.toString(),
      'date_of_birth' : patient.date_of_birth.toString(),
    };

    final response = await http.post(UPDATE_PATIENT_URL(id),headers:await getHeaders(),
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _patient = Patient.fromJson(extractedData['data']);
    print(_patient.full_name);
    notifyListeners();
  }


  Future<http.Response> addPatient(int id , Patient patient , String identification_number) async {

    Map<String,dynamic> body = {
    'Identification_number' : patient.identification_number.toString(),
    'first_name' : patient.first_name.toString(),
    'second_name': patient.second_name.toString(),
    'third_name' : patient.third_name.toString(),
    'nationality_id' : patient.nationality_id.toString(),
    'job' : patient.job,
    'sex_id' : patient.gender_id.toString(),
    'blood_id' : patient.blood_id.toString(),
    if(patient.notes != null)
      'notes' : patient.notes.toString(),
    if(patient.image != null)
    'image' : patient.image.toString(),
    'address' : patient.address.toString(),
    'phone' : patient.phone.toString(),
    'email' : patient.email.toString(),
    'social_status': patient.social_status.toString(),
    'date_of_file': DateTime.now().toString(),
    'date_of_birth' : patient.date_of_birth.toString(),
    };

    final response = await http.post(ADD_PATIENT_URL,headers:await getHeaders(),
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
