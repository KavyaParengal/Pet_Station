import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:http/http.dart' as http;

import '../models/orderAddress.dart';

class viewSingleOrderAddressAPI{
  Future<Data> SingleOrderAddressAPI(int OrderId) async {
    final urls = APIConstants.url + APIConstants.viewSingleOrderAddress + OrderId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return Data.fromJson(body['data']);
    }
    else {
      throw Exception('Failed to load user details');
    }
  }
}