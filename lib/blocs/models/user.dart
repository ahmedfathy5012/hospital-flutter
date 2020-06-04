import 'package:flutter/foundation.dart';

class User{
  int user_id;
  String identidication_number;
  String api_token;
  String user_role;
  int user_role_id;
  String user_image='';
  String user_name;
  String user_job;

  User({this.user_id, this.identidication_number , this.api_token , this.user_role,this.user_role_id,this.user_image,this.user_name,this.user_job});


  User.fromJson(Map<String,dynamic> jsonObject){
    this.user_id = jsonObject['user_id'];
    this.identidication_number=jsonObject['user_identification_number'];
    this.api_token=jsonObject['user_api_token'];
    this.user_role=jsonObject['user_role'];
    this.user_role_id = jsonObject['user_role_id'];
    if(jsonObject['user_image']!=null)
    this.user_image=jsonObject['user_image'];
    this.user_job=jsonObject['user_job'];
    this.user_name=jsonObject['user_name'];
  }
}