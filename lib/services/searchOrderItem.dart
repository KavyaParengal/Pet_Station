

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/orderItems.dart';
import 'package:pet_station/services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SearchOrderItem{

  static Future<void> searchOrderItems(BuildContext context, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('user_id') ?? 0 ) ;
    var data = {
      "search": text,
    };
    try {
      final urls = APIConstants.url + APIConstants.searchOrderItem + userId.toString();
      var response = await http.post(Uri.parse(urls),body: data);
      var body = json.decode(response.body);
      if (body['success'] == true) {
        List _data=body['data'];
        var items=_data.map((e) => OrderData.fromJson(e)).toList();
        print(items);
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