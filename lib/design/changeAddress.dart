
import 'package:flutter/material.dart';
import 'package:pet_station/design/deliveryAddress.dart';
import 'package:pet_station/design/editAddress.dart';
import 'package:pet_station/design/orderConfirmation.dart';
import 'package:pet_station/models/orderAddress.dart';
import 'package:pet_station/services/viewAddress.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  String address = '';
  bool isRadioButtonSelected = false;
  int selectedAddressIndex = -1;

  List<Data> _orderAddress=[];

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
    fetchOrderAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Delivery Address',
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryAddress()),
                  );
                },
                child: Text(
                  '+ Add address',
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _orderAddress.isNotEmpty ? ListView.builder(
        itemCount: _orderAddress.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderConfirmation()));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_orderAddress[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 13,),
                                Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 120),
                                  child: Text(
                                    '${_orderAddress[index].buildingName}, ${_orderAddress[index].area}, ${_orderAddress[index].city}, ${_orderAddress[index].state}-${_orderAddress[index].pincode}',
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Text(
                                      'Phone : ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(
                                      '${_orderAddress[index].contact}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                          Radio(
                            value: index,
                            groupValue: selectedAddressIndex,
                            activeColor: Colors.teal.shade800,
                            onChanged: (value) {
                              setState(() {
                                selectedAddressIndex = value as int;
                                print(selectedAddressIndex);
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        color: Colors.grey.shade300,
                        height: 1,
                        width: MediaQuery.of(context).size.width*0.83,
                      ),
                      TextButton(
                          onPressed: () {
                            print(_orderAddress[index].id!);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAddress(orderAddressId:_orderAddress[index].id!)));
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.teal.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ) :
          Center(child: CircularProgressIndicator(),)
    );
  }
}


