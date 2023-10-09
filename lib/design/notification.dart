import 'package:flutter/material.dart';
import 'package:pet_station/models/notification.dart';
import 'package:pet_station/services/viewNotifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notificationDetails = [];

  Future<void> fetchNotificationItems() async {
    List<NotificationModel> data = await ViewNotificationAPI.getNotifications();
    setState(() {
      notificationDetails = data;
      print(notificationDetails);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotificationItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        toolbarHeight: 60,
        title: Text('Notifications'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: _buildNotificationList(),
    );
  }

  Widget _buildNotificationList() {
    if (notificationDetails.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: notificationDetails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 18, right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white60,
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.teal.shade800,
                        size: 36,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notificationDetails[index].notificationTitle.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            notificationDetails[index].notificationContent.toString(),
                            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(notificationDetails[index].date.toString(), style: TextStyle(fontSize: 15)),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                )
              ],
            ),
          );
        },
      );
    } else if (notificationDetails.isEmpty) {
      return Center(child: Text('No Notifications'));
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
