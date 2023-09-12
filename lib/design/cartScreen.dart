import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/single_pet.dart';
import 'package:pet_station/models/addtoCart.dart';
import 'package:pet_station/services/allService.dart';
import 'package:pet_station/services/decrementQnty.dart';
import 'package:pet_station/services/incrementQnty.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/deleteCartItem.dart';
import 'deliveryAddress.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  ViewCategoryApi cartSingleItemview = ViewCategoryApi();
  CartQuantityIncrementAPI cartincrement = CartQuantityIncrementAPI();
  CartQuantityDecrementAPI cartdecrement = CartQuantityDecrementAPI();
  DeleteCartItemAPI deleteCartItem=DeleteCartItemAPI();

  late SharedPreferences prefs;
  late int outid;
  late int loginId;

  void getoutId() async {
    prefs = await SharedPreferences.getInstance();
    loginId = (prefs.getInt('login_id') ?? 0);
    outid = (prefs.getInt('user_id') ?? 0 ) ;
    print('Outsider id ${outid}');
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getoutId();
  }

  List items = ['naame', 'naame', 'naame'];
  double counter = 0;

   int? count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text("${count} items", style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: FutureBuilder<List<Data>>(
                  future: ViewCategoryApi.getSinglecartItems(outid), builder: (BuildContext content, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            print('ddddddd   ${snapshot.data![index].image}');
                            final item = snapshot.data![index].id;
                            print(item);

                            count = snapshot.data!.length;

                            return Dismissible(
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  deleteCartItem.deleteCartItems(snapshot.data![index].id!.toInt());
                                });
                              },
                              key:UniqueKey(),
                              background: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.3)),
                                child: const Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.delete,
                                      size: 41,
                                    )
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 8, right: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            int? pid=snapshot.data![index].item?.toInt();
                                            print("product id   $pid");
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePet(pid: snapshot.data![index].item!.toInt())));
                                          },
                                          child: SizedBox(
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
                                                    APIConstants.url + snapshot.data![index].image.toString()
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].itemname
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].breedname
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black),
                                              maxLines: 2,
                                              overflow: TextOverflow.visible,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(TextSpan(
                                                text:
                                                    "₨. ${snapshot.data?[index].totalPrice.toString()}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey)))
                                          ],
                                        ),
                                        const Spacer(),
                                        Container(
                                          width: 100,
                                          height: 42,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () async{
                                                  //counter++;
                                                  await cartdecrement.cartQutyDecre(snapshot.data![index].id!.toInt());
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.teal.shade800,
                                                      size: 18,
                                                    )),
                                              ),
                                              Text(
                                                '${snapshot.data![index].quantity}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async{
                                                  //counter++;
                                                  await cartincrement.cartQutyIncre(snapshot.data![index].id!.toInt());
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.teal.shade800,
                                                      size: 18,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    //SizedBox(height: 20,),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade200,
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      print('no data');
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
            )),

            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            //   padding: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.teal.withOpacity(0.3),
            //         spreadRadius: 1,
            //         blurRadius: 5
            //       )
            //     ]),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "Sub-Total"
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(2, 1),
              blurRadius: 2,
              spreadRadius: 1)
        ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '₹ 2000',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeliveryAddress()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.9,
                  decoration: BoxDecoration(color: Colors.teal.shade800),
                  child: const Center(
                    child: Text(
                      'Place order',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
