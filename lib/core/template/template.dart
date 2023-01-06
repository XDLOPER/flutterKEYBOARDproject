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
    final theme = Theme.of(context);
    double _appBarHeight = 0;
    double _logoSize = 10;
    double _letterSpacing = 5;
    double _logoPadding = 10;
    double _bagMargin = 25;
    double _bagWrap = 15;
    String xastral = 'xastral';

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            //general template config
            extendBody: true,

            //static template
            appBar: _XASTRALappBar(
                logoSize: _logoSize,
                logoPadding: _logoPadding,
                xastral: xastral,
                letterSpacing: _letterSpacing,
                appBarHeight: _appBarHeight,
                bagWrap: _bagWrap,
                theme: theme,
                bagMargin: _bagMargin),
            body: _BODY(tabController: _tabController),
            drawer: _DRAWER(),

            // navigation setting
            bottomNavigationBar: _bottomAppBar(
              control: _tabController,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton:
                _floatingActionButton(tabController: _tabController)));
  }
}

// ------------ HEADER START ------------------

class _XASTRALappBar extends StatefulWidget implements PreferredSizeWidget {
  const _XASTRALappBar({
    Key? key,
    required double logoSize,
    required double logoPadding,
    required this.xastral,
    required double letterSpacing,
    required double appBarHeight,
    required double bagWrap,
    required this.theme,
    required double bagMargin,
  })  : _logoSize = logoSize,
        _logoPadding = logoPadding,
        _letterSpacing = letterSpacing,
        _appBarHeight = appBarHeight,
        _bagWrap = bagWrap,
        _bagMargin = bagMargin,
        super(key: key);

  final double _logoSize;
  final double _logoPadding;
  final String xastral;
  final double _letterSpacing;
  final double _appBarHeight;
  final double _bagWrap;
  final ThemeData theme;
  final double _bagMargin;

  @override
  State<_XASTRALappBar> createState() => _XASTRALappBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _XASTRALappBarState extends State<_XASTRALappBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: widget._logoSize.toDouble(),
              height: widget._logoSize.toDouble(),
              child: Container()),
          Padding(
            padding: EdgeInsets.only(
                left: widget._logoPadding, right: widget._logoPadding),
            child: Text(
              widget.xastral,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: widget._letterSpacing),
            ),
          ),
          SizedBox(
              width: widget._logoSize.toDouble(),
              height: widget._logoSize.toDouble(),
              child: CircularProgressIndicator.adaptive()),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: widget._appBarHeight,
      leading: Builder(
          builder: (BuildContext context) => IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () => Scaffold.of(context).openDrawer())),
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: (() => false),
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                )),
            Container(
              padding: EdgeInsets.all(3),
              width: widget._bagWrap,
              height: widget._bagWrap,
              decoration: BoxDecoration(
                color: widget.theme.backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              margin: EdgeInsets.only(
                  top: widget._bagMargin, left: widget._bagMargin),
              child: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Center(
                  child: Text(
                    '11',
                    style: TextStyle(
                        color: widget.theme.colorScheme.onSurface,
                        fontSize: 5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

// drawer start
class _DRAWER extends StatelessWidget {
  const _DRAWER({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

// actionButton start
class _floatingActionButton extends StatelessWidget {
  const _floatingActionButton({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (() => _tabController.animateTo(1)),
        child: ClipOval(
          child: Image.asset(
            'assets/images/avatar.png',
            height: 200,
            width: 100,
            fit: BoxFit.cover,
          ),
        ));
  }
}

// menuBar start two selection
class _bottomAppBar extends StatelessWidget {
  late final TabController control;
  _bottomAppBar({Key? key, required this.control}) : super(key: key);

  double _notchWidth = 10;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: _notchWidth,
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

// ------------ BODY START ------------------

// body start
class _BODY extends StatelessWidget {
  const _BODY({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [HOME(), USER(), SERVICES()],
    );
  }
}
