import 'package:flutter/foundation.dart';
import 'abstractmodel.dart';
class Gender extends AbstractModel{

  static String table = 'genders';

  int id;
  String title;

  Gender({@required this.id,@required this.title});

  Gender.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['gender_id'];
    this.title=jsonObject['gender_name'];
  }
  Gender.fromSQFLITE(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'gender_id': id,
      'gender_name': title
    };
    return map;
  }
}