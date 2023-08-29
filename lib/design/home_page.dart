import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/notification.dart';
import 'package:pet_station/design/single_pet.dart';
import 'package:pet_station/models/viewCategory.dart';
import 'package:pet_station/services/allService.dart';

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

  ViewCategoryApi viewcategory=ViewCategoryApi();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2.18;

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
              height: 90,
              child: FutureBuilder<List<ViewCategoryModel>>(
                future: viewcategory.getCategories(),
                builder: (BuildContext content,AsyncSnapshot<List<ViewCategoryModel>> snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
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
                                  child: Image.network(APIConstants.url+snapshot.data![index].category_image.toString(),
                                    height: 50,
                                    width: 50,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text(snapshot.data![index].category_name.toString(),textAlign: TextAlign.center,style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade800
                                ),)
                              ],
                            ),
                          );
                        }
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              )
            ),
            // ListView.builder(
            //   itemCount: 8,
            //     shrinkWrap: true,
            //     itemBuilder: (context,index){
            //       return Column(
            //         children: [
            //           Container(
            //             height: MediaQuery.of(context).size.height/3,
            //             child: Stack(
            //               children: [
            //                 Container(
            //                   color: Colors.teal.shade800,
            //                 ),
            //                 Positioned(
            //                   bottom: 13,
            //                   left: 10,
            //                   child: Container(
            //                     // width: 100,
            //                     // height: 40 ,
            //                     padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(22),
            //                       color: Colors.teal.shade200
            //                     ),
            //                     child: Row(
            //                       children: [
            //                         Text('4',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
            //                         SizedBox(width: 3,),
            //                         Icon(Icons.star,size: 15,),
            //                         SizedBox(width: 4,),
            //                         Text('|'),
            //                         SizedBox(width: 4,),
            //                         Text('4.8 k',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start ,
            //                   children: [
            //                     Text(pets[index]['name'],style: TextStyle(
            //                         fontWeight: FontWeight.w700,
            //                         fontSize: 18
            //                     ),),
            //                     SizedBox(height: 4,),
            //                     Text(pets[index]['family'],style: TextStyle(
            //                         fontWeight: FontWeight.w400,
            //                         color: Colors.grey,
            //                         fontSize: 15
            //                     ),),
            //                     SizedBox(height: 4,),
            //                     Text("₨. ${pets[index]["price"]}",style: TextStyle(
            //                         fontWeight: FontWeight.w400,
            //                         fontSize: 13
            //                     ),)
            //                   ],
            //                 ),
            //                 IconButton(
            //                     onPressed: (){},
            //                     icon: Icon(Icons.favorite_outline)
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       );
            //     }
            // ),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  //width: MediaQuery.of(context).size.width*12,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pets.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300)
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet()));
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/4,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(pets[index]['imagePath'])),
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          left: 10,
                                          child: Container(
                                            // width: 100,
                                            // height: 40 ,
                                            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(22),
                                                color: Colors.grey.shade400.withOpacity(.5)
                                            ),
                                            child: Row(
                                              children: [
                                                Text('4',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                                                SizedBox(width: 3,),
                                                Icon(Icons.star,size: 15,),
                                                SizedBox(width: 4,),
                                                Text('|'),
                                                SizedBox(width: 4,),
                                                Text('4.8 k',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start ,
                                        children: [
                                          Text(pets[index]['name'],style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18
                                          ),),
                                          SizedBox(height: 4,),
                                          Text(pets[index]['family'],style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                              fontSize: 15
                                          ),),
                                          SizedBox(height: 4,),
                                          Text("₨. ${pets[index]["price"]}",style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13
                                          ),)
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.favorite_outline)
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                      );
                    },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
