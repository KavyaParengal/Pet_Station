import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pet_station/models/addtoCart.dart';

class CartQuantityIncrementAPI{

  Future<void> cartQutyIncre(int pId) async{
    final urls = APIConstants.url + APIConstants.quantityIncrement + pId.toString();
    print(urls);
    var response = await http.put(Uri.parse(urls));
    var body = json.decode(response.body);
    if(response.statusCode==200){
      print('object');
    }
  }
}