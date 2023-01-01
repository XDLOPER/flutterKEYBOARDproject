import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../main.dart';

class HOME extends StatelessWidget {
  HOME({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _themeAppBar(context),
      body: _themeAppBody(context),
      drawer: _drawer(context),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        ListTile(
          title: Text('setting', style: Theme.of(context).textTheme.headline6),
          leading: Icon(BoxIcons.bx_cog),
          onTap: (() {
            Navigator.pop(context);
          }),
        ),
        ListTile(
          title: Text('exit', style: Theme.of(context).textTheme.headline6),
          leading: Icon(BoxIcons.bx_exit),
          onTap: (() {
            SystemNavigator.pop();
          }),
        )
      ]),
    );
  }

  Widget _themeAppBody(BuildContext context) {
    return const Center(child: Text('redadwa'));
  }

  AppBar _themeAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'xastral',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
          ),
          SizedBox(width: 10, height: 10, child: CircularProgressIndicator())
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
          builder: (BuildContext context) => IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () => Scaffold.of(context).openDrawer())),
      actions: [
        IconButton(onPressed: (() => false), icon: Icon(Icons.memory_outlined)),
      ],
    );
  }
}
