import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;

class DeleteCartItemAPI{

  Future<void> deleteCartItems(int cartId) async{
    final urls = APIConstants.url + APIConstants.deleteCartItem + cartId.toString();
    var response = await http.delete(Uri.parse(urls));
    var body = json.decode(response.body);
    if(response.statusCode==200){
      print('deleted');
    }
  }
}