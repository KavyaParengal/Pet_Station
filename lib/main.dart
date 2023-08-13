
import 'package:flutter/material.dart';
import 'package:pet_station/design/login_page.dart';
import 'package:pet_station/design/start_page.dart';

void main(){
  runApp(
      MaterialApp(
        home: Start_Page(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
      )
  );
}