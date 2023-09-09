import 'package:flutter/material.dart';
import 'package:pet_station/design/deliveryAddress/addressbodysection.dart';
import 'package:pet_station/design/orderConfirmation.dart';
import 'package:pet_station/services/saveOrderAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {

  SaveOrderAddress saveAddress = SaveOrderAddress();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController lanmarkController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();

  late SharedPreferences prefs;
  late int outid;

  void getoutId()async {
    prefs = await SharedPreferences.getInstance();
    outid = (prefs.getInt('login_id') ?? 0 ) ;
    print('Outsider id ${outid}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Add Address',
          style: TextStyle(
            color: Colors.teal.shade800,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Handle reset action
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryAddress()));
              },
              child: Text(
                'Reset', style: TextStyle(
                  color: Colors.teal.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),

      body: const SingleChildScrollView(
        child: AddressBodySection(pincode:pincodeController,city:cityController,state:stateController,area:areaController,buildingName:buildingNameController,lanmark:lanmarkController,addressType:addressTypeController),
      ),

      bottomNavigationBar: InkWell(
        onTap: () {
          // Handle the save address action
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderConfirmation()));
          saveAddress.saveOrderAddress(context, outid, pincodeController.text, cityController.text, stateController.text, areaController.text, buildingNameController.text, lanmarkController.text, addressTypeController.text);
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
              'Save Address',
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