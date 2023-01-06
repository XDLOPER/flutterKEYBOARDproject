import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        // template custom config
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(),
          toolbarTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 7,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          toolbarHeight: 50,
          iconTheme: IconThemeData(),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
        drawerTheme: const DrawerThemeData(
          elevation: 0,
          backgroundColor: Colors.white,
          scrimColor: Colors.white70,
        ),

        // template main config
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        iconTheme: IconThemeData(color: Colors.blue.shade500),
      ),
      home: TEMPLATE(),
    );
  }
}
