
import 'package:flutter/material.dart';
import 'package:pet_station/design/changeAddress.dart';
import 'package:pet_station/design/orderSuccessMessage.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {

  String paymentType='';
  bool isRadioButtonSelected = false;

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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(22),
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
                            Text('Home Delivery',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.black,
                            ),),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeAddress()));
                              },
                              child: Text('Change address',style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.teal.shade800,
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text('Kavya',style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 10,),
                        Text('Parengal House, Thennala, MALAPPURAM, KERALA-676508',style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Phone : ',style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),),
                            Text('9645713419',style: TextStyle(
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
              height: MediaQuery.of(context).size.height*.07,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Expected Delivery',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                    ),),
                    Text('18th Sep',style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),),
                  ]
                ),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.07,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount Payable',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                      Text('₹999.00',style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),),
                    ]
                ),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.36,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,top: 18,bottom: 18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment Methods',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                      SizedBox(height: 15,),

                      Expanded(
                        child: RadioListTile(
                          title: Text("UPI"),
                          value: "upi",
                          contentPadding: EdgeInsets.only(left: 5),
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
                          title: Text("Cradit / Debit Card"),
                          contentPadding: EdgeInsets.only(left: 5),
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
                          title: Text("Net Banking"),
                          value: "netBanking",
                          groupValue: paymentType,
                          contentPadding: EdgeInsets.only(left: 5),
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
                          title: Text("Wallet"),
                          value: "wallet",
                          groupValue: paymentType,
                          contentPadding: EdgeInsets.only(left: 5),
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
                          title: Text("Cash on Delivery"),
                          value: "cashOnDelivery",
                          groupValue: paymentType,
                          contentPadding: EdgeInsets.only(left: 5),
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
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: () {
          // Handle the save address action
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSuccessMessage()));
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
