import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../main.dart';

class HOME extends StatelessWidget {
  const HOME({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: themeAppBar(context),
      body: themeAppBody(context),
    );
  }

  Widget themeAppBody(BuildContext context) {
    return const Center(child: Text('redadwa'));
  }

  AppBar themeAppBar(BuildContext context) {
    return AppBar(
      title: Text(MyApp.appTitle),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.ac_unit),
      actions: [
        const Center(
            child: SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(),
        )),
        IconButton(
            onPressed: (() => false),
            icon: Icon(Icons.subdirectory_arrow_left)),
      ],
    );
  }
}
