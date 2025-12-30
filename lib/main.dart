import 'package:attendance_system/screens/home_screen.dart';
import 'package:attendance_system/screens/test_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// getData() async {
//   Dio dio = Dio();
//   final Response response = await dio.get("https://dummyjson.com/user");
//   print(response);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
      // home: TestScreen(),
    );
  }
}
