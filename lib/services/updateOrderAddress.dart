
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/changeAddress.dart';
import 'package:pet_station/models/orderAddress.dart';
import 'package:pet_station/services/apiService.dart';

class UpdateOrderAddressAPI{

  Future<Data> updateOrderAddress(BuildContext context, int OId,String name, String contact, String pincode,String city,String state,String area,String buildingName,String landmark,String addressType) async{

    var userData= {
      "name": name,
      "contact": contact,
      "pincode":pincode,
      "city": city,
      "state": state,
      "area": area,
      "buildingName": buildingName,
      "landmark": landmark,
      "addressType": addressType,
    };

    try{
      var response = await Api().putData(userData, APIConstants.updateOrderAddress+OId.toString());
      var body = json.decode(response.body);
      if(body['success'] == true){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message'],),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeAddress()));
        return Data.fromJson(jsonDecode(response.body));
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