
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_station/design/message.dart';
import 'package:pet_station/design/login_page.dart';
import 'package:pet_station/design/profile.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60,bottom: 40,left: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.yellow, Colors.green]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(310, 189, 89, 0.4),
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
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                       children: [
                         Icon(Icons.check_box,color: Colors.white,size: 32,),
                         SizedBox(width: 12,),
                         Text('My order',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
                       ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.white,size: 32,),
                        SizedBox(width: 12,),
                        Text('Favorite',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 16,top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart,color: Colors.white,size: 32,),
                        SizedBox(width: 12,),
                        Text('My cart',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
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
                        Icon(Icons.person,color: Colors.white,size: 32,),
                        SizedBox(width: 12,),
                        Text('Profile',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
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
                        Icon(Icons.message,color: Colors.white,size: 32,),
                        SizedBox(width: 12,),
                        Text('Message',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),
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
