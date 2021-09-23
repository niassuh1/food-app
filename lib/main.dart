import 'package:delivery/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFF4444),
        accentColor: Color(0xFFCF184A),
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 14),
        ),
      ),
      home: Home(),
    );
  }
}
