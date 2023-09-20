import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteItemAPI{

  static Future<void> FavoriteItem({required BuildContext context, required int productId}) async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    int userId = (localstorage.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.favoriteItem;
    var datas = {
      "user": userId.toString(),
      "item": productId.toString(),
    };
    print(datas);
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