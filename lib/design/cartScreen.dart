
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List items=['naame','naame','naame','naame','naame','naame','naame'];
  double counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: (){Navigator.pop(context);},
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Column(
          children: [
            Text("Your Cart",style: TextStyle(
              color: Colors.black
            ),),
            Text("4 items",style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context,index){
                final item = items[index];
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.remove(item);
                    });
                  },

                  key: Key(item),
                  background: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3)
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete,size: 41,)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:5,left: 8,right: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Image.asset('images/cats/billy_cat1.png'),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name',style: TextStyle(fontSize: 16,color: Colors.black),maxLines: 2,),
                                SizedBox(height: 10,),
                                Text('Family Name Family',style: TextStyle(fontSize: 13,color: Colors.black),maxLines: 2,overflow: TextOverflow.visible,),
                                SizedBox(height: 10,),
                                Text.rich(TextSpan(text: "₨. 2000",style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey
                                )))
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 100,
                              height: 42,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {

                                      });
                                      counter--;
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      child: Icon(Icons.remove,color: Colors.teal.shade800,size: 18,)
                                    ),
                                  ),
                                  Text('$counter',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {

                                      });
                                      counter++;
                                    },
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Icon(Icons.add,color: Colors.teal.shade800,size: 18,)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //SizedBox(height: 20,),
                        Divider(thickness: 1,color: Colors.grey.shade200,)
                      ],
                    ),
                  ),
                );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹ 2000',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            InkWell(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width/1.9,
                decoration: BoxDecoration(
                    color: Colors.teal.shade800
                ),
                child: Center(
                  child: Text('Place order',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
