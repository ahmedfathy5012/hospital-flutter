import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:devida/ui/screens/login_screen.dart';

class AuthProvider with ChangeNotifier {
  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  User _user;
  String _token;
  String _userName=' ';
  String _userJob=' ';
  int _userId;
  bool _isAuth;

  User get user {
    return _user;
  }

  String get token{
    return _token;
  }

  int get userId{
    return _userId;
  }

  String get user_name{
    return _userName;
  }

  String get user_job{
    return _userJob;
  }

  bool get isAuth{
    return _isAuth;
  }


  Future<int> login(String identification_number , String password) async {
    String url = 'https://devida.herokuapp.com/api/login';

    final response = await http.post(
        url,
        headers:headers,
        body: {
          'Identification_number' : identification_number.toString() ,
          'password' : password.toString()
        }
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(response.statusCode==300){
      return 1;
    }else{
      if(response.statusCode==200){
        _user = User.fromJson(extractedData['data']);
        _userId = User.fromJson(extractedData['data']).user_id;
        _token = User.fromJson(extractedData['data']).api_token;
        _userName = User.fromJson(extractedData['data']).user_name;
        _userJob = User.fromJson(extractedData['data']).user_job;
        notifyListeners();
        SharedPreferences prefs =await SharedPreferences.getInstance();
        await prefs.setString('api_token',  _token);
        await prefs.setString('user_name',  _userName);
        await prefs.setString('user_job',   _userJob);

        return 0;
      }
      return 2;
    }
  }

  void logout()async{
//    _token = null;
//    _userId = null;
//    _userName = null;
//    _userJob = null;
    final prefs = await SharedPreferences.getInstance();
    notifyListeners();
    prefs.clear();
  }


   loadPref()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    _token = await prefs.getString('api_token');
    _userName = await prefs.getString('user_name');
    _userJob = await prefs.getString('user_job');
    notifyListeners();
  }


   Future<String>currentUser()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    String t = null;
    t = await prefs.getString('api_token');
    return t;
  }
}