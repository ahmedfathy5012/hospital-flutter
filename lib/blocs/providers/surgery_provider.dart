import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Surgery.dart';
import '../models/thing_extension.dart';

import '../../helpers/api_helper.dart';

class SurgeryProvider extends ApiHelper with ChangeNotifier{
  Map<String,String> headers = {
    'Accept': 'application/json',
  };

  Surgery _surgery ;
  Surgery get surgery{
    return _surgery;
  }
  Future<bool> fetchAndSetSurgery(int id) async {
    final response = await http.get(FETCH_SURGERY_URL(id),headers:await getHeaders());
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _surgery = Surgery.fromJson(extractedData['data']);
    print(_surgery.id);
    notifyListeners();
    if(response.statusCode==200)
      return true;
    return false;
  }


  Future<Surgery> updateSurgery(int id , Surgery surgery) async {
    Map<String,dynamic> body = {
      'anesthesiologist_id' : surgery.anesthesiologist_id.toString(),
      'surgeon_id': surgery.surgeon_id.toString(),
      'patient_id' : surgery.patient_id.toString(),
      'anesthetic_id' : surgery.anesthetic_id.toString(),
      'name_of_surgery' : surgery.name_of_surgery,
      'date_of_surgery' : surgery.date_of_surgery,
    };

    final response = await http.post(UPDATE_SURGERY_URL(id),headers:await getHeaders(),
        body:  body
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    _surgery = Surgery.fromJson(extractedData['data']);
    notifyListeners();
  }


  Future<http.Response> addSurgery(int id , Surgery surgery) async {

    Map<String,dynamic> body = {
      'anesthesiologist_id' : surgery.anesthesiologist_id.toString(),
      'surgeon_id': surgery.surgeon_id.toString(),
      'patient_id' : surgery.patient_id.toString(),
      'anesthetic_id' : surgery.anesthetic_id.toString(),
      'name_of_surgery' : surgery.name_of_surgery,
      'date_of_surgery' : surgery.date_of_surgery,
    };



    final response = await http.post(ADD_SURGERY_URL,headers:await getHeaders(),
    body:  body
    );
    //if(json.decode(response.body).message.contains('users_identification_number_unique'))
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print('${response.statusCode}');
    notifyListeners();
    return response;
  }





  String _searchText = '';
  void setSearchText(String text){
    _searchText=text;
    notifyListeners();
  }
  List<ThingsExtension> searchList = [];


  List<ThingsExtension> _surgeries = [];

  List<ThingsExtension> get surgeries{
    return [..._surgeries];
  }

  Future<bool> fetchAndSetSurgeries() async {

    if(_searchText.isNotEmpty){
      _surgeries.clear();
      searchList.forEach((item){
        if(item.patient_full_name.contains(_searchText)) {
          _surgeries.add(item);
        }
      });
      notifyListeners();

    }else{
      http.Response response = await http.get(FETCH_SURERIES_URL,headers:await getHeaders());
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ThingsExtension> loadedProducts = [];
      for (var item in extractedData['data']){
        loadedProducts.add(
            ThingsExtension.fromJson(item)
        );
      }

      _surgeries=loadedProducts;
      searchList.clear();
      searchList.addAll(loadedProducts);
      notifyListeners();

      if(response.statusCode==200)
        return true;
      return false;
    }

  }

}