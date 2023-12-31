
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_station/screens/login_page.dart';
import 'package:pet_station/services/apiService.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  bool passwordVisible=false;
  TextEditingController fullnameController=TextEditingController();
  TextEditingController contactController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController unameController=TextEditingController();
  TextEditingController pwdController=TextEditingController();

  bool _isLoading=false;

  void registerUser()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "fullnameController": fullnameController.text.trim(),
      "phoneController": contactController.text.trim(),
      "emailController": emailController.text.trim(),
      "usernmController": unameController.text.trim(),
      "pwdController": pwdController.text.trim(),
    };
    var res = await Api().authData(data,'/api/user_register');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,

      );

    }
  }

  final _formKey = GlobalKey<FormState>();
  FocusNode fullnameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    fullnameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade800
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign UP",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'EBGaramond',color: Colors.white),),
                  SizedBox(height: 8,),
                  Text("Create a free account here !",style: TextStyle(fontSize: 18.5,color: Colors.white),),
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
                        SizedBox(height: 40,),
                        Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Colors.teal.shade800,
                                  blurRadius: 15,
                                  offset: Offset(0, 7)
                              )]
                          ),
                          child: Form(
                            key: _formKey,
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
                                    focusNode: fullnameFocusNode,
                                    onFieldSubmitted: (term) {
                                      FocusScope.of(context).requestFocus(phoneFocusNode);
                                    },
                                    controller: fullnameController,
                                    decoration: InputDecoration(
                                        hintText: "Full Name",
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
                                      if (value.length != 10) {
                                        return 'Mobile Number must be of 10 digit';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    focusNode: phoneFocusNode,
                                    onFieldSubmitted: (term) {
                                      FocusScope.of(context).requestFocus(emailFocusNode);
                                    },
                                    controller: contactController,
                                    decoration: InputDecoration(
                                        hintText: "Phone Number",
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
                                        return 'Please enter your email address';
                                      }
                                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: emailFocusNode,
                                    onFieldSubmitted: (term) {
                                      FocusScope.of(context).requestFocus(usernameFocusNode);
                                    },
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Email",
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
                                      return null;
                                    },
                                    focusNode: usernameFocusNode,
                                    onFieldSubmitted: (term) {
                                      FocusScope.of(context).requestFocus(passwordFocusNode);
                                    },
                                    controller: unameController,
                                    decoration: InputDecoration(
                                        hintText: "Username",
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
                                    focusNode: passwordFocusNode,
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
                        SizedBox(height: 60,),
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
                              child: Text('Sign UP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                              onPressed: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
                                if (_formKey.currentState!.validate()) {
                                  registerUser();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an Account?",style: TextStyle(color: Colors.grey,fontSize: 16),),
                            TextButton(child: Text('Login',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
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
