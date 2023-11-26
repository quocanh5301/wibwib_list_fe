import 'dart:convert';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void saveUserToSharedPreferences(UserDataModel user) async {
  final SharedPreferences prefs = await _prefs;

  try {
    // Convert the User object to a JSON string
    String userJson = jsonEncode(user.toJson());

    // Save the JSON string in shared preferences
    prefs.setString('user', userJson);
  } catch (e) {
    print(e);
  }
}

Future<UserDataModel?> getUserFromSharedPreferences() async {
  final SharedPreferences prefs = await _prefs;
  try {
    // Retrieve the JSON string from shared preferences
    String? userJson = prefs.getString('user');

    if (userJson != null) {
      // Parse the JSON string and create a User object
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserDataModel.fromJson(userMap);
    }
  } catch (e) {
    return null;
  }
  return null;
}
