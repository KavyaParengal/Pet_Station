import 'package:flutter/material.dart';
import 'package:pet_station/config/constants.dart';
import 'package:pet_station/screens/SingleFoodScreen.dart';
import 'package:pet_station/screens/single_pet.dart';
import 'package:pet_station/models/orderItems.dart';
import 'package:pet_station/services/viewOrders.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<OrderData> _orderItems = [];
  List<OrderData> filterdlist = [];
  TextEditingController breedController = TextEditingController();

  Future<void> fetchOrderItems() async {
    ViewOrderItems viewOrderItems = ViewOrderItems();
    List<OrderData> data = await viewOrderItems.getOrderItems();

    setState(() {
      _orderItems = data;
      filterdlist = _orderItems;
    });

    getSearch();
  }

  getSearch() {
    if (mounted) {
      breedController.addListener(() {
        setState(() {
          filterdlist = _orderItems
              .where((element) =>
              element.breed!
                  .toLowerCase()
                  .contains(breedController.text.toLowerCase()))
              .toList();
          if (filterdlist.isEmpty) {
            filterdlist = [];
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchOrderItems();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
        ),
      ),
      body: filterdlist.isNotEmpty
          ? CustomScrollView(
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
                          border: Border.all(color: Colors.grey.shade300)),
                      child: TextField(
                        controller: breedController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search your order here",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    filterdlist[index].category == "Food"
                        ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleFoodScreen(
                                foodId:
                                filterdlist[index].productId!)))
                        : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SinglePet(pid: filterdlist[index].productId!)));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              APIConstants.url +
                                  filterdlist[index].image.toString(),
                              width: 85,
                              height: 85,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery with in ${filterdlist[index].expday.toString()} days',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  filterdlist[index].breed.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: itemWidth,
                                  ),
                                  child: Text(
                                    filterdlist[index].productName.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      )
                    ],
                  ),
                );
              },
              childCount: filterdlist.length,
            ),
          )
        ],
      )
          : filterdlist.isEmpty
          ? Center(child: Text('No Order Items'))
          : Center(child: CircularProgressIndicator()),
    );
  }
}
