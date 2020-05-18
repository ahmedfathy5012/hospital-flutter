
class Count{
  int doctor_count;
  int employee_count;
  int nurse_count;
  int Patient_count;
  int diagnose_count;
  int surgery_count;

  Count({this.diagnose_count,this.surgery_count,this.doctor_count, this.employee_count, this.nurse_count, this.Patient_count});

  Count.fromJson(Map<String,dynamic> jsonObject){
    this.doctor_count = jsonObject['doctor_count'];
    this.employee_count = jsonObject['employee_count'];
    this.nurse_count = jsonObject['nurse_count'];
    this.Patient_count = jsonObject['patient_count'];
    this.diagnose_count = jsonObject['diagnose_count'];
    this.surgery_count = jsonObject['surgery_count'];
  }
}