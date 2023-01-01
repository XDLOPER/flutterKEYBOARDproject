import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SERVICES extends StatefulWidget {
  const SERVICES({super.key});

  @override
  State<SERVICES> createState() => _SERVICESState();
}

class _SERVICESState extends State<SERVICES> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('SERVICES')),
        ],
      ),
    );
  }
}
