import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:xastral/pages/templatePage/templatePage.dart';
import '../product/custom_card.dart';

class SERVICES extends StatefulWidget {
  const SERVICES({super.key});

  @override
  State<SERVICES> createState() => _SERVICESState();
}

class _SERVICESState extends State<SERVICES> {
  @override
  Widget build(BuildContext context) {
    final double _height = 130;
    final double _pagePadding = 30;
    final double _minLeadingWidth = 20;
    final double _carButtomPadding = 0;
    final theme = Theme.of(context);

    return _ListToServiceAndSeperate(
        pagePadding: _pagePadding,
        carButtomPadding: _carButtomPadding,
        minLeadingWidth: _minLeadingWidth,
        height: _height,
        theme: theme);
  }
}

class _ListToServiceAndSeperate extends StatelessWidget {
  const _ListToServiceAndSeperate({
    Key? key,
    required double pagePadding,
    required double carButtomPadding,
    required double minLeadingWidth,
    required double height,
    required this.theme,
  })  : _pagePadding = pagePadding,
        _carButtomPadding = carButtomPadding,
        _minLeadingWidth = minLeadingWidth,
        _height = height,
        super(key: key);

  final double _pagePadding;
  final double _carButtomPadding;
  final double _minLeadingWidth;
  final double _height;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _ListToService(
            index: index,
            pagePadding: _pagePadding,
            carButtomPadding: _carButtomPadding,
            minLeadingWidth: _minLeadingWidth,
            height: _height,
            theme: theme);
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
          endIndent: 100,
          indent: 100,
        );
      },
      itemCount: 3,
      padding: EdgeInsets.all(_pagePadding),
    );
  }
}

class _ListToService extends StatelessWidget {
  late final int index;
  _ListToService({
    Key? key,
    required double pagePadding,
    required double carButtomPadding,
    required double height,
    required this.theme,
    required double minLeadingWidth,
    required this.index,
  })  : _pagePadding = pagePadding,
        _carButtomPadding = carButtomPadding,
        _height = height,
        _minLeadingWidth = minLeadingWidth,
        super(key: key);

  final double _pagePadding;
  final double _carButtomPadding;
  final double _height;
  final ThemeData theme;
  final double _minLeadingWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _carButtomPadding),
      child: CustomCard(
        width: MediaQuery.of(context).size.width,
        height: _height,
        background: theme.cardColor,
        child: ListTile(
          leading: Icon(BoxIcons.bxs_keyboard),
          iconColor: theme.iconTheme.color,
          minLeadingWidth: _minLeadingWidth,
          title: Text('KEYBOARD'),
          trailing: Icon(BoxIcons.bx_arrow_to_right),
          subtitle: Text('bluetooth ile sanal klavye'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TemplatePage(index: index)));
          },
        ),
      ),
    );
  }
}
