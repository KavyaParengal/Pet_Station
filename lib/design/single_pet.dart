
import 'package:flutter/material.dart';

class SinglePet extends StatefulWidget {
  const SinglePet({Key? key}) : super(key: key);

  @override
  State<SinglePet> createState() => _SinglePetState();
}

class _SinglePetState extends State<SinglePet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.red, Colors.yellow, Colors.green],
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.white,
                      )
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 22),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.ios_share_outlined)
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 1,
                child: Image.asset(
                  'images/cats/billy_cat1.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      blurRadius: 20,
                      offset: Offset(0, 10)
                  )
                ]
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Solo',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey.shade800),),
                        Icon(Icons.male,color: Colors.grey.shade600,size: 28,)
                      ]
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Billy Cat',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.grey.shade800),),
                          Text('2 yrs old',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.grey.shade800)),
                        ]

                    )
                  ]
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(42),topLeft: Radius.circular(42)),
                color:  Colors.grey.shade200,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60 ,
                      width: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.red, Colors.yellow, Colors.green],
                        ),
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite_outline,color: Colors.white,size: 33,),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(width: 18,),
                    Expanded(
                      child: Container(
                        height: 60,
                        //width: MediaQuery.of(context).size.width*.6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.red, Colors.yellow, Colors.green],
                          ),
                            borderRadius: BorderRadius.circular(22)
                        ),
                        child: TextButton(
                          child: Text('Buy Now',style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20
                          ),),
                          onPressed: (){},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
