class Surgery {
  int id;
  String name_of_surgery;
  String date_of_surgery;
  int anesthesiologist_id;
  int surgeon_id;
  int anesthetic_id;
  int patient_id;
  String surgeon_name;
  String patient_name;
  String anesthesiologist_name;
  String anesthetic;


  Surgery({
    this.id,
    this.name_of_surgery,
    this.date_of_surgery,
    this.anesthesiologist_id,
    this.surgeon_id,
    this.anesthetic_id,
    this.patient_id,
    this.surgeon_name,
    this.patient_name,
    this.anesthesiologist_name,
    this.anesthetic,

  });

  Surgery.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.date_of_surgery = jsonObject['date'];
    this.name_of_surgery = jsonObject['name'];
    this.anesthesiologist_id = jsonObject['anesthesiologist_id'];
    this.surgeon_id=jsonObject['surgeon_id'];
    this.anesthetic_id = jsonObject['anesthetic_id'];
    this.anesthesiologist_name = jsonObject['anesthesiologist_name'];
    this.surgeon_name = jsonObject['surgeon_name'];
    this.patient_name = jsonObject['patient_name'];
    this.anesthetic = jsonObject['anesthetic'];
    this.patient_id=jsonObject['patient_id'];
  }
}
