
import 'package:expandable_text/expandable_text.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/cartScreen.dart';
import 'package:pet_station/models/foodModel.dart';
import 'package:pet_station/services/rateFood.dart';
import 'package:pet_station/services/viewSingleFoodData.dart';
import 'package:readmore/readmore.dart';

class SingleFoodScreen extends StatefulWidget {

  final int foodId;

  @override
  State<SingleFoodScreen> createState() => _SingleFoodScreenState();

  SingleFoodScreen({required this.foodId});
}

class _SingleFoodScreenState extends State<SingleFoodScreen> {

  ViewFoodModel? foodDetails;

  Future<ViewFoodModel?> fetchFoodDetails(int foodId) async {
    try {
      final details = await ViewSingleFoodData.getFoodDetails(foodId) ;
      foodDetails = details;
      setState(() {
        print('----------${foodDetails}');
      });

    } catch (e) {
      print('Failed to fetch food details: $e');
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFoodDetails(widget.foodId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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

      body: foodDetails!=null? SingleChildScrollView(
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
                      child: Image.network(APIConstants.url+foodDetails!.image1),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.network(APIConstants.url+foodDetails!.image2),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.network(APIConstants.url+foodDetails!.image3),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.network(APIConstants.url+foodDetails!.image4),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.network(APIConstants.url+foodDetails!.image5),
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
                        child: Text(foodDetails!.productName,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-50),
                    child: Text(foodDetails!.benefit,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating: foodDetails!.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, _){
                            return Icon(Icons.star,color: Colors.amber,);
                          },
                          onRatingUpdate: (rating){
                            RateFoodAPI.rateFood(context, foodDetails!.id, rating);
                          }
                      ),
                      SizedBox(width: 5,),
                      Text('(${foodDetails!.rating_count})')
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('₨. ${foodDetails!.price}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 15,),
                  Text('Delivery within ${foodDetails!.expdate} days',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ExpansionWidget(
                initiallyExpanded: false,
                titleBuilder: (double animationValue, _, bool isExpanded, toggleFunction,) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: Colors.teal.shade800,
                          ),
                        ),
                        InkWell(
                          onTap: toggleFunction,
                          child: Icon(
                            isExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                content: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      child: Text('${foodDetails!.description}',textAlign: TextAlign.justify,style: TextStyle(
                          color: Colors.black, fontSize: 16
                      ),),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ExpansionWidget(
                initiallyExpanded: false,
                titleBuilder: (double animationValue, _, bool isExpanded, toggleFunction,) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Additional Info',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: Colors.teal.shade800,
                          ),
                        ),
                        InkWell(
                          onTap: toggleFunction,
                          child: Icon(
                            isExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                content: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Product Name : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: foodDetails!.productName,style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),
                        RichText(
                          text: TextSpan(
                            text: 'Product Type : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: foodDetails!.productType,style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),
                        RichText(
                          text: TextSpan(
                            text: 'Net Weight/Net Quantity/Net Volume : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: foodDetails!.netWeight,style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),
                        RichText(
                          text: TextSpan(
                            text: 'Marketed by : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: foodDetails!.marketedBy,style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),
                        RichText(
                          text: TextSpan(
                            text: 'MRP : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: '₹ ${foodDetails!.price} (Inclusive of all taxes)',style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,)
          ],
        ),) : Center(child: CircularProgressIndicator(),),
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
