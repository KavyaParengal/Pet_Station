
import 'package:flutter/material.dart';
import 'package:pet_station/deliveryAddress/addressbodysection.dart';
class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Add Address',style: TextStyle(
          color: Colors.black,
          fontSize: 18
        ),),
        //centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                  },
                  child: Text('Reset',style: TextStyle(
                      color: Colors.teal.shade700,
                    fontWeight: FontWeight.w500
                  ),)
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: AddressBodySection(),
    );
  }
}