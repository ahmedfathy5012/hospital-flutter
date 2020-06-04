import 'package:flutter/foundation.dart';
import '../models/specialization.dart';
import 'job.dart';

class Nurses{

  int id;
  String fullName;
  String showName;
  String image;
  Job job;
  String gender;


  Nurses({ this.id, this.fullName,  this.showName,this.image, this.job});

  Nurses.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['nurse_id'];
    this.fullName=jsonObject['nurse_full_name'];
    this.showName=jsonObject['nurse_show_name'];
    this.image=jsonObject['nurse_image'];
    this.job = Job.fromJson(jsonObject['nurse_job']);
    this.gender=jsonObject['gender'];

  }
}