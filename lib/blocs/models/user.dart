import 'package:flutter/foundation.dart';

class User{
  int user_id;
  String identidication_number;
  String api_token;
  String user_role;

  User({this.user_id, this.identidication_number , this.api_token , this.user_role});


  User.fromJson(Map<String,dynamic> jsonObject){
    this.user_id = jsonObject['user_id'];
    this.identidication_number=jsonObject['user_identification_number'];
    this.api_token=jsonObject['user_api_token'];
    this.user_role=jsonObject['user_role'];
  }
}