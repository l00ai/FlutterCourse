import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {

  static final _instance = MySharedPref._internal();

  // Obtain shared preferences.
  late SharedPreferences prefs ;

  MySharedPref._internal();

  factory MySharedPref() {

    return _instance;
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String userNameKey = "user_name";


  Future<void> setUserName(String name) async {
    await prefs.setString(userNameKey, name);
  }

  setUserAge(int age) async {
    await prefs.setInt('user_age', age);
  }


  String getUserName() {
    return prefs.getString(userNameKey) ?? "UnKnown";
  }

  // String? getUserName() {
  //   return prefs.getString(userNameKey);
  // }

   int? get name => prefs.getInt('user_age');

  int? getUserAge() {
    return prefs.getInt('user_age');
  }

  removeUserName() async {
    await prefs.remove(userNameKey);
  }



}