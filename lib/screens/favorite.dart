
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/screens/SingleFoodScreen.dart';
import 'package:pet_station/screens/single_pet.dart';
import 'package:pet_station/models/favoriteItemModel.dart';
import 'package:pet_station/services/deleteFavoriteItem.dart';
import 'package:pet_station/services/viewFavoriteItem.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  List<FavoriteData> _favoriteItem=[];

  Future<void> fetchFavoriteItems() async {
    List<FavoriteData> data = await ViewFavoriteItems().getFavoriteItems();

    setState(() {
      _favoriteItem = data;
    });
    print(_favoriteItem);
    print(_favoriteItem[0].favStatus);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFavoriteItems();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 1.8;

    // final object= Provider.of<FavProvider_class>(context);
    // List imageStore=object.favoriteImage;
    // List nameStore=object.favoriteName;
    // List breedStore=object.favoriteBreed;
    // List priceStore=object.favoritePrice;

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
                        icon: Icon(Icons.arrow_back)
                    ),
                    Text('Favorite List',style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),),
                  ],
                ),
              ),
              _favoriteItem.isNotEmpty ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _favoriteItem.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 8, right: 8),
                    child: InkWell(
                      onTap: (){
                        if(_favoriteItem[index].foodId==null)
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet(pid: _favoriteItem[index].itemId!)));
                        else if(_favoriteItem[index].itemId==null)
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleFoodScreen(foodId: _favoriteItem[index].foodId!)));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: AspectRatio(
                                      aspectRatio: 0.88,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Image.network(
                                            APIConstants.url + _favoriteItem[index].image.toString()
                                        ),
                                      ),
                                  ),
                                ),
                                  Positioned(
                                      right: 1,
                                    child: IconButton(
                                      onPressed: () async{
                                        if(_favoriteItem[index].favStatus! == "1") {


                                          await  DeleteFavoriteItemAPI.deleteFavoriteItems(context,_favoriteItem[index].id!);
                                          await fetchFavoriteItems();

                                        }
                                      },
                                      icon: _favoriteItem[index].favStatus! == "1" ?
                                          Icon(Icons.favorite,color: Colors.red,) :
                                          Icon(Icons.favorite_outline)
                                    ),
                                  ),
                              ]),
                              const SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: itemWidth ,
                                    ),
                                    child: Text(_favoriteItem[index].itemName.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text( _favoriteItem[index].breed.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey),
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "₨. ${_favoriteItem[index].price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey)))
                                ],
                              ),
                              const Spacer(),
                              // IconButton(onPressed: (){},
                              //     icon: Icon(Icons.delete)
                              // )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                          )
                        ],
                      ),
                    ),
                  );
                }) : Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      ),
    );
  }
}
