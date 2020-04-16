import 'package:flutter/foundation.dart';

class Job with ChangeNotifier{
  int job_id;
  String job_name;

  Job({@required this.job_id,@required this.job_name});


  Job.fromJson(Map<String,dynamic> jsonObject){
    this.job_id=jsonObject['job_id'];
    this.job_name=jsonObject['job_name'];
  }
}