
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/home_page.dart';
import 'package:pet_station/main.dart';
import 'package:pet_station/models/userregister.dart';
import 'package:pet_station/services/updateProfile.dart';
import 'package:pet_station/services/viewProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late SharedPreferences prefs;
  late int outid;
  UserRegisterModel? userDetails;
  TextEditingController fullnameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController contactController=TextEditingController();
  String name='';
  String email='';
  String contact='';

  UpdateProfile updateUserProfile = UpdateProfile();

  void getoutId()async {
    prefs = await SharedPreferences.getInstance();
    outid = (prefs.getInt('user_id') ?? 0 ) ;

    print('Outsider id ${outid}');

    fetchUserDetails(outid);
  }

  Future<UserRegisterModel?> fetchUserDetails(int uId) async {
    try {
      final details = await ViewProfileAPI().getViewProfile(uId);
      userDetails=details;
      setState(() {
        name =  userDetails!.fullnameController;
        email = userDetails!.emailController;
        contact = userDetails!.phoneController;
        print(name);
        fullnameController.text = name!;
        emailController.text= email!;
        contactController.text= contact!;

      });
    }
    catch(e){
      // Handle errors here, e.g., show an error message
      print('Failed to fetch user details: $e');
      return null; // Return null in case of an error
    }
  }



  @override
  void initState() {
    super.initState();
    // Fetch the user details when the widget initializes
    getoutId();
  }

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 80,),
            Container(
              margin: EdgeInsets.only(top: 45,left: 8),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios,size: 28,color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('Edit Profile',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.white
                    ),),
                  )
                ],
              ),
            ),
            userDetails != null ?  Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 43,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal.shade800,
                  child: Text(userDetails!.fullnameController[0],style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 41,
                      color: Colors.white
                  ),),
                ),
              )
            ) : Center(child: CircularProgressIndicator(),),
            SizedBox(height: 16,),
            userDetails != null ? Expanded(
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
                        SizedBox(height: 70,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.teal.shade800,
                                  blurRadius: 16,
                                  offset: Offset(2, 7)
                              )]
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey.shade700
                                    ),),
                                    TextField(
                                      controller: fullnameController,
                                      decoration: InputDecoration(
                                          hintText: "${name}",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone Number',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey.shade700
                                    ),),
                                    TextField(
                                      controller: contactController,
                                      decoration: InputDecoration(
                                          hintText: "${contact}",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey.shade700
                                    ),),
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          hintText: "${email}",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 65,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10,),
                              color: Colors.teal.shade800,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 2,
                                  offset: Offset(4,4),
                                  spreadRadius: 1
                              )]
                          ),
                          child: Center(
                            child: TextButton(
                              child: Text('Edit Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                              onPressed: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                updateUserProfile.updateProfile(context, fullnameController.text, contactController.text, emailController.text);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ) : Center(child: CircularProgressIndicator(),),
          ],
        ),
      ),
    );
  }
}
