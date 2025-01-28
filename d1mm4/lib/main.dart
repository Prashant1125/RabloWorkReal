import 'package:d1mm4/homepage.dart';
import 'package:d1mm4/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import Hamburger widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D1MM4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.getPages,
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
