import 'package:flutter/foundation.dart';


class Anesthetics{

  int id;
  String title;

  Anesthetics({ this.id, this.title});

  Anesthetics.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
}