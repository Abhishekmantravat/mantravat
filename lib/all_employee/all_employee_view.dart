import 'package:flutter/material.dart';
class all_employee extends StatefulWidget {
  const all_employee({super.key});

  @override
  State<all_employee> createState() => _all_employeeState();
}

class _all_employeeState extends State<all_employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mantravat'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("employee"),
      ),
    );
  }
}