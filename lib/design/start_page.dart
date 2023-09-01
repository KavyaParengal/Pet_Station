
import 'package:flutter/material.dart';
import 'package:pet_station/design/login_page.dart';
import 'package:pet_station/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({Key? key}) : super(key: key);

  @override
  State<Start_Page> createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {

  late SharedPreferences localStorage;
  String user="user";
  String role="";
  late SharedPreferences preferences;

  Future<void> checkRoleAndNavigate() async {
    preferences = await SharedPreferences.getInstance();
    role = (preferences.getString("role") ?? '');

    if (role == user) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Login_Page()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade800
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 16,bottom: 16),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Meet your favorite pets \nand their food here !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //letterSpacing: 2,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'EBGaramond',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*1,
                    height: MediaQuery.of(context).size.height*.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/pets.png"),fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10,),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 0.9,
                          offset: Offset(4, 4),
                        )
                      ]
                    ),
                    child: Center(
                      child: TextButton(
                        child: Text("Let's Start",style: TextStyle(color: Colors.teal.shade800,fontWeight: FontWeight.w800,fontSize: 18),),
                        onPressed: (){
                          checkRoleAndNavigate();
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
