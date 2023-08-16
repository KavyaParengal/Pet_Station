
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          title: Text('Chat With Us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.phone,color: Colors.white,),
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.yellow, Colors.green])),
          )
      ),
      body: ListView(
        padding: EdgeInsets.only(top:20, left: 20, right: 20,bottom: 80),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 80),
                child: ClipPath(
                  clipper: UpperNipMessageClipper(MessageType.receive),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(3, 3)
                        )
                      ]
                    ),
                    child: Text('Hi, how are you ?Hi, how are you ?Hi, how are you ?',style: TextStyle(
                      fontSize: 16
                    ),),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 20,left: 80),
                  child: ClipPath(
                    clipper: LowerNipMessageClipper(MessageType.send),
                    child: Container(
                      padding: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red,Colors.green]
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(3, 3)
                            )
                          ]
                      ),
                      child: Text('Hello, i amm fine !Hello, i amm fine !Hello, i amm fine !',style: TextStyle(
                          fontSize: 16,
                        color: Colors.white
                      ),),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.add,color: Colors.grey,size: 30,),
            ),
            Padding(padding: EdgeInsets.only(left: 5),
              child: Icon(Icons.emoji_emotions_outlined,color: Colors.grey,size: 30,),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width*.65,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type your message',
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Icon(Icons.send,color: Colors.grey,size: 30,),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
