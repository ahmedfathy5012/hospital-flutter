import 'package:flutter/foundation.dart';
import 'abstractmodel.dart';
class Specialization extends AbstractModel{

  static String table = 'specializations';


  int id;
  String title;

  Specialization({@required this.id,@required this.title});


  Specialization.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['specialization_id'];
    this.title=jsonObject['specialization_name'];
  }
  Specialization.fromSQFLITE(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'specialization_id': id,
      'specialization_name': title
    };
    return map;
  }
}