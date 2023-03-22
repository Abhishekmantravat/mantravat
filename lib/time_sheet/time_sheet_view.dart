import 'package:flutter/material.dart';

class time_sheet extends StatefulWidget {
  const time_sheet({super.key});

  @override
  State<time_sheet> createState() => _time_sheetState();
}

class _time_sheetState extends State<time_sheet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('mantravat'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Time_sheet"),
      ),
    );
  }
}