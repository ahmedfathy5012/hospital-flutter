import 'package:flutter/foundation.dart';

class Nationality with ChangeNotifier{
  int nationality_id;
  String nationality_name;

  Nationality({@required this.nationality_id,@required this.nationality_name});


  Nationality.fromJson(Map<String,dynamic> jsonObject){
    this.nationality_id=jsonObject['nationality_id'];
    this.nationality_name=jsonObject['nationality_name'];
  }
}