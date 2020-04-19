import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';


import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  Map<String,String> headers = {
    'Accept': 'application/json',
  };


  User _user;
  String _token;
  int _userId;

  User get user {
    return _user;
  }

  String get token{
    return _token;
  }

  int get userId{
    return _userId;
  }


  Future<int> login(String identification_number , String password) async {
    String url = 'http://192.168.153.1/hospital-api/public/api/login';

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
        //final prefs =await SharedPreferences.getInstance();
        //prefs.setInt('userId',_userId);
        //prefs.setString('token', _token);
        notifyListeners();
        return 0;
      }
      return 2;
    }

  }
}