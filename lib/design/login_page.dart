
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_station/design/home_page.dart';
import 'package:pet_station/design/sign_up.dart';
import 'package:pet_station/main.dart';
import 'package:pet_station/services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  TextEditingController unameController=TextEditingController();
  TextEditingController pwdController=TextEditingController();

  bool passwordVisible=false;

  late SharedPreferences localStorage;

  bool _isLoading = false;
  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'usernmController': unameController.text.trim(), //username for email
      'pwdController': pwdController.text.trim()
    };
    print("data${data}");
    var res = await Api().authData(data,'/api/login_users');
    var body = json.decode(res.body);
    if (body['success'] == true) {

      localStorage = await SharedPreferences.getInstance();
      localStorage.setInt('login_id', body['data']['login_id']);
      localStorage.setInt('user_id', body['data']['user_id']);
      localStorage.setString('role', body['data']['role']);

      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

    }else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.teal.shade800
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 60,),
                          Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                color: Colors.teal.shade800,
                                blurRadius: 16,
                                offset: Offset(0, 7)
                              )]
                            ),
                            child: Form(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                      controller: unameController,
                                      decoration: InputDecoration(
                                        hintText: "User Name",
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
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        if (value.trim().length < 6) {
                                          return 'Password must be at least 6 characters in length';
                                        }
                                        return null;
                                      },
                                      controller: pwdController,
                                      obscureText: passwordVisible,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,color: Colors.teal.shade800,),
                                            onPressed: () {
                                              setState(
                                                    () {
                                                  passwordVisible = !passwordVisible;
                                                },
                                              );
                                            },
                                          ),
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          TextButton(child: Text('Forgot Password?',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                            onPressed: (){},
                          ),
                          SizedBox(height: 25,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10,),
                              color: Colors.teal.shade800,
                                boxShadow: [BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 2,
                                    offset: Offset(4,4),
                                  spreadRadius: 1
                                )]
                            ),
                            child: Center(
                              child: TextButton(
                                child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                onPressed: (){
                                  if (_formKey.currentState!.validate()) {
                                    _pressLoginButton();
                                  }
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an Account?",style: TextStyle(fontSize: 16,color: Colors.grey),),
                              TextButton(child: Text('Sign UP',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
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
            ),
          ],
        ),
      ),
    );
  }
}
