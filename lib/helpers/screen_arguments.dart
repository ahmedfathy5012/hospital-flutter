class ScreenArguments {
  int patient_id;
  int doctor_id;
  int patient_case_id;
  int diagnose_id;
  int surgery_id;
  bool isDrawer;
  int nurse_id;
  int employee_id;
  ScreenArguments({
    this.patient_id = null,
    this.doctor_id = null,
    this.patient_case_id = null,
    this.diagnose_id = null,
    this.surgery_id = null,
    this.isDrawer=false,
    this.nurse_id,
    this.employee_id
  });
}
