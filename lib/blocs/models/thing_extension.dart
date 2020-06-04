class ThingsExtension{
  int id;
  String patient_name;
  String doctor_name;
  String patient_image;
  String patient_full_name;
  String gender;
  ThingsExtension({
    this.id,
    this.patient_image,
    this.patient_name,
    this.doctor_name,
    this.patient_full_name,
    this.gender,
  });

  ThingsExtension.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['id'];
    this.patient_image=jsonObject['patient_image'];
    this.patient_name=jsonObject['patient_name'];
    this.doctor_name=jsonObject['doctor_name'];
    this.patient_full_name=jsonObject['patient_full_name'];
    this.gender=jsonObject['gender'];
  }
}