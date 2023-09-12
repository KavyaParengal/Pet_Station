
import 'package:flutter/material.dart';
import 'package:pet_station/design/deliveryAddress.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  String address = '';
  bool isRadioButtonSelected = false;
  int selectedAddressIndex = -1;

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
      body: ListView.builder(
        // Remove shrinkWrap: true if not needed
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
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
                                'Kavya',
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
                                  'Parengal House, Thennala, MALAPPURAM, KERALA-676508',
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
                                    '9645713419',
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
                        onPressed: () {},
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
          );
        },
      ),
    );
  }
}


