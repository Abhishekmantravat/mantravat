import 'package:flutter/material.dart';

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('mantravat'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("logout"),
      ),
    );
  }
}