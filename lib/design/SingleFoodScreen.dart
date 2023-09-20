
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_station/design/cartScreen.dart';
import 'package:readmore/readmore.dart';

class SingleFoodScreen extends StatefulWidget {
  const SingleFoodScreen({Key? key}) : super(key: key);

  @override
  State<SingleFoodScreen> createState() => _SingleFoodScreenState();
}

class _SingleFoodScreenState extends State<SingleFoodScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
        ),
        actions: [
          IconButton(
              onPressed: (){
                //Navigator.pop(context);
              },
              icon: Icon(Icons.ios_share_outlined)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              icon: Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.43,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0, 1)
                  )
                ],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
              ),
              child: Center(
                child:  ImageSlideshow(
                  height: 320,
                  indicatorColor: Colors.teal.shade800,
                  indicatorBackgroundColor: Colors.grey,
                  autoPlayInterval: 4000,
                  indicatorRadius: 5,
                  indicatorBottomPadding: 2,
                  indicatorPadding: 8,
                  isLoop: true,
                  children: [
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/food/image1.1.webp'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/food/image1.2.webp'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/food/image1.3.webp'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/food/image1.4.webp'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/food/image1.5.webp'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-50),
                        child: Text("Nature's HUG Junior Growth Toy & Small Breed Vegan Dry Dog Food - 2.27 kg",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-50),
                    child: Text("Supports bone structure and immunity",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, _){
                            return Icon(Icons.star,color: Colors.amber,);
                          },
                          onRatingUpdate: (rating){}
                      ),
                      SizedBox(width: 5,),
                      Text('(450)')
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('₨. 1111',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 15,),
                  Text('Delivery within 11 days',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),),
                  SizedBox(height: 14,),
                  ReadMoreText("Revolutionising pet nutrition, Nature's HUG is now in India! This puppy dry food is made of neither animal nor plant protein. "
                      "Instead, it has protein NH+ - a complete yeast protein which has the same amino acid profile as animal protein! Nature's HUG "
                      "Junior Growth Toy & Small Breed dog food is specifically made to provide ideal nutrition to puppies from an early age. "
                      "This formula will help your pup develop to their full potential. The addition of superfoods like kale, kelp and flaxseeds "
                      "support bone structure, immunity and skin and coat health.",trimLines: 2,
                    textScaleFactor: 1,
                    colorClickableText: Colors.teal.shade800,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: '   Show less',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    moreStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800),
                    lessStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800),
                  ),
                ],
              ),
            )
          ],
        ),),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width/5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal.shade800
              ),
              // child: Center(
              //     child: //IconButton(
              //       // onPressed: (){
              //       //   object.favorites(APIConstants.url+petDetails!.image1, petDetails!.name, petDetails!.breed, petDetails!.price);
              //       // },
              //       // icon: object.icn_change(APIConstants.url+petDetails!.image1) ?
              //       // Icon(Icons.favorite,color: Colors.white,size: 32,) :
              //       // Icon(Icons.favorite_outline,color: Colors.white,size: 32,),
              //     //),
              // ),
            ),
            InkWell(
              onTap: (){
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal.shade800
                ),
                child: Center(
                  child: Text('Add to Cart',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
