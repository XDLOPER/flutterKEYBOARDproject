import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/template/template.dart';

class USER extends StatefulWidget {
  const USER({super.key});

  @override
  State<USER> createState() => _USERState();
}

class _USERState extends State<USER> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('user')),
        FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (() => Navigator.maybePop(context)))
      ],
    );
  }
}
