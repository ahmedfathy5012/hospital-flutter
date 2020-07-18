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

class Doctor{
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
  String date_of_hiring;
  int job_id;
  int gender_id;
  int blood_id;
  int user_id;
  int nationality_id;
  int specialization_id;
  Job job;
  Gender gender;
  Blood blood;
  User user;
  Nationality nationality;
  Specialization specialization;
  List<PersonExtension> diagnoses;
  List<PersonExtension> surgery;
  String identification_number;
  int user_role_id;

  Doctor({
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
    this.date_of_hiring,
    this.job_id,
    this.gender_id,
    this.blood_id,
    this.nationality_id,
    this.specialization_id,
    this.user_id,
    this.job,
    this.gender,
    this.blood,
    this.user,
    this.nationality,
    this.specialization,
    this.full_name,
    this.diagnoses,
    this.surgery,
    this.identification_number,
    this.user_role_id,
});

  Doctor.fromJson(Map<String,dynamic> jsonObject){
    this.id = jsonObject['doctor_id'];
    this.first_name = jsonObject['doctor_first_name'];
    this.second_name = jsonObject['doctor_second_name'];
    this.third_name = jsonObject['doctor_third_name'];
    this.address = jsonObject['doctor_address'];
    this.phone = jsonObject['doctor_phone'];
    this.email = jsonObject['doctor_email'];
    this.social_status = jsonObject['doctor_social_status'];
    this.notes = jsonObject['doctor_notes'];
    this.image = jsonObject['doctor_image'];
    this.full_name = jsonObject['doctor_full_name'];
    this.job_id=jsonObject['job_id'];
    this.gender_id = jsonObject['gender_id'];
    this.blood_id=jsonObject['blood_id'];
    this.user_id=jsonObject['user_id'];
    this.date_of_birth=jsonObject['doctor_date_of_birth'];
    this.date_of_hiring=jsonObject['doctor_date_of_hiring'];
    this.specialization_id=jsonObject['specialization_id'];
    this.nationality_id=jsonObject['nationality_id'];
    this.user_role_id=jsonObject['user_role_id'];
    this.job=Job.fromJson(jsonObject['doctor_job']);
    this.gender=Gender.fromJson(jsonObject['doctor_gender']);
    this.blood=Blood.fromJson(jsonObject['doctor_blood']);
    this.user=User.fromJson(jsonObject['doctor_user']);
    this.specialization=Specialization.fromJson(jsonObject['doctor_specialization']);
    this.nationality=Nationality.fromJson(jsonObject['doctor_nationality']);
    this.diagnoses=[];
    if(jsonObject['doctor_diagnoses'] != null){
      _setDiagnose(jsonObject['doctor_diagnoses']);
    }else{}
    this.surgery=[];
//    if(jsonObject['doctor_surgery'] != null){
//      _setSurgery(jsonObject['doctor_surgery']);
//    }else{}

  }


  void _setDiagnose(List<dynamic> reviewsJson){
    if(reviewsJson.length>0){
      for(var item in reviewsJson){
        if(item != null){
          diagnoses.add(PersonExtension.fromJson(item));
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


