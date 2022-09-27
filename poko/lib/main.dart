// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:poko/screens/Detailscreen.dart';
import 'package:poko/screens/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'circula'),
        home: Mainscreen());
  }
}
