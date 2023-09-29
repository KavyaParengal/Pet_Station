import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;

class DeleteFavoriteItemInHomePage {
  static Future<void> deleteFavoriteItemInHomePage(BuildContext context, int itemId) async {
    final urls = APIConstants.url + APIConstants.deleteFavoriteItemInHomePage + itemId.toString();
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