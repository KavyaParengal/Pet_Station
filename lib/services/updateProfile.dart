
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pet_station/main.dart';
import 'package:pet_station/models/userregister.dart';
import 'package:pet_station/services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfile{

  Future<UserRegisterModel> updateProfile(BuildContext context, String name, String phoneNum, String email) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('login_id') ?? 0 ) ;

    var userData= {
      "fullnameController": name,
      "phoneController": phoneNum,
      "emailController":email,
    };

    try{
      var response = await Api().putData(userData, APIConstants.updateProfile+userId.toString());
      var body = json.decode(response.body);
      if(body['success'] == true){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message'],),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        return UserRegisterModel.fromJson(jsonDecode(response.body));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    }
  catch (e) {
    throw e.toString();
  }
  throw 'Unexpected error occurred';
  }
}