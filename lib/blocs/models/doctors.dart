import 'package:flutter/foundation.dart';
import '../models/specialization.dart';

class Doctors{

  int id;
  String fullName;
  String showName;
  String image;
  Specialization specialization;


  Doctors({ this.id, this.fullName,  this.showName,this.image, this.specialization});

  Doctors.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['doctor_id'];
    this.fullName=jsonObject['doctor_full_name'];
    this.showName=jsonObject['doctor_show_name'];
    this.image=jsonObject['doctor_image'];
    this.specialization=Specialization.fromJson(jsonObject['doctor_specialization']);
  }
}