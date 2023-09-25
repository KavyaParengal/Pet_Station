
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/cartScreen.dart';
import 'package:pet_station/design/login_page.dart';
import 'package:pet_station/models/viewCategoryItems.dart';
import 'package:pet_station/services/allService.dart';
import 'package:pet_station/services/ratePets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/fav_provider.dart';

class SinglePet extends StatefulWidget {

  final int pid;

  SinglePet({ required this.pid});

  @override
  State<SinglePet> createState() => _SinglePetState();
}

class _SinglePetState extends State<SinglePet> {

  ViewCategoryApi viewPetdetails=ViewCategoryApi();
  ViewCategoryItemsModel? petDetails;

  @override
  void initState() {
    super.initState();

    fetchPetDetails(widget.pid);
    getoutId();
  }

  Future<ViewCategoryItemsModel?> fetchPetDetails(int id) async {
    try {
      final details = await ViewCategoryApi.getPetDetails(id);

        petDetails = details;
        setState(() {
           print(petDetails);
        });

    } catch (e) {
      // Handle errors here, e.g., show an error message
      print('Failed to fetch pet details: $e');
      return null; // Return null in case of an error
    }
  }

  late SharedPreferences prefs;
  late int outid;

  void getoutId()async {
    prefs = await SharedPreferences.getInstance();
    outid = (prefs.getInt('user_id') ?? 0 ) ;
  }


  @override
  Widget build(BuildContext context) {
    final object = Provider.of<FavProvider_class>(context,listen: false);

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

      body: petDetails != null ?
        SingleChildScrollView(
          child: petDetails != null ?  Column(
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
                                child: Image.network(APIConstants.url+petDetails!.image1),
                              ),
                              Padding(padding: EdgeInsets.all(8),
                                child: Image.network(APIConstants.url+petDetails!.image2),
                              ),
                              Padding(padding: EdgeInsets.all(8),
                                child: Image.network(APIConstants.url+petDetails!.image3),
                              ),
                              Padding(padding: EdgeInsets.all(8),
                                child: Image.network(APIConstants.url+petDetails!.image4),
                              )
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
                                Text(petDetails!.name,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),),
                                petDetails!.gender=='Male'?Icon(Icons.male):Icon(Icons.female)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(petDetails!.breed,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.grey
                            ),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                RatingBar.builder(
                                    initialRating: petDetails!.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 25,
                                    itemBuilder: (context, _){
                                      return Icon(Icons.star,color: Colors.amber,);
                                    },
                                    onRatingUpdate: (rating) {
                                      RatePetsAPI.ratePets(context, widget.pid, rating);
                                      print(rating);
                                    }
                                ),
                                SizedBox(width: 5,),
                                Text('(${petDetails!.rating_count})')
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text('₨. ${petDetails!.price}',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),),
                            SizedBox(height: 15,),
                            Text('Delivery within ${petDetails!.expdate} days',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 20,),
                            Text(petDetails!.description,textAlign: TextAlign.justify,style: TextStyle(
                              fontSize: 16,
                            ),),
                          ],
                        ),
                      )
                    ],
                  ) : Center(child: CircularProgressIndicator(),),
        ) : Center(child: CircularProgressIndicator(),),
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
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
                viewPetdetails.addtoCart(context: context, userId: outid, productId: widget.pid);
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
