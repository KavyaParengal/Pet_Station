import 'dart:convert';

import 'package:pet_station/config/constants.dart';
import 'package:pet_station/models/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ViewNotificationAPI{
  static Future<List<NotificationModel>> getNotifications() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('user_id') ?? 0 ) ;
    final urls = APIConstants.url + APIConstants.viewNotification + userId.toString();
    print(urls);
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<NotificationModel> data =  body['data'].map<NotificationModel>((e) => NotificationModel.fromJson(e)).toList();
      print(data);
      return data;

    } else {
      List<NotificationModel> data = [];
      return data;
    }
  }
}