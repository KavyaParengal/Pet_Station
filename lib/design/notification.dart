

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<Map> notifys=[
    {'title':'Notification title','content':'Notification content','date':'2023-08-21'},
    {'title':'Notification title','content':'Notification content','date':'2023-08-21'},
    {'title':'Notification title','content':'Notification content','date':'2023-08-21'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.yellow, Colors.green])),
          )
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: notifys.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 18,right: 12,left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white60,
                      child: Icon(Icons.notifications_outlined,color: Colors.blue,size: 36,),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notifys[index]['title'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Text(notifys[index]['content'],style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                        ],
                      ),
                    ),
                    SizedBox(width: 14,),
                    Text(notifys[index]['date'],style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(height: 12,),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                )
              ],
            ),
          );
        },


      ),
    );
  }
}
