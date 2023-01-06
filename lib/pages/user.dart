import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icons_plus/icons_plus.dart';
import 'dart:math';

import '../core/template/template.dart';

class USER extends StatefulWidget {
  const USER({super.key});

  @override
  State<USER> createState() => _USERState();
}

class _USERState extends State<USER> {
  @override
  Widget build(BuildContext context) {
    final double _stackHeightWrapper = 250;
    final double _stackHeightConsumer = 150;
    final double _circleSize = 100;
    final double _circleInPadding = 5;
    final double _detailBarSize = 100;
    final double _detailBarPadding = 50;
    final double _generateHeight = _stackHeightConsumer - (_circleSize / 2);

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: _stackHeightWrapper,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: _stackHeightConsumer,
                child: Image.asset(
                  'assets/images/wrapper.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: _detailBarPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(BoxIcons.bx_heart), Text('334')],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(BoxIcons.bx_health), Text('334')],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(
                    top: (_stackHeightConsumer - _detailBarSize)),
                height: _detailBarSize,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color.fromARGB(0, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    transform: GradientRotation(0),
                  ),
                ),
              ),
              Container(
                width: _circleSize,
                height: _circleSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.blue, Colors.yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                margin: EdgeInsets.only(top: _generateHeight),
                child: Container(
                  padding: EdgeInsets.all(_circleInPadding),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
