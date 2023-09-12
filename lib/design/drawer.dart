
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_station/design/cartScreen.dart';
import 'package:pet_station/design/favorite.dart';
import 'package:pet_station/design/message.dart';
import 'package:pet_station/design/login_page.dart';
import 'package:pet_station/design/myOrder.dart';
import 'package:pet_station/design/profile.dart';
import 'package:pet_station/models/userregister.dart';
import 'package:pet_station/services/updateProfile.dart';
import 'package:pet_station/services/viewProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  List<Map> drawerItem=[
    {'icon':FontAwesomeIcons.bucket,'title':'My orders'},
    {'icon':Icons.favorite,'title':'Favorites'},
    {'icon':Icons.shopping_cart,'title':'My cart'},
    {'icon':Icons.person,'title':'Profile'},
    {'icon':Icons.message,'title':'Message'},
    {'icon':FontAwesomeIcons.language,'title':'Select language'}
  ];

  late SharedPreferences prefs;
  late int outid;
  UserRegisterModel? userDetails;
  String name='';

  UpdateProfile updateUserProfile = UpdateProfile();

  void getoutId()async {
    prefs = await SharedPreferences.getInstance();
    outid = (prefs.getInt('login_id') ?? 0 ) ;
    print('Outsider id ${outid}');

    fetchUserDetails(outid);
  }

  Future<UserRegisterModel?> fetchUserDetails(int uId) async {
    try {
      final details = await ViewProfileAPI().getViewProfile(uId);
      userDetails=details;
      setState(() {
        name =  userDetails!.fullnameController;
        print(name);

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
        padding: EdgeInsets.only(top: 60,bottom: 40,left: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.teal.shade800
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 26,
                  child: Image.asset('images/parrot.png'),
                ),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kavya',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: Colors.white),),
                    Text('Active status',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),),
                  ],
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrder()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                       children: [
                         Icon(Icons.check_box,color: Colors.white,size: 30,),
                         SizedBox(width: 12,),
                         Text('My order',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                       ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.white,size: 30,),
                        SizedBox(width: 12,),
                        Text('Favorite',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart,color: Colors.white,size: 30,),
                        SizedBox(width: 12,),
                        Text('My cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.person,color: Colors.white,size: 30,),
                        SizedBox(width: 12,),
                        Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.message,color: Colors.white,size: 30,),
                        SizedBox(width: 12,),
                        Text('Message',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Icon(Icons.settings,color: Colors.white,size: 32,),
                SizedBox(width: 12,),
                TextButton(
                    child: Text('Settings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                  onPressed: (){},
                ),
                SizedBox(width: 12,),
                Container(
                  height: 20,
                  width: 2,
                  color: Colors.white,
                ),
                SizedBox(width: 12,),
                TextButton(
                  child: Text('Logout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
