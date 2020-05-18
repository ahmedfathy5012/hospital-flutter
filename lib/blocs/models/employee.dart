
import 'job.dart';
import 'gender.dart';
import 'blood.dart';
import 'user.dart';
import 'nationality.dart';


class Employee{
  int id;
  String first_name;
  String second_name;
  String third_name;
  String address;
  String phone;
  String email;
  String social_status;
  String notes;
  String image;
  String full_name;
  String date_of_birth;
  String date_of_hiring;
  int job_id;
  int gender_id;
  int blood_id;
  int user_id;
  int nationality_id;
  Job job;
  Gender gender;
  Blood blood;
  User user;
  Nationality nationality;
  String identification_number;

  Employee({
    this.id,
    this.first_name,
    this.second_name,
    this.third_name,
    this.address,
    this.phone,
    this.email,
    this.social_status,
    this.notes,
    this.image,
    this.date_of_birth,
    this.date_of_hiring,
    this.job_id,
    this.gender_id,
    this.blood_id,
    this.nationality_id,
    this.user_id,
    this.job,
    this.gender,
    this.blood,
    this.user,
    this.nationality,
    this.full_name,
    this.identification_number
  });

  Employee.fromJson(Map<String,dynamic> jsonObject){
    this.id =            jsonObject['employee_id'];
    this.first_name =    jsonObject['employee_first_name'];
    this.second_name =   jsonObject['employee_second_name'];
    this.third_name =    jsonObject['employee_third_name'];
    this.address =       jsonObject['employee_address'];
    this.phone =         jsonObject['employee_phone'];
    this.email =         jsonObject['employee_email'];
    this.social_status = jsonObject['employee_social_status'];
    this.notes =         jsonObject['employee_notes'];
    this.image =         jsonObject['employee_image'];
    this.full_name =     jsonObject['employee_full_name'];
    this.job_id=         jsonObject['job_id'];
    this.gender_id =     jsonObject['gender_id'];
    this.blood_id=       jsonObject['blood_id'];
    this.user_id=        jsonObject['user_id'];
    this.date_of_birth=  jsonObject['employee_date_of_birth'];
    this.date_of_hiring= jsonObject['employee_date_of_hiring'];
    this.nationality_id= jsonObject['nationality_id'];
    this.job=Job.fromJson(jsonObject['employee_job']);
    this.gender=Gender.fromJson(jsonObject['employee_gender']);
    this.blood=Blood.fromJson(jsonObject['employee_blood']);
    this.user=User.fromJson(jsonObject['employee_user']);
    this.nationality=Nationality.fromJson(jsonObject['employee_nationality']);

  }

}


