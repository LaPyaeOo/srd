import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService{


  //Store string
  Future<bool>setStringData({String key, String value})async{
    SharedPreferences sharedPrefer = await SharedPreferences.getInstance();
    return sharedPrefer.setString(key, value);
  }

  //Reuse sotre string
  Future<String>getStringData({String key})async{
    SharedPreferences sharedPrefer = await SharedPreferences.getInstance();
    return sharedPrefer.get(key);
  }
}