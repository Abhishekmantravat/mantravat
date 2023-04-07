// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_project/api/api.dart';
import 'package:mantravat_project/api/model/chat_user.dart';
import 'package:mantravat_project/widgets/chat_user_card.dart';

import '../main.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Chatuser> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: Text("send"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            // await Api.auth.signOut();
            // await GoogleSignIn().signOut();
            await FirebaseFirestore.instance.collection('user').add
            ({
               'id' : " 232323ws" ,
    "pushToken" :" ",
    "about" : "happy day",
    "email" : "Agmail.com",
    "lastActive" : "time",
    "name" : "Raman",
    "isonline" : "false",
    "image" :"https/wewewd",
    "createdAt" :"Raman",
            });
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),

// use
// final services=snapshot.data!.docs;
// // return Text('${services.length}');
// return ListView.builder(
//   itemCount: services.length,
//   itemBuilder: (context, index) {
//     return ListTile(
// leading: const Icon(Icons.person),
// title:Text(services[index]['name']) ,
// subtitle:Text('${services[index]['mark']} year old') ,
//     );
//   },
// );
//  },
//)

      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("user").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              // check firebase data is loding
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());

              // check data loaded 
              case ConnectionState.active:
              case ConnectionState.done:

                // if (snapshot.hasData) {
                final data = snapshot.data?.docs;
                list = data?.map((e) => Chatuser.fromJson(e.data())).toList() ??[];
                print(list);
                // for (var i in data!) {
                //   print(jsonEncode(i.data()));
                // }
                // }

                //  check user is not empty

                if (list.isNotEmpty) {
                  return ListView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.only(top: mq.height * .02),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Chat_user_card(user: list[index]);

                        //show name data in firebase
                        // return Text("name :${data[index]['name']}");
                      });

                  // user is empty show no collection found
                } else {
                  return const Center(
                    child: Text(
                      "No Collection Found",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
            }
          }),
    );
  }
}
