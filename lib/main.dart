import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mintravat_project/all_employee/all_employee_view.dart';
import 'package:mintravat_project/home/home_view.dart';
import 'package:mintravat_project/logout/logout_view.dart';
import 'package:mintravat_project/profile/edit_profiel_view.dart';
import 'package:mintravat_project/task/task_view.dart';
import 'package:mintravat_project/time_sheet/time_sheet_view.dart';
import 'home/bottom_bar.dart';
void main(){
  runApp(const Myapp(
    
  ));
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Home_view(),
      routes: {
        'all_employee':(context) =>  const all_employee(),
        'logout' :(context) =>  const logout(),
        'edit_profile':(context) =>   SettingsUI(),
        'task':(context) =>  const task(),
        'time_sheet' :(context) =>  const time_sheet(),
      },
    );
  }
}

