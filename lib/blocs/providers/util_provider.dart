import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import '../models/specialization.dart';
import '../models/nationality.dart';
import '../models/job.dart';
import '../models/gender.dart';
import '../models/blood.dart';


class UtilProvider with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };
  List<Job> _jobs = [
    Job(job_id: 1, job_name: 'name 1'),
    Job(job_id: 2, job_name: 'name 2'),
  ];
  List<Blood> _blood = [];
  List<Gender> _gender = [];
  List<Specialization> _specializations = [];
  List<Nationality> _nationalities = [];

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




  Future<void> fetchSpecializations() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Specialization> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Specialization.fromJson(item)
      );
    }
   _specializations = loadedProducts;
    notifyListeners();
  }

  Future<void> fetchNationalities() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Nationality> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Nationality.fromJson(item)
      );
    }
    _nationalities = loadedProducts;
    notifyListeners();

  }

  Future<void> fetchJobs() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Job> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Job.fromJson(item)
      );
    }
    _jobs = loadedProducts;
    notifyListeners();

  }

  Future<void> fetchGenders() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Gender> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Gender.fromJson(item)
      );
    }
    _gender = loadedProducts;
    notifyListeners();
  }


  Future<void> fetchBlood() async {
    String url = 'http://192.168.153.1/hospital-api/public/api/doctors';
    http.Response response = await http.get(url,headers:headers);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Blood> loadedProducts = [];
    for (var item in extractedData['data']){
      loadedProducts.add(
          Blood.fromJson(item)
      );
    }
    _blood = loadedProducts;
    notifyListeners();
  }
}