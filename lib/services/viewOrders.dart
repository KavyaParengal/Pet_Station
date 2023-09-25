import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/orderItems.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ViewOrderItems{
  Future<List<OrderData>> getOrderItems() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.viewOrder + userId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<OrderData> data =  body['data'].map<OrderData>((e) => OrderData.fromJson(e)).toList();
      return data;

    } else {
      List<OrderData> data = [];
      return data;
    }
  }
}