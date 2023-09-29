import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_station/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PaymentAPI{

  static Future<void> payment(BuildContext context,String amount) async {

    String datetime1='';
    DateTime datetime = DateTime.now();
    datetime1 = DateFormat("yyyy-MM-dd").format(datetime);

    SharedPreferences localstorage = await SharedPreferences.getInstance();
    int userId = (localstorage.getInt('user_id') ?? 0 ) ;
    try{
      var data={
        "user": userId.toString(),
        "date": datetime1,
        "amount":amount
      };
      print(data);
      final urls = APIConstants.url + APIConstants.payment;
      print(urls);
      var response = await http.post(Uri.parse(urls),body: data);
      var body = json.decode(response.body);
      if (response.statusCode==201) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text(body['message']),
        //     ));
        print('hau');
      }
      else {
        print('error');
      }
    }
    catch(e){
      throw e.toString();
    }
  }

}