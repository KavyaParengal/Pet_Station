import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;

class RatePetsAPI {
  static Future<void> ratePets(BuildContext context,int petId, double rate) async {
    try{
      final urls=APIConstants.url + APIConstants.ratePets + petId.toString();
      print(urls);
      var data = {
        "rate" : rate.toString()
      };
      print('data = $data');
      var response = await http.put(Uri.parse(urls),body: data);
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
    catch(e){
      throw e.toString();
    }
  }
}