import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pet_station/screens/favorite.dart';

class DeleteFavoriteItemAPI{

  static Future<void> deleteFavoriteItems(BuildContext context, int favId) async {
    final urls = APIConstants.url + APIConstants.deleteFavoriteItem + favId.toString();
    print('urls----- ${urls}');
    var response = await http.delete(Uri.parse(urls));

    if (response.statusCode == 200) {
      // Successful response, handle accordingly
      print('deleted');
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
    } else {
      // Handle non-200 status codes (e.g., 404, 500) or unexpected response data
      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
      // You can display an error message or take appropriate action here
    }
  }

}