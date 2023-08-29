import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/viewCategory.dart';

class ViewCategoryApi{

  Future<List<ViewCategoryModel>> getCategories() async{
    final urls=APIConstants.url + APIConstants.viewCategoty;
    print(urls);
    var response=await http.get(Uri.parse(urls));
    if(response.statusCode==200){
      var body=json.decode(response.body);
      print(body);
      List<ViewCategoryModel> _data=List<ViewCategoryModel>.from(
          body['data'].map((e)=>ViewCategoryModel.fromJson(e)).toList());
      return _data;
    }
    else{
      List<ViewCategoryModel> _data=[];
      return _data;
    }
  }
}