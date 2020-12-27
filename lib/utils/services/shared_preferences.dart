import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService{

    static const token = "token";
  //Store string
  static Future<bool>setStringData({String key, String value})async{
    SharedPreferences sharedPrefer = await SharedPreferences.getInstance();
    return sharedPrefer.setString(key, value);
  }

  //Reuse sotre string
  static Future<String>getStringData({String key})async{
    SharedPreferences sharedPrefer = await SharedPreferences.getInstance();
    String tokenString = sharedPrefer.get(key);
    return tokenString;
  }
}