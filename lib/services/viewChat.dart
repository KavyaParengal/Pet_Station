import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/chat.dart';

class ViewChatAPI {
  Future<List<Data>> getChatdetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.viewChat + userId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Data> data =  body['data'].map<Data>((e) => Data.fromJson(e)).toList();
      print(data);
      return data;

    } else {
      List<Data> data = [];
      return data;
    }
  }
}