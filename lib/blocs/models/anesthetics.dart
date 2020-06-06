import 'package:flutter/foundation.dart';
import 'abstractmodel.dart';

class Anesthetics extends AbstractModel{

  static String table = 'anesthetics';

  int id;
  String title;

  Anesthetics({ this.id, this.title});

  Anesthetics.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title
    };
    return map;
  }
}