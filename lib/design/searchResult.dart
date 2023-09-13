
import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/single_pet.dart';
import 'package:pet_station/models/viewCategoryItems.dart';

class SearchResult extends StatelessWidget {

  final List<ViewCategoryItemsModel> items;
  SearchResult({required this.items});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2.18;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 4,right: 4,top: 8,bottom: 4),
          child:  Container(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet(pid: items[index].id)));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height/4,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(APIConstants.url+items[index].image1)),
                                      color: Colors.grey.shade100,
                                    ),
                                  ),
                                  Positioned(
                                    right: 1,
                                    child: IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.favorite),
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
                                      child:const Row(
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
                            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start ,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${items[index].name}',style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18
                                    ),),
                                    const SizedBox(height: 4,),
                                    Text('${items[index].breed}',style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        fontSize: 15
                                    ),),
                                    const SizedBox(height: 4,),
                                    Text("₨. ${items[index].price}",style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13
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
          )
      ),
    );
  }
}
