
import 'package:flutter/material.dart';
import 'package:pet_station/screens/drawer.dart';
import 'package:pet_station/screens/home_page.dart';
import 'package:pet_station/screens/splash.dart';


void main(){
  runApp(
      MaterialApp(
          home: SplashScreen(),
          //home: FoodScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
        ),
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
