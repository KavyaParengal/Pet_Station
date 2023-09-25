import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/foodModel.dart';
import 'package:http/http.dart' as http;

class ViewSingleFoodData{
  static Future<ViewFoodModel> getFoodDetails(int foodId) async {
    final urls = APIConstants.url + APIConstants.viewSingleFood + foodId.toString();
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ViewFoodModel.fromJson(body['data']);
    } else {
      throw Exception('Failed to load food details');
    }
  }
}