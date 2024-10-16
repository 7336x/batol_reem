import 'package:batol_reem/sign_up_page.dart';
import 'package:batol_reem/splash_screen.dart';
import 'package:batol_reem/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:batol_reem/Sign-In Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}
