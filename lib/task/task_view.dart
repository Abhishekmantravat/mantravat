import 'package:flutter/material.dart';

class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('mantravat'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("task"),
      ),
    );
  }
}