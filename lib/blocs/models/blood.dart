import 'package:flutter/foundation.dart';

class Blood {
  int blood_id;
  String blood_name;

  Blood({@required this.blood_id,@required this.blood_name});

  Blood.fromJson(Map<String,dynamic> jsonObject){
    this.blood_id=jsonObject['blood_id'];
    this.blood_name=jsonObject['blood_name'];
  }
}