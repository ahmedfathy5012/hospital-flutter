import 'doctors.dart';
import 'patient_case.dart';


class Diagnose{
  int id;
  String diagnose;
  String drugs;
  int doctor_id;
  int patient_id;
  int patient_case_id;
  String doctor_name;
  String patient_name;
  String date_of_entry;
  String date_of_exit;


  Diagnose({this.date_of_exit,this.id, this.diagnose, this.drugs, this.doctor_id, this.patient_case_id, this.patient_id ,this.doctor_name , this.patient_name , this.date_of_entry});

  Diagnose.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.diagnose=jsonObject['diagnose'];
    this.drugs=jsonObject['drugs'];
    this.doctor_id=jsonObject['doctor_id'];
    //this.patient_id=jsonObject['patient_id'];
    //this.date_of_entry = jsonObject['date_of_entry'];
    this.patient_case_id = jsonObject['patient_case_id'];
    this.doctor_name = jsonObject['doctor_name'];
    this.patient_name = jsonObject['patient_name'];

  }
}