import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/screens/SingleFoodScreen.dart';
import 'package:pet_station/screens/cartScreen.dart';
import 'package:pet_station/screens/notification.dart';
import 'package:pet_station/screens/single_pet.dart';
import 'package:pet_station/models/favoriteItemModel.dart';
import 'package:pet_station/models/foodModel.dart';
import 'package:pet_station/models/viewCategory.dart';
import 'package:pet_station/models/viewCategoryItems.dart';
import 'package:pet_station/services/allService.dart';
import 'package:http/http.dart' as http;
import 'package:pet_station/services/deleteFavoriteItem.dart';
import 'package:pet_station/services/deleteFavoriteItemInHomePage.dart';
import 'package:pet_station/services/favoriteFoodItem.dart';
import 'package:pet_station/services/favoriteItemService.dart';
import 'package:pet_station/services/searchitem.dart';
import 'package:pet_station/services/viewFavoriteItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;
  List<ViewCategoryItemsModel> _petdata=[];
  List<ViewCategoryModel> _categortData=[];
  List<ViewFoodModel> _fooddata=[];
  List<FavoriteData> _favoriteItem = [];
  List _favoritePetItem=[];
  List _favoriteFoodItem =[];
  bool isDrawerOpen=false;
  bool isLoaded=false;
  bool itemload=false;
  String breed='';

  ViewCategoryApi viewcategory=ViewCategoryApi();

  Future<List<ViewCategoryModel>> getCategories() async {
    final urls = APIConstants.url + APIConstants.viewCategoty;
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      _categortData = List<ViewCategoryModel>.from(
          body['data'].map((e) => ViewCategoryModel.fromJson(e)).toList());
      setState(() {

      });
      getCategoryItems(_categortData[0].id);
      return _categortData;
    }
    else {
      _categortData = [];
      return _categortData;
    }
  }

  Future<List<ViewCategoryItemsModel>> getCategoryItems(int id) async{
    setState(() {
      itemload=true;
    });
    final urls=APIConstants.url + APIConstants.viewItemInSingleCategory + id.toString();
    var response=await http.get(Uri.parse(urls));
    if(response.statusCode==200){
      var body=json.decode(response.body);
      _petdata=List<ViewCategoryItemsModel>.from(
          body['data'].map((e)=>ViewCategoryItemsModel.fromJson(e)).toList());
      setState(() {
        itemload=false;
      });
      return _petdata;
    }
    else{
      itemload=false;
      _petdata=[];
      return _petdata;
    }
  }

  Future<List<ViewFoodModel>> getFoodItems(int id) async{
    setState(() {
      itemload=true;
    });
    final urls=APIConstants.url + APIConstants.viewfoods + id.toString();
    var response=await http.get(Uri.parse(urls));
    if(response.statusCode==200){
      var body=json.decode(response.body);
      _fooddata =List<ViewFoodModel>.from(
          body['data'].map((e)=>ViewFoodModel.fromJson(e)).toList());
      setState(() {
        itemload=false;
      });
      return _fooddata;
    }
    else{
      itemload=false;
      _fooddata=[];
      return _fooddata;
    }
  }

  Future<void> fetchFavoriteItems() async {
    List<FavoriteData> data = await ViewFavoriteItems().getFavoriteItems();
    setState(() {
      _favoriteItem=data;
      _favoritePetItem = data.map((e) => e.itemId).toList();
      _favoriteFoodItem = data.map((e) => e.foodId).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
    fetchFavoriteItems();
  }


  int checkindex=0;
  late int categorId;
  String categoryType='';

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 1.9;
    final double itemWidth = size.width / 2.18;

    bool foodVisible=false;

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      color: Colors.grey.shade200,
      duration: const Duration(milliseconds: 250),

      child: SingleChildScrollView(
        //physics: ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 31,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                      icon: const Icon(Icons.arrow_back_ios,size: 33,)
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
                      icon: const Icon(Icons.menu,size: 30,)
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationPage()));
                          },
                          icon: const Icon(Icons.notifications_outlined,size: 31,)
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
                          },
                          icon: const Icon(Icons.shopping_cart_outlined,size: 31,)
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 27,horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.72,
                    child: TextFormField(
                      onFieldSubmitted: (String text){
                        setState(() {
                          breed=text;
                          SearchItem.searchItems(context, breed.trim());
                          setState(() {
                            isLoaded=false;
                          });
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Search pets and foods',
                          border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _categortData.length,
                  itemBuilder: (context,index){

                    return InkWell(
                      onTap: () {
                        setState(() {
                          checkindex = index;
                          categoryType=_categortData[index].category_name;
                          print(categoryType);
                          _categortData[index].category_name=='Food'? getFoodItems(_categortData[index].id) :
                          getCategoryItems(_categortData[index].id);
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  color: checkindex == index ? Colors.teal.shade800 : Colors.white,
                                  boxShadow: [ BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 30,
                                      offset: const Offset(0, 10)
                                  )],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.network(APIConstants.url+_categortData[index].category_image,
                                height: 50,
                                width: 50,
                                color: checkindex == index ? Colors.white : Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 3,),
                            Text(_categortData[index].category_name,textAlign: TextAlign.center,style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.grey.shade700
                            ),)
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
            itemload?const Center(child: CircularProgressIndicator(),):Padding(
              padding: const EdgeInsets.all(4.0),
              child:  Column(
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width*12,
                      child: categoryType=="Food" ?  GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _fooddata.length,
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleFoodScreen(foodId: _fooddata[index].id)));
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/4,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(APIConstants.url+_fooddata[index].image1.toString())),
                                              color: Colors.grey.shade100,
                                            ),
                                          ),
                                          Positioned(
                                            right: 1,
                                              child: IconButton(
                                                  onPressed: () async{
                                                    _favoriteFoodItem.contains(_fooddata[index].id) ? await DeleteFavoriteItemInHomePage.deleteFavoriteItemInHomePage(context,_fooddata[index].id) :
                                                      await FavoriteFoodItemAPI.favoriteFoodItem(context: context,foodId: _fooddata[index].id);

                                                      await fetchFavoriteItems();
                                                  },
                                                  icon:
                                                  _favoriteFoodItem.contains(_fooddata[index].id) ?
                                                  Icon(Icons.favorite,color: Colors.red,) :
                                                  Icon(Icons.favorite_outline)
                                              ),
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
                                                  Text('${_fooddata[index].rating.toStringAsFixed(1)}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                                                  SizedBox(width: 3,),
                                                  Icon(Icons.star,size: 15,),
                                                  SizedBox(width: 4,),
                                                  Text('|'),
                                                  SizedBox(width: 4,),
                                                  Text('${_fooddata[index].rating_count}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
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
                                        Text(_fooddata[index].companyName.toString(),style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),),
                                        Container(
                                          constraints: BoxConstraints(maxWidth: itemWidth-20),
                                          child: Text('${_fooddata[index].productName.toString()}',style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Colors.grey.shade600,
                                          ),maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(height: 4,),
                                        Text("₨. ${_fooddata[index].price}",style: const TextStyle(
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
                      ) :
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:_petdata.length,
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
                                      int pid=_petdata[index].id;
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet(pid: _petdata[index].id)));
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/4,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(APIConstants.url+_petdata[index].image1.toString())),
                                              color: Colors.grey.shade100,
                                            ),
                                          ),
                                          Positioned(
                                            right: 1,
                                            child: IconButton(
                                                onPressed: () async {
                                                  _favoritePetItem.contains(_petdata[index].id)  ? await DeleteFavoriteItemInHomePage.deleteFavoriteItemInHomePage(context,_petdata[index].id) :
                                                  await  FavoriteItemAPI.FavoriteItem(context: context,productId: _petdata[index].id);
                                                  await fetchFavoriteItems();
                                                },
                                                icon:
                                                _favoritePetItem.contains(_petdata[index].id) ?
                                                Icon(Icons.favorite,color: Colors.red,) :
                                                Icon(Icons.favorite_outline)
                                            ),
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
                                                  Text('${_petdata[index].rating.toStringAsFixed(1)}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),),
                                                  SizedBox(width: 3,),
                                                  Icon(Icons.star,size: 15,),
                                                  SizedBox(width: 4,),
                                                  Text('|'),
                                                  SizedBox(width: 4,),
                                                  Text('${_petdata[index].rating_count}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),)
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
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start ,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(_petdata[index].name.toString(),style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18
                                            ),),
                                            const SizedBox(height: 4,),
                                            Container(
                                              constraints: BoxConstraints(maxWidth: itemWidth-50),
                                              child: Text(_petdata[index].breed.toString(),style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey,
                                                  fontSize: 14
                                              ),maxLines: 2,),
                                            ),
                                            const SizedBox(height: 4,),
                                            Text("₨. ${_petdata[index].price.toString()}",style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14
                                            ),)
                                          ],
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
