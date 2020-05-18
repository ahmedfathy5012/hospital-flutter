import 'patients.dart';
import 'person_extension.dart';

class PatientCase{
  int id;
  String entry_date='';
  String exit_date='';
  List<PersonExtension> diagnoses;

  PatientCase({this.id, this.entry_date, this.exit_date, this.diagnoses});

  PatientCase.fromJson(Map<String,dynamic> jsonObject){
    this.id = jsonObject['id'];
    if(jsonObject['entry_date']!=null)
    this.entry_date = jsonObject['entry_date'];
    if(jsonObject['exit_date']!=null)
    this.exit_date = jsonObject['exit_date'];
    this.diagnoses = [];
    if(jsonObject['patient_diagnoses']!=null){
      _setDiagnose(jsonObject['patient_diagnoses']);
    }
  }

  void _setDiagnose(List<dynamic> reviewsJson){
    if(reviewsJson.length>0){
      for(var item in reviewsJson){
        if(item != null){
          diagnoses.add(PersonExtension.fromJson(item));
        }
      }
    }
  }

}