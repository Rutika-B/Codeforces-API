import 'package:flutter/material.dart';
import 'package:rest_api2/codeforces.dart';
import 'package:rest_api2/codeforces_search_user.dart';
import 'package:rest_api2/example_2.dart';
import 'package:rest_api2/example_3.dart';
import 'package:rest_api2/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.pink,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const codeforces(id: 1000),
      home: const searchUser(),
    );
  }
}
