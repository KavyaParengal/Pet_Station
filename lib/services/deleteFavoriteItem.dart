import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pet_station/design/favorite.dart';

class DeleteFavoriteItemAPI{

  static Future<void> deleteFavoriteItems(BuildContext context,int favId) async{
    final urls = APIConstants.url + APIConstants.deleteFavoriteItem + favId.toString();
    var response = await http.delete(Uri.parse(urls));
    var body = json.decode(response.body);
    if(response.statusCode==200){
      print('deleted');
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
    }
  }
}