import 'dart:convert';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void saveUserToSharedPreferences(UserDataModel user) async {
  final SharedPreferences prefs = await _prefs;

  try {
    // Convert the User object to a JSON string
    print("user.toJson() ${user.toJson()}");
    String userJson = user.toJson();
    print("set userJson $userJson");

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
    print("get userJson $userJson");
    print("jsonDecode ${jsonDecode(userJson)}");
    // Parse the JSON string and create a User object
    Map<String, dynamic> userMap = jsonDecode(userJson);
    print("userMap $userMap");
    return UserDataModel.fromJson(userMap);
    } catch (e) {
    print(e);
    return null;
  }
  return null;
}

Future<void> updateImageInSharedPreferences(String newImageUrl) async {
  final SharedPreferences prefs = await _prefs;

  try {
    // Retrieve the current UserDataModel from SharedPreferences
    UserDataModel? currentUser = await getUserFromSharedPreferences();

    if (currentUser != null) {
      // Update the image property
      currentUser.image = newImageUrl;

      // Convert the updated UserDataModel to a JSON string
      String updatedUserJson = currentUser.toJson();

      // Save the updated JSON string in SharedPreferences
      prefs.setString('user', updatedUserJson);
    } else {
      print("No user data saved");
    }
  } catch (e) {
    print(e);
  }
}

Future<void> deleteUserFromSharedPreferences() async {
  final SharedPreferences prefs = await _prefs;

  try {
    // Remove the 'user' key from SharedPreferences
    await prefs.remove('user');
  } catch (e) {
    print(e);
  }
}
