
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_station/config/constants.dart';
import 'package:provider/provider.dart';

import '../provider/fav_provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {

    final object= Provider.of<FavProvider_class>(context);
    List imageStore=object.favoriteImage;
    List nameStore=object.favoriteName;
    List breedStore=object.favoriteBreed;
    List priceStore=object.favoritePrice;

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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: imageStore.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 8, right: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                //int? pid=snapshot.data![index].item?.toInt();
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet(pid: snapshot.data![index].item!.toInt())));
                              },
                              child: Stack(
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
                                        child: Image.network(imageStore[index]
                                            //APIConstants.url + snapshot.data![index].image.toString()
                                        ),
                                      ),
                                  ),
                                ),
                                  Positioned(
                                      right: 1,
                                      child: IconButton(
                                        onPressed: (){
                                          object.favorites(imageStore[index], nameStore[index], breedStore[index], priceStore[index]);
                                        },
                                        icon: object.icn_change(imageStore[index]) ?
                                        Icon(Icons.favorite,color: Colors.red,) :
                                        Icon(Icons.favorite_outline,color: Colors.grey.shade500,),
                                      ),
                                  ),
                              ]),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(nameStore[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text( breedStore[index],
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
                                    text: "₨. ${priceStore[index]}",
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
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
