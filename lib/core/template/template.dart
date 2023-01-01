import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../pages/home.dart';
import '../../pages/user.dart';
import '../../pages/services.dart';

class TEMPLATE extends StatefulWidget {
  TEMPLATE({super.key});

  @override
  State<TEMPLATE> createState() => _TEMPLATEState();
}

class _TEMPLATEState extends State<TEMPLATE> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          //template config
          extendBody: true,

          //static template
          appBar: _themeAppBar(context),
          body: _themeAppBody(context),
          drawer: _drawer(context),

          // navigation
          bottomNavigationBar: _bottomAppBar(
            control: _tabController,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: (() => _tabController.animateTo(1)),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 200,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              )),
        ));
  }

  //drawer start
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

  // body start
  Widget _themeAppBody(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [HOME(), USER(), SERVICES()],
    );
  }

  // appBar start
  AppBar _themeAppBar(BuildContext context) {
    String xastral = 'xastral';
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoSizedBox(width: 10, height: 10, child: Container()),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              xastral,
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
          ),
          logoSizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator.adaptive()),
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

  SizedBox logoSizedBox(
      {required width, required height, required Widget child}) {
    return SizedBox(
        width: width.toDouble(), height: height.toDouble(), child: child);
  }
}

// menuBar two selection

class _bottomAppBar extends StatelessWidget {
  late final TabController control;
  _bottomAppBar({Key? key, required this.control}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10,
      shape: CircularNotchedRectangle(),
      child: TabBar(
        controller: control,
        tabs: [
          Tab(
            icon: Icon(
              BoxIcons.bx_home_circle,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          Tab(
            child: Container(),
          ),
          Tab(
            icon: Icon(
              BoxIcons.bx_shield_alt_2,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}

class _navigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == _navigateItem.home.index) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return HOME();
            }));
          } else if (value == _navigateItem.user.index) {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return USER();
            })));
          } else if (value == _navigateItem.blog.index) {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
              return SERVICES();
            })));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: _iconColor(context,
                  color: Theme.of(context).iconTheme.color,
                  icon: BoxIcons.bx_home),
              label: _navigateItem.home.name),
          BottomNavigationBarItem(
              icon: _iconColor(context,
                  color: Theme.of(context).iconTheme.color,
                  icon: BoxIcons.bx_user_circle),
              label: _navigateItem.user.name),
          BottomNavigationBarItem(
              icon: _iconColor(context,
                  color: Theme.of(context).iconTheme.color,
                  icon: BoxIcons.bxl_blogger),
              label: _navigateItem.blog.name)
        ]);
  }

  Icon _iconColor(BuildContext context, {required icon, required color}) =>
      Icon(icon, color: color);
}

enum _navigateItem { home, user, blog }
