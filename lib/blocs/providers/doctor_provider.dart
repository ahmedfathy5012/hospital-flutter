import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/doctor.dart';
import '../models/specialization.dart';
import '../models/job.dart';
import '../models/gender.dart';
import '../models/user.dart';
import '../models/nationality.dart';
import '../models/blood.dart';
import '../models/diagnoses.dart';
import '../models/doctors.dart';
import '../models/patient_case.dart';
import '../models/patients.dart';
import '../models/operations.dart';
import '../models/person_extension.dart';

import 'package:http/http.dart' as http;

class DoctorProvider with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Doctor _doctor ;


  Doctor get doctor {
    return _doctor;
  }

  Future<Doctor> fetchAndSetDoctor(int id) async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctor/$id';
    final response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _doctor = Doctor.fromJson(extractedData['data']);
    print(_doctor.blood.blood_id);
    notifyListeners();
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
        'notes' : doctor.notes,
        'image' : doctor.image,
         'address' : doctor.address,
         'phone' : doctor.phone,
         'email' : doctor.email,
      'social_status': doctor.social_status,
         'date_of_hiring':doctor.date_of_hiring.toString(),
      'date_of_birth' : doctor.date_of_birth.toString(),
    };

    String url = 'http://192.168.153.1/hospital-api/public/api/update-doctor/$id';
    final response = await http.post(url,headers:headers,
     body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _doctor = Doctor.fromJson(extractedData['data']);
    print(_doctor.blood.blood_id);
    notifyListeners();
  }


  Future<void> addDoctor(int id , Doctor doctor , String identification_number) async {

    Map<String,dynamic> body = {
      'Identification_number' : identification_number.toString(),
      'first_name' : doctor.first_name.toString(),
      'second_name': doctor.second_name.toString(),
      'third_name' : doctor.third_name.toString(),
      'specialization_id' : doctor.specialization_id.toString(),
      'nationality_id' : doctor.nationality_id.toString(),
      'job_id' : doctor.job_id.toString(),
      'sex_id' : doctor.gender_id.toString(),
      'blood_id' : doctor.blood_id.toString(),
      if(doctor.notes != null)
      'notes' : doctor.notes.toString(),
      if(doctor.image != null)
      'image' : doctor.image.toString(),
      'address' : doctor.address.toString(),
      'phone' : doctor.phone.toString(),
      'email' : doctor.email.toString(),
      'social_status': doctor.social_status.toString(),
      'date_of_hiring': DateTime.now().toString(),
      'date_of_birth' : doctor.date_of_birth.toString(),
    };


    String url = 'http://192.168.153.1/hospital-api/public/api/add-doctor';
    final response = await http.post(url,headers:headers,
        body:  body
    );
   // print('${response.statusCode}');
    //final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //_doctor = Doctor.fromJson(extractedData['data']);
    //print(_doctor.first_name);
    notifyListeners();
  }




}
