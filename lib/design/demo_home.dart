
import 'package:flutter/material.dart';
import 'package:pet_station/design/notification.dart';
import 'package:pet_station/design/single_pet.dart';

class HomeScreenDemo extends StatefulWidget {
  const HomeScreenDemo({Key? key}) : super(key: key);

  @override
  State<HomeScreenDemo> createState() => _HomeScreenDemoState();
}

class _HomeScreenDemoState extends State<HomeScreenDemo> {

  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;

  bool isDrawerOpen=false;

  List<Map> categories=[
    {'name': 'Cats','iconPath':'images/cat.png'},
    {'name': 'Dogs','iconPath':'images/dog.png'},
    {'name': 'Fish','iconPath':'images/fish.png'},
    {'name': 'Parrot','iconPath':'images/parrot.png'},
    {'name': 'Rabbit','iconPath':'images/rabbit.png'},
    {'name': 'Foods','iconPath':'images/pet-food.png'},
  ];

  List<Map> pets=[
    {'name':'Sola','family':'Billy Cat','price':'2000','gender':'male','imagePath':'images/cats/billy_cat1.png'},
    {'name':'Sola','family':'Himalayan Cat','price':'10000','gender':'female','imagePath':'images/cats/himalayan1.png'},
    {'name':'Sola','family':'Billy Cat','price':'2500','gender':'male','imagePath':'images/cats/billy_cat2.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      color: Colors.grey.shade200,
      duration: Duration(milliseconds: 250),

      child: SingleChildScrollView(
        //physics: ScrollPhysics(),
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
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                          },
                          icon: Icon(Icons.notifications_outlined,size: 30,)
                      ),
                      IconButton(
                          onPressed: (){
                            // Navigator.pop(context);
                          },
                          icon: Icon(Icons.shopping_cart_outlined,size: 30,)
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 27,horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.6,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search pets and foods',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.sort)
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                //physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [ BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 30,
                                    offset: Offset(0, 10)
                                )],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.asset(categories[index]['iconPath'],
                              height: 50,
                              width: 50,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(categories[index]['name'],textAlign: TextAlign.center,style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade800
                          ),)
                        ],
                      ),
                    );
                  }
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: pets.length,
                itemBuilder: (context,index){
                  print(pets[index]['imagePath']);
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet()));
                    },
                    child: Container(
                      height: 250,
                      margin: EdgeInsets.symmetric(horizontal: 15,),
                      child: Row(
                        children: [
                          Expanded(child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.teal.shade800 ,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 30,
                                          offset: Offset(0, 10)
                                      )
                                    ]
                                ),
                                margin: EdgeInsets.only(top: 40),
                              ),
                              Align(
                                child: Image.asset(pets[index]['imagePath'],
                                  //fit: BoxFit.fitWidth,height: 500,width: 600,
                                ),
                              )
                            ],
                          )),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 55,bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 30,
                                          offset: Offset(0, 10)
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(pets[index]['name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey.shade800),),
                                          pets[index]['imagePath']=="male" ? Icon(Icons.male,color: Colors.grey.shade600,size: 28,) : Icon(Icons.female,color: Colors.grey.shade600,size: 28,)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8),
                                      child: Text(pets[index]['family'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey.shade600),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8, top: 40),
                                      child: Text('₨. ${pets[index]['price']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey.shade600),),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}

