class Patients{
  int id;
  String fullName;
  String showName;
  String image;
  String date_of_file;
  String gender;


  Patients({ this.id, this.fullName,  this.showName,this.image, this.date_of_file});

  Patients.fromJson(Map<String,dynamic> jsonObject){
    this.id=jsonObject['patient_id'];
    this.fullName=jsonObject['patient_full_name'];
    this.showName=jsonObject['patient_show_name'];
    this.image=jsonObject['patient_image'];
    this.date_of_file=jsonObject['patient_date_of_file'];
    this.gender=jsonObject['gender'];
  }

}