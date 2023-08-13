
import 'package:flutter/material.dart';
import 'package:pet_station/design/home_page.dart';
import 'package:pet_station/design/sign_up.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.yellow, Colors.green],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'EBGaramond',),),
                  SizedBox(height: 8,),
                  Text("Welcome Back !",style: TextStyle(fontSize: 18.5,color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, 3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email or User Name",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        TextButton(child: Text('Forgot Password?',style: TextStyle(color: Colors.grey.shade600),),
                          onPressed: (){},
                        ),
                        SizedBox(height: 25,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10,),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.red, Colors.yellow, Colors.green],
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Page()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account?",style: TextStyle(color: Colors.grey),),
                            TextButton(child: Text('Sign UP',style: TextStyle(color: Colors.grey.shade600),),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up()));
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
