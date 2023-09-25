
import 'dart:convert';

import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/design/changeAddress.dart';
import 'package:pet_station/design/orderSuccessMessage.dart';
import 'package:pet_station/models/orderAddress.dart';
import 'package:pet_station/services/allService.dart';
import 'package:pet_station/services/apiService.dart';
import 'package:pet_station/services/paymentApi.dart';
import 'package:pet_station/services/placeOrder.dart';
import 'package:pet_station/services/viewAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/addtoCart.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {

  String paymentType='';
  bool isRadioButtonSelected = false;

  late SharedPreferences prefs;
  late int outid;
  late int loginId;
  var _loaddata;

  List<Data> _orderAddress=[];

  void getoutId() async {
    prefs = await SharedPreferences.getInstance();
    loginId = (prefs.getInt('login_id') ?? 0);
    outid = (prefs.getInt('user_id') ?? 0 ) ;
    setState(() {

    });

    fetchTotalPrice();
    fetchOrderAddress();
  }

  Future<void> fetchOrderAddress() async {
    ViewOrderAddress viewOrderAddress = ViewOrderAddress();
    List<Data> data = await viewOrderAddress.getOrderAddress();

    setState(() {
      _orderAddress = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getoutId();
  }

  Future<void> fetchTotalPrice() async {
    try {
      var response = await Api().getData(APIConstants.totalOrderPrice + outid.toString());
      if (response.statusCode == 201) {
        var items = json.decode(response.body);
        var body=items['data']['total_price'];
        setState(() {
          _loaddata = body;
        });
      } else {
        setState(() {
          _loaddata = [];
          Fluttertoast.showToast(
            msg:"Currently there is no data available",
            backgroundColor: Colors.grey,
          );
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Order Confirmation',
          style: TextStyle(
            color: Colors.teal.shade800,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: _orderAddress.isNotEmpty ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_orderAddress[0].addressType} Delivery',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.black,
                            ),),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangeAddress()));
                              },
                              child: Text('Change address',style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.teal.shade800,
                              ),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Text(_orderAddress[0].name!,style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        const SizedBox(height: 10,),
                        Text('${_orderAddress[0].buildingName}, ${_orderAddress[0].area}, ${_orderAddress[0].city}, ${_orderAddress[0].state}-${_orderAddress[0].pincode}',style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Phone : ',style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),),
                            Text('${_orderAddress[0].contact}',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ExpansionWidget(
                initiallyExpanded: false,
                titleBuilder: (double animationValue, _, bool isExpanded, toggleFunction,) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Expected Delivery',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: toggleFunction,
                          child: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<List<CartData>>(
                    future: ViewCategoryApi.getSinglecartItems(outid), builder: (BuildContext content, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: NetworkImage(APIConstants.url + snapshot.data![index].image.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delivered in ${snapshot.data![index].expday} days",
                                        style: TextStyle(
                                            color: Colors.teal.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${snapshot.data![index].itemname}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${snapshot.data![index].breedname}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      else{
                        print('no data');
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                  })
                ),
              ),
            ),

            const SizedBox(height: 8,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.07,
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Amount Payable',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                      Text('₹${_loaddata}',style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),),
                    ]
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.36,
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,top: 18,bottom: 18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Payment Methods',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                      const SizedBox(height: 15,),

                      Expanded(
                        child: RadioListTile(
                          title: const Text("UPI"),
                          value: "upi",
                          contentPadding: const EdgeInsets.only(left: 5),
                          groupValue: paymentType,
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              paymentType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: RadioListTile(
                          title: const Text("Cradit / Debit Card"),
                          contentPadding: const EdgeInsets.only(left: 5),
                          value: "cards",
                          groupValue: paymentType,
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              paymentType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: RadioListTile(
                          title: const Text("Net Banking"),
                          value: "netBanking",
                          groupValue: paymentType,
                          contentPadding: const EdgeInsets.only(left: 5),
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              paymentType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: RadioListTile(
                          title: const Text("Wallet"),
                          value: "wallet",
                          groupValue: paymentType,
                          contentPadding: const EdgeInsets.only(left: 5),
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              paymentType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: RadioListTile(
                          title: const Text("Cash on Delivery"),
                          value: "cashOnDelivery",
                          groupValue: paymentType,
                          contentPadding: const EdgeInsets.only(left: 5),
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              paymentType = value.toString();
                              isRadioButtonSelected = true;
                            });

                          },

                        ),
                      ),

                    ]
                ),
              ),
            ),
          ],
        ) :
          Center(child: CircularProgressIndicator(),)
      ),

      bottomNavigationBar: InkWell(
        onTap: () {
          PlaceOrderAPI.placeOrder(context);
          PaymentAPI.payment(context, _loaddata);
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderSuccessMessage()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal.shade800,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: const Center(
            child: Text(
              'Place Order',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
