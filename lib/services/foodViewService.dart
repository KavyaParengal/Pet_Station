import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/foodModel.dart';
import 'package:http/http.dart' as http;

class FoodViewAPI{
  static Future<List<ViewFoodModel>> getFoodItems(int id) async{
    //bool itemload=true;
    // setState(() {
    //   itemload=true;
    // });
    final urls=APIConstants.url + APIConstants.viewfoods + id.toString();
    var response=await http.get(Uri.parse(urls));
    if(response.statusCode==200){
      var body=json.decode(response.body);
      List<ViewFoodModel> _fooddata =List<ViewFoodModel>.from(
          body['data'].map((e)=>ViewFoodModel.fromJson(e)).toList());
      // setState(() {
      //itemload=false;
      // });
      print('========${_fooddata}');
      return _fooddata;
    }
    else{
      //itemload=false;
      List<ViewFoodModel> _fooddata=[];
      return _fooddata;
    }
  }
}