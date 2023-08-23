
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SinglePet extends StatefulWidget {
  const SinglePet({Key? key}) : super(key: key);

  @override
  State<SinglePet> createState() => _SinglePetState();
}

class _SinglePetState extends State<SinglePet> {
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
            icon: Icon(Icons.arrow_back_ios)
        ),
        actions: [
          IconButton(
              onPressed: (){
                //Navigator.pop(context);
              },
              icon: Icon(Icons.ios_share_outlined)
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
                child: ImageSlideshow(
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
                      child: Image.asset('images/cats/billy_cat1.png'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/cats/billy_cat1.png'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/cats/billy_cat1.png'),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('images/cats/billy_cat1.png'),
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
                      Text('Name',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),),
                      Icon(Icons.male)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Family Name',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.grey
                  ),),
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
                  Text('₨. 2000',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),),
                  SizedBox(height: 20,),
                  Text("These are the most well-known breed of cats in India. "
                      "They are very affectionate, playful, beautiful, and well-suited "
                      "for the Indian climate. They live long without much attention and "
                      "clean themselves with their tongue. Their short coat means you don’t "
                      "have to worry about shedding.",textAlign: TextAlign.justify,style: TextStyle(
                    fontSize: 16,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
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
              child: Center(
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline,color: Colors.white,size: 33,))
              ),
            ),
            InkWell(
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
