import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import '../models/specialization.dart';
import '../models/nationality.dart';
import '../models/job.dart';
import '../models/gender.dart';
import '../models/blood.dart';
import '../models/role.dart';

import '../../helpers/api_helper.dart';
import '../../helpers/database_helper.dart';


class UtilProvider extends ApiHelper with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };
  List<Job> _jobs = [
    Job(id: 1, title: 'name 1'),
    Job(id: 2, title: 'name 2'),
  ];
  List<Blood> _blood = [];
  List<Gender> _gender = [];
  List<Specialization> _specializations = [];
  List<Nationality> _nationalities = [];
  List<Role> _roles = [];

  List<Role> get roles{
    return [..._roles];
  }


  List<Job> get jobs{
    return [..._jobs];
  }
  List<Gender> get gender{
    return [..._gender];
  }

  List<Blood> get blood{
    return [..._blood];
  }

  List<Specialization> get specializations{
    return [..._specializations];
  }

  List<Nationality> get nationalities{
    return [..._nationalities];
  }


  List<SelectionData> socialStatus = [
  SelectionData(id:1,title:'Married'),
  SelectionData(id:2,title:'Celibate'),
  ];



  Future<List<Role>> fetchRoles(DatabaseHelper helper) async {
    var extractedDtatbaseData = await helper.getAll('role');
    print(await helper.getAll('role'));
    List<Role> loadedProducts = [];
    if(extractedDtatbaseData.isEmpty){
      http.Response response = await http.get(FETCH_ROLES_URL,headers:await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var item in extractedData['data']){
        loadedProducts.add(
            Role.fromJson(item)
        );
      }
      for (var item in extractedData['data']){
        helper.inset('role',Role.fromJson(item));
      }
    }else{
      for (var item in extractedDtatbaseData){
        loadedProducts.add(
            Role.fromSQFLITE(item)
        );
      }
    }
    _roles = loadedProducts;
    notifyListeners();
    if(_specializations.isNotEmpty)
      return _roles;
  }



  Future<List<Specialization>> fetchSpecializations(DatabaseHelper helper) async {
    var extractedDtatbaseData = await helper.getAll('specialization');
    print(await helper.getAll('specialization'));
    List<Specialization> loadedProducts = [];
    if(extractedDtatbaseData.isEmpty){
    http.Response response = await http.get(FETCH_SPECIALIZATIONS_URL,headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(response.body);
    final List<Specialization> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Specialization.fromJson(item)
      );
    }
    for (var item in extractedData['data']){
      helper.inset('specialization',Specialization.fromJson(item));
    }
    }else{
      for (var item in extractedDtatbaseData){
        loadedProducts.add(
            Specialization.fromSQFLITE(item)
        );
      }
    }
   _specializations = loadedProducts;
    notifyListeners();
    if(_specializations.isNotEmpty)
      return _specializations;
  }

  Future<List<Nationality>> fetchNationalities(DatabaseHelper helper) async {
    var extractedDtatbaseData = await helper.getAll('nationality');
    print(await helper.getAll('nationality'));
    List<Nationality> loadedProducts = [];
    if(extractedDtatbaseData.isEmpty){
    http.Response response = await http.get(FETCH_NATIONALITIES_URL,headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Nationality> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Nationality.fromJson(item)
      );
    }
    for (var item in extractedData['data']){
      helper.inset('nationality',Nationality.fromJson(item));
    }
    }else{
      for (var item in extractedDtatbaseData){
        loadedProducts.add(
            Nationality.fromSQFLITE(item)
        );
      }
    }
    _nationalities = loadedProducts;
    notifyListeners();
    if(_nationalities.isNotEmpty)
      return _nationalities;
  }

  Future<List<Job>> fetchJobs(DatabaseHelper helper) async {
    var extractedDtatbaseData = await helper.getAll('job');
    print(await helper.getAll('job'));
    List<Job> loadedProducts = [];
    if(extractedDtatbaseData.isEmpty){
    http.Response response = await http.get(FETCH_JOBS_URL,headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Job> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Job.fromJson(item)
      );
    }
    for (var item in extractedData['data']){
      helper.inset('job',Job.fromJson(item));
    }
    }else{
      for (var item in extractedDtatbaseData){
        loadedProducts.add(
            Job.fromSQFLITE(item)
        );
      }
    }
    _jobs = loadedProducts;
    notifyListeners();
    if(_jobs.isNotEmpty)
      return _jobs;
  }

  Future<List<Gender>> fetchGenders(DatabaseHelper helper) async {
    var extractedDtatbaseData = await helper.getAll('gender');
    print(await helper.getAll('gender'));
    List<Gender> loadedProducts = [];
    if(extractedDtatbaseData.isEmpty) {
      http.Response response = await http.get(
          FETCH_GENDERS_URL, headers: await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var item in extractedData['data']) {
        loadedProducts.add(
            Gender.fromJson(item)
        );
      }
      for (var item in extractedData['data']){
        helper.inset('gender',Gender.fromJson(item));
      }
    }else{
      for (var item in extractedDtatbaseData){
        loadedProducts.add(
            Gender.fromSQFLITE(item)
        );
      }
    }
    _gender = loadedProducts;
    notifyListeners();
    if(_gender.isNotEmpty)
      return _gender;
  }


  Future<List<Blood>> fetchBlood(DatabaseHelper helper) async {
    var extractedDtatbaseData = await helper.getAll('blood');
    print(await helper.getAll('blood'));
    List<Blood> loadedProducts = [];
    if(extractedDtatbaseData.isEmpty){
      http.Response response = await http.get(FETCH_BLOOD_URL,headers:await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var item in extractedData['data']){
        loadedProducts.add(
            Blood.fromJson(item)
        );
      }
      for (var item in extractedData['data']){
        helper.inset('blood',Blood.fromJson(item));
      }
    }else{
      for (var item in extractedDtatbaseData){
        loadedProducts.add(
            Blood.fromSQFLITE(item)
        );
      }
    }
    _blood = loadedProducts;
    notifyListeners();
    if(_blood.isNotEmpty)
      return _blood;
  }
}

class SelectionData{
  final int id;
  final String title;
  SelectionData({this.id, this.title});
}