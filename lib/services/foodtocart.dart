import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodToCart{
  static Future<void> foodToCart({required BuildContext context,required int foodId}) async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    int userId = (localstorage.getInt('user_id') ?? 0 ) ;
    var datas = {
      "user": userId.toString(),
      "item": foodId.toString(),
      "quantity": "1",
    };
    print(datas);
    try {
      var response = await Api().authData(datas,APIConstants.foodTOCart);
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
    throw 'Unexpected error occurred';
  }
}