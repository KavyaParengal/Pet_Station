
import 'package:flutter/material.dart';
import 'package:pet_station/design/changeAddress.dart';
import 'package:pet_station/design/drawer.dart';
import 'package:pet_station/design/home_page.dart';
import 'package:pet_station/design/login_page.dart';
import 'package:pet_station/design/orderConfirmation.dart';
import 'package:pet_station/design/searchResult.dart';
import 'package:pet_station/design/splash.dart';
import 'package:pet_station/design/start_page.dart';
import 'package:provider/provider.dart';

import 'provider/fav_provider.dart';

void main(){
  runApp(
      ChangeNotifierProvider(
        create: (context) => FavProvider_class(),
        child: MaterialApp(
          home: SplashScreen(),
          //home: FoodScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
        ),
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
