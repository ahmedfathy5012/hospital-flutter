import 'package:flutter/foundation.dart';
import 'abstractmodel.dart';
class Job extends AbstractModel{

  static String table = 'jobs';

  int id;
  String title;

  Job({@required this.id,@required this.title});


  Job.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['job_id'];
    this.title=jsonObject['job_name'];
  }
  Job.fromSQFLITE(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.title=jsonObject['title'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'job_id': id,
      'job_id': title
    };
    return map;
  }
}