import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FavoriteFoodItemAPI{

  static Future<void> favoriteFoodItem({required BuildContext context, required int foodId}) async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    int userId = (localstorage.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.favoriteFoodItem;
    var datas = {
      "user": userId.toString(),
      "item": foodId.toString(),
    };
    try {
      var response = await http.post(Uri.parse(urls), body: datas);
      var body = json.decode(response.body);
      if (body['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
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
  }

}