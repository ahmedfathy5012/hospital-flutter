import 'package:flutter/foundation.dart';
import 'abstractmodel.dart';
class Nationality extends AbstractModel{

  static String table = 'nationalities';

  int id;
  String title;

  Nationality({@required this.id,@required this.title});


  Nationality.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['nationality_id'];
    this.title=jsonObject['nationality_name'];
  }
  Nationality.fromSQFLITE(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'nationality_id': id,
      'nationality_id': title
    };
    return map;
  }
}