import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/searchResult.dart';
import 'package:pet_station/models/viewCategoryItems.dart';
import 'package:pet_station/services/apiService.dart';

class SearchItem{

  static Future<void> searchItems(BuildContext context, String text) async {
    var data = {
      "search": text,
    };

    try {
      var response = await Api().authData(data,APIConstants.searchItem);
      print("response$response");
      var body = json.decode(response.body);
      print("body---$body");
      if (body['success'] == true) {
        List _data=body['data'];
        var items=_data.map((e) => ViewCategoryItemsModel.fromJson(e)).toList();
        print(items);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResult(items:items)));

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