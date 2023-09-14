import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/cartScreen.dart';
import 'package:pet_station/models/addtoCart.dart';
import 'package:pet_station/models/viewCategory.dart';
import 'package:pet_station/models/viewCategoryItems.dart';
import 'package:pet_station/services/apiService.dart';

class ViewCategoryApi {

  // Future<List<ViewCategoryModel>> getCategories() async {
  //   final urls = APIConstants.url + APIConstants.viewCategoty;
  //   print(urls);
  //   var response = await http.get(Uri.parse(urls));
  //   if (response.statusCode == 200) {
  //     var body = json.decode(response.body);
  //     print(body);
  //     List<ViewCategoryModel> _data = List<ViewCategoryModel>.from(
  //         body['data'].map((e) => ViewCategoryModel.fromJson(e)).toList());
  //     return _data;
  //   }
  //   else {
  //     List<ViewCategoryModel> _data = [];
  //     return _data;
  //   }
  // }

  // Future<List<ViewCategoryItemsModel>> getCategoryItems(int id) async{
  //   final urls=APIConstants.url + APIConstants.viewItemInSingleCategory + id.toString();
  //   print(urls);
  //   var response=await http.get(Uri.parse(urls));
  //   if(response.statusCode==200){
  //     var body=json.decode(response.body);
  //     print("items ${body}");
  //     List<ViewCategoryItemsModel> _data=List<ViewCategoryItemsModel>.from(
  //         body['data'].map((e)=>ViewCategoryItemsModel.fromJson(e)).toList());
  //     return _data;
  //   }
  //   else{
  //     List<ViewCategoryItemsModel> _data=[];
  //     return _data;
  //   }
  // }

  static Future<ViewCategoryItemsModel> getPetDetails(int id) async {
    final urls = APIConstants.url + APIConstants.viewSinglePetDetails +
        id.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ViewCategoryItemsModel.fromJson(body['data']);
    } else {
      throw Exception('Failed to load pet details');
    }
  }

  static Future<ViewCategoryItemsModel> getAllPetDetails() async {
    final urls = APIConstants.url + APIConstants.viewAllPetDetails;
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ViewCategoryItemsModel.fromJson(body['data']);
    } else {
      throw Exception('Failed to load pet details');
    }
  }

  Future<AddtoCartModel> addtoCart({required BuildContext context, required int userId, required int productId}) async {
    var urls = Uri.parse('${APIConstants.url + APIConstants.addtoCartItem}');
    var datas = {

      "user": userId.toString(),
      "item": productId.toString(),
      "quantity": "1",
    };
    try {
      var response = await Api().authData(datas,APIConstants.addtoCartItem);
      var body = json.decode(response.body);
      if (body['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
        return AddtoCartModel.fromJson(jsonDecode(response.body));
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

  static Future<List<Data>> getSinglecartItems(int userId) async{
    final urls = APIConstants.url + APIConstants.cartItemsview + userId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<Data> data =  body['data'].map<Data>((e) => Data.fromJson(e)).toList();
      return data;

    } else {
      List<Data> data = [];
      return data;
    }
  }
}