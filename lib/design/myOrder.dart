
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text('My Orders',style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white
        ),),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            elevation: 2,
            pinned: true,
            leadingWidth: MediaQuery.of(context).size.width,
            backgroundColor: Colors.white,
            expandedHeight: 65.0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search your order here",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        )
                    ),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.filter_list_rounded,color: Colors.black,),
                            SizedBox(width: 4,),
                            Text('Filters',style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('images/cats/billy_cat1.png',width: 85,height: 85,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Delivered on jun 09, 2023',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),maxLines: 2,),
                                SizedBox(height: 8,),
                                Text('Name',style: TextStyle(fontSize: 15,color: Colors.grey)),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,size: 15,)
                          ],
                        ),
                      ),
                      Divider(thickness: 1,color: Colors.grey.shade300,)
                    ],
                  ),
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
