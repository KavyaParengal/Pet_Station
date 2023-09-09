import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/viewCategoryItems.dart';
import 'package:pet_station/services/apiService.dart';

class SearchItem{

  Future<ViewCategoryItemsModel> searchItems(BuildContext context, String text) async {
    var data = {
      "breed": text,
    };
    print(data);
    try {
      var response = await Api().authData(data,APIConstants.searchItem);
      var body = json.decode(response.body);
      print("body$body");
      if (body['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
        return ViewCategoryItemsModel.fromJson(jsonDecode(response.body));
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