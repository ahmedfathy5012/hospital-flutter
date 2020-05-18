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

class Nurse{
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
  Job job;
  Gender gender;
  Blood blood;
  User user;
  Nationality nationality;
  List<PersonExtension> diagnoses;
  List<PersonExtension> operations;
  String identification_number;

  Nurse({
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
    this.user_id,
    this.job,
    this.gender,
    this.blood,
    this.user,
    this.nationality,
    this.full_name,
    this.diagnoses,
    this.operations,
    this.identification_number
  });

  Nurse.fromJson(Map<String,dynamic> jsonObject){
    this.id =            jsonObject['nurse_id'];
    this.first_name =    jsonObject['nurse_first_name'];
    this.second_name =   jsonObject['nurse_second_name'];
    this.third_name =    jsonObject['nurse_third_name'];
    this.address =       jsonObject['nurse_address'];
    this.phone =         jsonObject['nurse_phone'];
    this.email =         jsonObject['nurse_email'];
    this.social_status = jsonObject['nurse_social_status'];
    this.notes =         jsonObject['nurse_notes'];
    this.image =         jsonObject['nurse_image'];
    this.full_name =     jsonObject['nurse_full_name'];
    this.job_id=         jsonObject['job_id'];
    this.gender_id =     jsonObject['gender_id'];
    this.blood_id=       jsonObject['blood_id'];
    this.user_id=        jsonObject['user_id'];
    this.date_of_birth=  jsonObject['nurse_date_of_birth'];
    this.date_of_hiring= jsonObject['nurse_date_of_hiring'];
    this.nationality_id= jsonObject['nationality_id'];
    this.job=      Job.fromJson(jsonObject['nurse_job']);
    this.gender=Gender.fromJson(jsonObject['nurse_gender']);
    this.blood=  Blood.fromJson(jsonObject['nurse_blood']);
    this.user=    User.fromJson(jsonObject['nurse_user']);
    this.nationality=Nationality.fromJson(jsonObject['nurse_nationality']);

  }

}


