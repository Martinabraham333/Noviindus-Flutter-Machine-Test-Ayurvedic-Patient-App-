import 'dart:convert';

import 'package:ayurvedic_centre_patients/core/api_client.dart';
import 'package:ayurvedic_centre_patients/core/app_strings.dart';
import 'package:ayurvedic_centre_patients/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiClient client;
  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String username, String password) async {
    final response = await client.post('Login', {
      "username": username,
      "password": password,
    });

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    
      if (jsonData["status"] == true) {
        AppStrings.tocken = jsonData["token"];
        return UserModel.fromJson(jsonData["user_details"]);
      } else {
        throw Exception(jsonData["message"]);
      }
    } else {
      throw Exception("Failed to login: ${response.statusCode}");
    }
  }
}
