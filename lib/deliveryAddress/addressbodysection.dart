
import 'package:flutter/material.dart';

class AddressBodySection extends StatefulWidget {
  const AddressBodySection({Key? key}) : super(key: key);

  @override
  State<AddressBodySection> createState() => _AddressBodySectionState();
}

class _AddressBodySectionState extends State<AddressBodySection> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.29,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 23,left: 16,right: 16,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Info"
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Phone Number (+91)",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.29,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 23,left: 16,right: 16,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Address Info"
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Pincode",
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                        SizedBox(width: 10,),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "City",
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "State",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Locality / Area / Street",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Flat No / Building Name",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Landmark (optional)",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.29,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child:const Padding(
                padding: const EdgeInsets.only(top: 23,left: 16,right: 16,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Type of Address"
                    ),
                    SizedBox(height: 20,),

                    SizedBox(height: 20,),
                    const Row(
                      children: [
                       const  SizedBox(width: 10),
                       const Text(
                          'Make as default address',
                          style: TextStyle(fontSize: 17.0),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
