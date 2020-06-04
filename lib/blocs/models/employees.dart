import 'package:flutter/foundation.dart';
import '../models/specialization.dart';
import 'job.dart';

class Employees{

  int id;
  String fullName;
  String showName;
  String image;
  Job job;
  String gender;


  Employees({ this.id, this.fullName,  this.showName,this.image, this.job});

  Employees.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['employee_id'];
    this.fullName=jsonObject['employee_full_name'];
    this.showName=jsonObject['employee_show_name'];
    this.image=jsonObject['employee_image'];
    this.job = Job.fromJson(jsonObject['employee_job']);
    this.gender=jsonObject['gender'];

  }
}