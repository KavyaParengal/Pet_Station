
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){Navigator.pop(context);},
                        icon: Icon(Icons.arrow_back_ios)
                    ),
                    Text('Favorite List',style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),),
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300)
                        ),
                        child: Row(
                          children: [
                            Center(
                              child: Image.asset('images/cats/billy_cat1.png',width: 100,height: 100,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 6,),
                                Text('Name',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),maxLines: 2,),
                                SizedBox(height: 4,),
                                Text('Family',style: TextStyle(fontSize: 14,color: Colors.black)),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                        initialRating: 3.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemBuilder: (context, _){
                                          return Icon(Icons.star,color: Colors.amber,);
                                        },
                                        onRatingUpdate: (rating){}
                                    ),
                                    SizedBox(width: 5,),
                                    Text('(450)')
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Text('₹ 2000',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),maxLines: 2,),
                                SizedBox(height: 6,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(33),
                                        color: Colors.teal.shade700,
                                      ) ,
                                      child: Center(
                                        child: Text('Add to Cart',style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Container(
                                        width: 50,
                                        height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(42),
                                        color: Colors.teal.shade700,
                                      ) ,
                                      child: Icon(Icons.delete,color: Colors.white,size: 30,)
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,)
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
