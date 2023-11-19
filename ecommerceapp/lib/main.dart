import 'package:ecommerceapp/screens/login_screen.dart';
import 'package:ecommerceapp/screens/profile_menu_screen.dart';
import 'package:ecommerceapp/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping Application',
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}

