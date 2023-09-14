import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/orderAddress.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ViewOrderAddress{

  Future<List<Data>> getOrderAddress() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.viewOrderAddress + userId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Data> data =  body['data'].map<Data>((e) => Data.fromJson(e)).toList();
      return data;

    } else {
      List<Data> data = [];
      return data;
    }
  }

}