import 'package:shared_preferences/shared_preferences.dart';

class PrefServices{
  SharedPreferences prefs;


  static Future<String> prefget(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String apiToken =  sharedPreferences.get('api_token');
    return apiToken;
  }

  static prefClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


}