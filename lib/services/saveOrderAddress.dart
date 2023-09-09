import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/orderConfirmation.dart';
import 'package:pet_station/models/orderAddress.dart';
import 'package:pet_station/services/apiService.dart';

class SaveOrderAddress{
  Future <OrderAddress> saveOrderAddress (
      BuildContext context,
      int uid,
      String pincode,
      String city,
      String state,
      String area,
      String buildingName,
      String landmark,
      String addressType
  ) async {
    var urls = Uri.parse('${APIConstants.url + APIConstants.saveOrderAddress}');
    print(urls);
    var orderaddress= {
      "user": uid,
      "pincode": pincode,
      "city":city,
      "state": state,
      "area": area,
      "buildingName":buildingName,
      "landmark": landmark,
      "addressType":addressType,
    };
    try {
      var response = await Api().authData(orderaddress,APIConstants.saveOrderAddress);
      var body = json.decode(response.body);
      print("body$body");
      if (body['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderConfirmation()));
        return OrderAddress.fromJson(jsonDecode(response.body));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    }
    catch (e) {
      throw e.toString();
    }
    throw 'Unexpected error occurred';
  }
}