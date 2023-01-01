import 'package:flutter/material.dart';
import 'package:xastral/pages/home.dart';
import 'core/template/template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static String appTitle = 'xastral';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: TEMPLATE(),
    );
  }
}
