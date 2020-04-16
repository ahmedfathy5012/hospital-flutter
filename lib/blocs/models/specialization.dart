import 'package:flutter/foundation.dart';

class Specialization{
  int specialization_id;
  String specialization_name;

  Specialization({@required this.specialization_id,@required this.specialization_name});


  Specialization.fromJson(Map<String,dynamic> jsonObject){
    this.specialization_id=jsonObject['specialization_id'];
    this.specialization_name=jsonObject['specialization_name'];
  }
}