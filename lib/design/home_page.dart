import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;

  bool isDrawerOpen=false;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      color: Colors.white,
      duration: Duration(microseconds: 250),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen?
                IconButton(
                    onPressed: (){
                      setState(() {
                        xOffset=0;
                        yOffset=0;
                        scaleFactor=1;
                        isDrawerOpen=false;
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios,size: 33,)
                ) :
                IconButton(
                    onPressed: (){
                      setState(() {
                        xOffset=230;
                        yOffset=150;
                        scaleFactor=0.6;
                        isDrawerOpen=true;
                      });
                    },
                    icon: Icon(Icons.menu,size: 30,)
                ),
                CircleAvatar(
                  radius: 22,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
