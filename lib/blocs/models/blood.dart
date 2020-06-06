import 'package:flutter/foundation.dart';
import 'abstractmodel.dart';
import 'package:devida/database/db.dart';

class Blood extends AbstractModel{

  static String table = 'blood';

  int id;
  String title;

  Blood({@required this.id,@required this.title});

  Blood.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['blood_id'];
    this.title=jsonObject['blood_name'];
  }
  Blood.fromSQFLITE(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'blood_id': id,
      'blood_name': title
    };
    return map;
  }
}