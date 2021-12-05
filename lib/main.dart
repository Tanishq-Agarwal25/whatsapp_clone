import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
          primaryColor: Color(0xFF675E54), accentColor: Color(0xFF123C7E)),
      home: HomeScreen(),
    );
  }
}
