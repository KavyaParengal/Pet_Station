
import 'package:flutter/material.dart';
import 'package:pet_station/models/userregister.dart';
import 'package:pet_station/services/viewProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressBodySection extends StatefulWidget {
  final pincode;
  final city;
  final state;
  final area;
  final buildingName;
  final lanmark;
  final addressType;

  AddressBodySection(
      { required this.pincode,
        required this.city,
        required this.state,
        required this.area,
        required this.buildingName,
        required this.lanmark,
        required this.addressType});

  @override
  State<AddressBodySection> createState() => _AddressBodySectionState();

}

class _AddressBodySectionState extends State<AddressBodySection> {

  bool value = false;
  String addressType='';
  bool isRadioButtonSelected = false;
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController lanmarkController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();

  late SharedPreferences prefs;
  late int outid;
  UserRegisterModel? userDetails;
  String name='';
  String contact='';

  void getoutId()async {
    prefs = await SharedPreferences.getInstance();
    outid = (prefs.getInt('login_id') ?? 0 ) ;
    print('Outsider id ${outid}');

    fetchUserDetails(outid);
  }

  Future<UserRegisterModel?> fetchUserDetails(int uId) async {
    try {
      final details = await ViewProfileAPI().getViewProfile(uId);
      userDetails=details;
      setState(() {
        name =  userDetails!.fullnameController;
        contact = userDetails!.phoneController;
        print(name);

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
    getoutId();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                decoration: InputDecoration(
                  //labelText: "Name",
                  //labelStyle: TextStyle(color: Colors.grey.shade800),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "$name",
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
                        labelText: "Pincode",
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
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        labelText: "City",
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
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: stateController,
                decoration: InputDecoration(
                  labelText: "State",
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
              SizedBox(height: 20),
              TextField(
                controller: areaController,
                decoration: InputDecoration(
                  labelText: "Locality / Area / Street",
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
              SizedBox(height: 20),
              TextField(
                controller: buildingNameController,
                decoration: InputDecoration(
                  labelText: "Flat No / Building Name",
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
                      value: "Home Address",
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
                      value: "Office Address",
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
                      value: "Other Address",
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
              Row(
                children: [
                  Checkbox(
                    value: false, // You should manage the state of this checkbox
                    onChanged: (bool? newValue) {
                      // Handle checkbox state changes
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Make as default address',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}
