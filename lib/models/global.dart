import 'package:shared_preferences/shared_preferences.dart';



setDataLocaly(String key, String value) async {

  SharedPreferences _setData = await SharedPreferences.getInstance();
  _setData.setString(key, value);
}


Future<String> getDataLocaly(String key) async {

  SharedPreferences _getData = await SharedPreferences.getInstance();
  String? data = _getData.getString(key);

  return data!;
}


remvoveDataLocaly(String key) async {

  SharedPreferences _removeData = await SharedPreferences.getInstance();
  _removeData.remove(key);
}


clearDataLocaly() async {

  SharedPreferences _clearData = await SharedPreferences.getInstance();
  _clearData.clear();
}