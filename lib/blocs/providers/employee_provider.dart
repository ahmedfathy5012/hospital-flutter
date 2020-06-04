import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/employee.dart';

import 'package:http/http.dart' as http;

import '../../helpers/api_helper.dart';

class EmployeeProvider extends ApiHelper with ChangeNotifier {

  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Employee _employee ;


  Employee get employee {
    return _employee;
  }

  Future<bool> fetchAndSetEmployee(int id) async {
    final response = await http.get(FETCH_EMPLOYEE_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _employee = Employee.fromJson(extractedData['data']);
    print(_employee.blood.blood_id);
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }

  Future<Employee> updateEmployee(int id , Employee employee) async {
    Map<String,dynamic> body = {
      'first_name' : employee.first_name,
      'second_name': employee.second_name,
      'third_name' : employee.third_name,
      'nationality_id' : employee.nationality_id.toString(),
      'job_id' : employee.job_id.toString(),
      'sex_id' : employee.gender_id.toString(),
      'blood_id' : employee.blood_id.toString(),
      'notes' : employee.notes,
      'image' : employee.image,
      'address' : employee.address,
      'phone' : employee.phone,
      'email' : employee.email,
      'social_status': employee.social_status,
      'date_of_hiring':employee.date_of_hiring.toString(),
      'date_of_birth' : employee.date_of_birth.toString(),
    };


    final response = await http.post(UPDATE_EMPLOYEE_URL(id),headers:await getHeaders(),
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _employee = Employee.fromJson(extractedData['data']);
    print(_employee.blood.blood_id);
    notifyListeners();
  }


  Future<http.Response> addEmployee(int id , Employee employee) async {

    Map<String,dynamic> body = {
    'Identification_number' : employee.identification_number.toString(),
    'first_name' : employee.first_name.toString(),
    'second_name': employee.second_name.toString(),
    'third_name' : employee.third_name.toString(),
    'nationality_id' : employee.nationality_id.toString(),
    'job_id' : employee.job_id.toString(),
    'sex_id' : employee.gender_id.toString(),
    'blood_id' : employee.blood_id.toString(),
    if(employee.notes != null)
      'notes' : employee.notes.toString(),
    if(employee.image != null)
    'image' : employee.image.toString(),
    'address' : employee.address.toString(),
    'phone' : employee.phone.toString(),
    'email' : employee.email.toString(),
    'social_status': employee.social_status.toString(),
    'date_of_hiring': DateTime.now().toString(),
    'date_of_birth' : employee.date_of_birth.toString(),
    };


    final response = await http.post(ADD_EMPLOYEE_URL,headers:await getHeaders(),
    body:  body
    );
    //if(json.decode(response.body).message.contains('users_identification_number_unique'))
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('${extractedData}');

    //final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //_doctor = Doctor.fromJson(extractedData['data']);
    //print(_doctor.first_name);
    notifyListeners();
    return response;
  }

}
