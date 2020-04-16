import 'package:flutter/foundation.dart';

class User{
  int user_id;
  String identidication_number;

  User({@required this.user_id,@required this.identidication_number});


  User.fromJson(Map<String,dynamic> jsonObject){
    this.user_id = jsonObject['user_id'];
    this.identidication_number=jsonObject['user_identification_number'];
  }
}