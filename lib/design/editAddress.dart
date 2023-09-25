
import 'package:flutter/material.dart';
import 'package:pet_station/models/orderAddress.dart';
import 'package:pet_station/services/updateOrderAddress.dart';
import 'package:pet_station/services/viewSingleOrderAddress.dart';

class EditAddress extends StatefulWidget {

  final int orderAddressId;


  @override
  State<EditAddress> createState() => _EditAddressState();

  EditAddress({required this.orderAddressId});
}

class _EditAddressState extends State<EditAddress> {

  String addressType='';
  bool isRadioButtonSelected = false;
  Data? address;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController lanmarkController = TextEditingController();

  String name='';
  String contact='';
  String pincode='';
  String city='';
  String state='';
  String area='';
  String buildingName='';

  Future<Data?> fetchSingleorderAddress(int OId) async {
    try {
      final details = await viewSingleOrderAddressAPI().SingleOrderAddressAPI(OId);
      address = details;
      setState(() {
        name =  address!.name!;
        contact = address!.contact!;
        pincode = address!.pincode!;
        city = address!.city!;
        state = address!.state!;
        area = address!.area!;
        buildingName = address!.buildingName!;

        nameController.text=name;
        contactController.text=contact;
        pincodeController.text=pincode;
        cityController.text=city;
        stateController.text=state;
        areaController.text=area;
        buildingNameController.text=buildingName;
      });
    }
    catch(e){
      // Handle errors here, e.g., show an error message
      print('Failed to fetch user details: $e');
      return null; // Return null in case of an error
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSingleorderAddress(widget.orderAddressId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Edit Address',
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
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Info",style: TextStyle(
                      color: Colors.teal.shade700,
                      fontWeight: FontWeight.w800,
                      fontSize: 19
                  ),),
                  SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: name,
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: contactController,
                    decoration: InputDecoration(
                      hintText: contact,
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address Info",style: TextStyle(
                      color: Colors.teal.shade700,
                      fontWeight: FontWeight.w800,
                      fontSize: 19
                  ),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: pincodeController,
                          decoration: InputDecoration(
                            hintText: pincode,
                            hintStyle: TextStyle(color: Colors.grey.shade800),
                            // labelText: "Pincode",
                            // labelStyle: TextStyle(color: Colors.grey.shade700),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                            hintText: city,
                            hintStyle: TextStyle(color: Colors.grey.shade800),
                            // labelText: "City",
                            // labelStyle: TextStyle(color: Colors.grey.shade700),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: stateController,
                    decoration: InputDecoration(
                      hintText: state,
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      // labelText: "State",
                      // labelStyle: TextStyle(color: Colors.grey.shade700),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: areaController,
                    decoration: InputDecoration(
                      hintText: area,
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      // labelText: "Locality / Area / Street",
                      // labelStyle: TextStyle(color: Colors.grey.shade700),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: buildingNameController,
                    decoration: InputDecoration(
                      hintText: buildingName,
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      // labelText: "Flat No / Building Name",
                      // labelStyle: TextStyle(color: Colors.grey.shade700),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: lanmarkController,
                    decoration: InputDecoration(
                      labelText: "Landmark (optional)",
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              //adding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Type of Address",style: TextStyle(
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.w800,
                        fontSize: 19
                    ),),
                  ),
                  //SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text("Home"),
                          value: "Home",
                          contentPadding: EdgeInsets.only(left: 5),
                          groupValue: addressType,
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              addressType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: RadioListTile(
                          title: Text("Office"),
                          contentPadding: EdgeInsets.only(left: 5),
                          value: "Office",
                          groupValue: addressType,
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              addressType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: RadioListTile(
                          title: Text("Other"),
                          value: "Other",
                          groupValue: addressType,
                          contentPadding: EdgeInsets.only(left: 5),
                          activeColor: Colors.teal.shade800,
                          onChanged: (value){
                            setState(() {
                              addressType = value.toString();
                              isRadioButtonSelected = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: false,
                  //       onChanged: (bool? newValue) {
                  //         // Handle checkbox state changes
                  //       },
                  //     ),
                  //     SizedBox(width: 10),
                  //     Text(
                  //       'Make as default address',
                  //       style: TextStyle(fontSize: 17.0),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: () {
          UpdateOrderAddressAPI().updateOrderAddress(context, widget.orderAddressId, nameController.text, contactController.text, pincodeController.text,
              cityController.text, stateController.text, areaController.text, buildingNameController.text, lanmarkController.text, addressType);
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
              'Edit Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );;
  }
}
