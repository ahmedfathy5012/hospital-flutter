import 'patients.dart';

class PatientCase{
  int id;
  int paient_id;
  String entry_date;
  String exit_date;
  Patients patient;

  PatientCase({this.id, this.paient_id, this.entry_date, this.exit_date, this.patient});

}