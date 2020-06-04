import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/diagnose.dart';
import '../models/thing_extension.dart';

import '../../helpers/api_helper.dart';

class DiagnoseProvider extends ApiHelper with ChangeNotifier{

  Diagnose _diagnose ;
  Diagnose get diagnose{
    return _diagnose;
  }
  Future<bool> fetchAndSetDiagnose(int id) async {

    final response = await http.get(FETCH_DIAGNOSE_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _diagnose = Diagnose.fromJson(extractedData['data']);
    print('my dayta is ${_diagnose.id}');
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }



  Future<Diagnose> updateDiagnose(int id , Diagnose diagnose) async {
    Map<String,dynamic> body = {
      'diagnose' : diagnose.diagnose,
      'drugs': diagnose.drugs,
      'doctor_id' : diagnose.doctor_id.toString(),
      'patient_case_id' : diagnose.patient_case_id.toString(),
    };

    String url = 'http://192.168.153.1/hospital-api/public/api/update-diagnose/$id';
    final response = await http.post(UPDATE_DIAGNOSE_URL,headers:await getHeaders(),
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _diagnose = Diagnose.fromJson(extractedData['data']);
    notifyListeners();
  }


  Future<http.Response> addDiagnose({int id , Diagnose diagnose , bool isAddCase=false}) async {

    Map<String,dynamic> body = {
      'diagnose' : diagnose.diagnose,
      'drugs': diagnose.drugs,
      'doctor_id' : diagnose.doctor_id.toString(),
      'patient_case_id' : diagnose.patient_case_id.toString(),
    };

    Map<String,dynamic> addCaseBody = {
      'diagnose' : diagnose.diagnose,
      'drugs': diagnose.drugs,
      'doctor_id' : diagnose.doctor_id.toString(),
      'patient_id' : diagnose.patient_id.toString(),
      'entry_date' : diagnose.date_of_entry.toString(),
      'exit_date' : diagnose.date_of_exit.toString() == null ? null : diagnose.date_of_exit.toString(),
    };

    String url = isAddCase ?
        ADD_CASE_URL
        :
        ADD_DIAGNOSE_URL;
    final response = await http.post(
        url,
        headers:await getHeaders(),
        body: isAddCase ? addCaseBody : body
    );
    //if(json.decode(response.body).message.contains('users_identification_number_unique'))
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    notifyListeners();
    print(extractedData);
    return response;
  }



  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<ThingsExtension> searchList = [];


  List<ThingsExtension> _diagnoses = [];

  List<ThingsExtension> get diagnoses{
    return [..._diagnoses];
  }

  Future<bool> fetchAndSetDiagnoses() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/diagnoses';
    print('Taam0');
    if(_searchText.isNotEmpty){
      print('Taam1');
      _diagnoses.clear();
      searchList.forEach((item){
        if(item.patient_full_name.contains(_searchText)) {
          _diagnoses.add(item);
        }
      });
      notifyListeners();
    }else{
      print('Taam2');
      http.Response response = await http.get(FETCH_DIAGNOSES_URL,headers:await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ThingsExtension> loadedProducts = [];
      print(extractedData);
      for (var item in extractedData['data']){
        loadedProducts.add(
            ThingsExtension.fromJson(item)
        );
      }
      print('Taam');

      _diagnoses=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
      notifyListeners();
      if(response.statusCode==200)
        return true;
      return false;
    }
    print('jf');

  }


}