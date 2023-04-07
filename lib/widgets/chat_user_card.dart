import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mantravat_project/api/model/chat_user.dart';
import 'package:mantravat_project/main.dart';

class Chat_user_card extends StatefulWidget {
  final Chatuser user;
  const Chat_user_card({super.key, required this.user});

  @override
  State<Chat_user_card> createState() => _Chat_user_cardState();
}

class _Chat_user_cardState extends State<Chat_user_card> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
            title: Text(widget.user.name),
            subtitle: Text(
              widget.user.about,
              maxLines: 1,
            ),
            trailing: Text(
              "12:00:pm",
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ),
        ));
  }
}
