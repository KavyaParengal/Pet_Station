import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/favoriteItemModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ViewFavoriteItems{
  Future<List<FavoriteData>> getFavoriteItems() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.viewFavoriteItem + userId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<FavoriteData> data =  body['data'].map<FavoriteData>((e) => FavoriteData.fromJson(e)).toList();
      return data;

    } else {
      List<FavoriteData> data = [];
      return data;
    }
  }
}