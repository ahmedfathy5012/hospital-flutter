import 'doctors.dart';
import 'patient_case.dart';


class Diagnose{
  int diagnose_id;
  String diagnose;
  String drugs;
  int doctor_id;
  int patient_case_id;
  Doctors doctor;
  PatientCase patient_case;

  Diagnose({this.diagnose_id, this.diagnose, this.drugs, this.doctor_id, this.patient_case_id, this.doctor, this.patient_case});
}