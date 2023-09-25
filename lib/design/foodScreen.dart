
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/SingleFoodScreen.dart';
import 'package:pet_station/models/foodModel.dart';
import 'package:pet_station/services/foodViewService.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);
  @override
  State<FoodScreen> createState() => _FoodScreenState();

}

class _FoodScreenState extends State<FoodScreen> {

  bool itemload=false;
  List<ViewFoodModel> _foodView=[];

  Future<void> fetchFoodDetails() async {
    List<ViewFoodModel> data = await FoodViewAPI.getFoodItems(23);
    setState(() {
      _foodView = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFoodDetails();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 1.9;
    final double itemWidth = size.width / 2.12;

    return Scaffold(
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:_foodView.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            crossAxisSpacing: 3.0,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleFoodScreen(foodId: 3)));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/4,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(APIConstants.url+_foodView[index].image1.toString())),
                              color: Colors.grey.shade100,
                            ),
                          ),
                          const Positioned(
                            right: 1,
                            // child: IconButton(
                            //   onPressed: (){
                            //     object.favorites(APIConstants.url+_data[index].image1.toString(), _data[index].name.toString(), _data[index].breed.toString(), _data[index].price.toString());
                            //   },
                            //   icon: object.icn_change(APIConstants.url+_data[index].image1.toString()) ?
                            //   const Icon(Icons.favorite,color: Colors.red,) :
                            //   Icon(Icons.favorite_outline,color: Colors.grey.shade800,),
                            // ),
                            // child: IconButton(
                            //     onPressed: (){
                            //       FavoriteItemAPI.FavoriteItem(context: context,productId: _data[index].id);
                            //     },
                            //     icon: Icon(Icons.favorite_outline,color: Colors.grey.shade800,)
                            // ),
                            child: Icon(Icons.favorite),
                          ),
                          Positioned(
                            bottom: 13,
                            left: 10,
                            child: Container(
                              // width: 100,
                              // height: 40 ,
                              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.grey.shade400.withOpacity(.5)
                              ),
                              child: Row(
                                children: [
                                  Text('${_foodView[index].rating.toStringAsFixed(1)}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                                  SizedBox(width: 3,),
                                  Icon(Icons.star,size: 15,),
                                  SizedBox(width: 4,),
                                  Text('|'),
                                  SizedBox(width: 4,),
                                  Text('${_foodView[index].rating_count}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_foodView[index].companyName.toString(),style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),),
                        Container(
                          constraints: BoxConstraints(maxWidth: itemWidth-20),
                          child: Text('${_foodView[index].productName.toString()}',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.grey.shade600
                          ),maxLines: 2,),
                        ),
                        const SizedBox(height: 4,),
                        Text("₨. ${_foodView[index].price}",style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
