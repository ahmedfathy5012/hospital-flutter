import 'package:flutter/material.dart';
import 'pref_services.dart';

class ApiHelper extends PrefServices{
   static const String MAIN_URL = 'https://devida.herokuapp.com/api/';
   final String FETCH_DOCTORS_URL= MAIN_URL+'doctors';
   final String FETCH_COUNT_URL =MAIN_URL+'data-count';
   final String ADD_CASE_URL = MAIN_URL+'add-case';
   final String ADD_DIAGNOSE_URL = MAIN_URL+'add_diagnose';
   final String FETCH_DIAGNOSES_URL = MAIN_URL+'diagnoses';
   final String ADD_DOCTOR_URL = MAIN_URL+'add-doctor';
   final String ADD_EMPLOYEE_URL = MAIN_URL+'add-employee';
   final String FETCH_EMPLOYEES_URL = MAIN_URL+'employees';
   final String FETCH_NURSES_URL = MAIN_URL+'nurses';
   final String ADD_NURSE_URL = MAIN_URL+'add-nurse';
   final String FETCH_PATIENTS_URL = MAIN_URL+'patients';
   final String ADD_PATIENT_URL = MAIN_URL+'add-patient';
   final String ADD_SURGERY_URL = MAIN_URL+'add-operation';
   final String FETCH_SURERIES_URL = MAIN_URL+'operations';
   final String FETCH_ANESRHETICS_URL = MAIN_URL+'anesthetics';
   final String FETCH_BLOOD_URL = MAIN_URL+'blood';

   final String FETCH_SPECIALIZATIONS_URL = MAIN_URL+'specializations';
   final String FETCH_NATIONALITIES_URL = MAIN_URL+'nationalities';
   final String FETCH_JOBS_URL = MAIN_URL+'jobs';
   final String FETCH_GENDERS_URL = MAIN_URL+'sex';
   final String FETCH_ROLES_URL = MAIN_URL+'roles';

   String FETCH_DIAGNOSE_URL(int id){
     return MAIN_URL+'diagnose/'+id.toString();
   }
   String UPDATE_DIAGNOSE_URL(int id){
     return MAIN_URL+'update-diagnose/'+id.toString();
   }
   String FETCH_DOCTOR_URL(int id){
     return MAIN_URL+'doctor/'+id.toString();
   }
   String UPDATE_DOCTOR_URL(int id){
     return MAIN_URL+'update-doctor/'+id.toString();
   }
   String FETCH_EMPLOYEE_URL(int id){
     return MAIN_URL+'employee/'+id.toString();
   }
   String UPDATE_EMPLOYEE_URL(int id){
     return MAIN_URL+'update-employee/'+id.toString();
   }
   String UPDATE_NURSE_URL(int id){
     return MAIN_URL+'update-nurse/'+id.toString();
   }
   String FETCH_NURSE_URL(int id){
     return MAIN_URL+'nurse/'+id.toString();
   }
   String FETCH_PATIENT_URL(int id){
     return MAIN_URL+'patient/'+id.toString();
   }
   String FETCH_CASE_URL(int id){
     return MAIN_URL+'patient_case/'+id.toString();
   }
   String UPDATE_PATIENT_URL(int id){
     return MAIN_URL+'update-patient/'+id.toString();
   }
   String FETCH_SURGERY_URL(int id){
     return MAIN_URL+'operation/'+id.toString();
   }
   String UPDATE_SURGERY_URL(int id){
     return MAIN_URL+'update-operation/'+id.toString();
   }



   Future<Map<String,String>> getHeaders()async{
    String token =  await PrefServices.prefget('api_token');
    Map<String,String> headers ;
    headers = {
      'Accept': 'application/json',
      'Authorization' : 'Bearer ' + token ,
    };
    return headers;
  }
}
