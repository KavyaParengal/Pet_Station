
import 'package:flutter/material.dart';
import 'package:pet_station/design/drawer.dart';
import 'package:pet_station/design/home_page.dart';
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
