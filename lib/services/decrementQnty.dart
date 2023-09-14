import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;

class CartQuantityDecrementAPI{

  Future<void> cartQutyDecre(int pId) async{
    final urls = APIConstants.url + APIConstants.quantityDecrement + pId.toString();
    var response = await http.put(Uri.parse(urls));
    var body = json.decode(response.body);
    if(response.statusCode==200){
      print('decrement');
    }
  }
}