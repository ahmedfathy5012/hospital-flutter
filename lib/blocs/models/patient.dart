import 'package:flutter/foundation.dart';

import 'job.dart';
import 'gender.dart';
import 'blood.dart';
import 'user.dart';
import 'nationality.dart';
import 'specialization.dart';
import 'diagnoses.dart';
import 'operations.dart';
import 'person_extension.dart';
import 'patient_case.dart';

class Patient{
  int id;
  String first_name;
  String second_name;
  String third_name;
  String address;
  String phone;
  String email;
  String social_status;
  String notes;
  String image;
  String full_name;
  String date_of_birth;
  String date_of_file;
  int gender_id;
  int blood_id;
  int user_id;
  int nationality_id;
  String job;
  Gender gender;
  Blood blood;
  User user;
  Nationality nationality;
  List<PatientCase> patient_cases;
  List<PersonExtension> surgery;
  String identification_number;
  int user_role_id;


  Patient({
    this.id,
    this.first_name,
    this.second_name,
    this.third_name,
    this.address,
    this.phone,
    this.email,
    this.social_status,
    this.notes,
    this.image,
    this.date_of_birth,
    this.date_of_file,
    this.gender_id,
    this.blood_id,
    this.nationality_id,
    this.user_id,
    this.job,
    this.gender,
    this.blood,
    this.user,
    this.nationality,
    this.full_name,
    this.patient_cases,
    this.surgery,
    this.identification_number,
    this.user_role_id,
  });

  Patient.fromJson(Map<String,dynamic> jsonObject){
    this.id = jsonObject['patient_id'];
    this.first_name = jsonObject['patient_first_name'];
    this.second_name = jsonObject['patient_second_name'];
    this.third_name = jsonObject['patient_third_name'];
    this.address = jsonObject['patient_address'];
    this.phone = jsonObject['patient_phone'];
    this.email = jsonObject['patient_email'];
    this.social_status = jsonObject['patient_social_status'];
    this.notes = jsonObject['patient_notes'];
    this.image = jsonObject['patient_image'];
    this.full_name = jsonObject['patient_full_name'];
    this.gender_id = jsonObject['gender_id'];
    this.blood_id=jsonObject['blood_id'];
    this.user_id=jsonObject['user_id'];
    this.date_of_birth=jsonObject['patient_date_of_birth'];
    this.date_of_file=jsonObject['patient_date_of_file'];
    this.nationality_id=jsonObject['nationality_id'];
    this.job=jsonObject['patient_job'];
    this.gender=Gender.fromJson(jsonObject['patient_gender']);
    this.blood=Blood.fromJson(jsonObject['patient_blood']);
    this.user=User.fromJson(jsonObject['patient_user']);
    this.nationality=Nationality.fromJson(jsonObject['patient_nationality']);
    this.patient_cases=[];
    if(jsonObject['patient_case'] != null){
      _setPatientCase(jsonObject['patient_case']);
    }else{}
    this.surgery=[];
    if(jsonObject['patient_surgery'] != null){
      _setSurgery(jsonObject['patient_surgery']);
    }else{}


  }


  void _setPatientCase(List<dynamic> reviewsJson){
    if(reviewsJson.length>0){
      for(var item in reviewsJson){
        if(item != null){
          patient_cases.add(PatientCase.fromJson(item));
        }
      }
    }
  }

  void _setSurgery(List<dynamic> reviewsJson){
    if(reviewsJson.length>0){
      for(var item in reviewsJson){
        if(item != null){
          surgery.add(PersonExtension.fromJson(item));
        }
      }
    }
  }

}


