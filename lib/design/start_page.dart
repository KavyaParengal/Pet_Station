
import 'package:flutter/material.dart';
import 'package:pet_station/design/login_page.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({Key? key}) : super(key: key);

  @override
  State<Start_Page> createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.yellow, Colors.green],
          ),
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
                  new Image.asset(
                    "images/pets.png",
                   width: MediaQuery.of(context).size.width*3,
                    height: MediaQuery.of(context).size.height*.45,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10,),
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.yellow, Colors.green],
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        child: Text("Let's Start",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
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
