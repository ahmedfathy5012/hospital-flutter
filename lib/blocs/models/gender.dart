import 'package:flutter/foundation.dart';

class Gender with ChangeNotifier{
  int gender_id;
  String gender_name;

  Gender({@required this.gender_id,@required this.gender_name});

  Gender.fromJson(Map<String,dynamic> jsonObject){
    this.gender_id=jsonObject['gender_id'];
    this.gender_name=jsonObject['gender_name'];
  }
}