import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TemplatePage extends StatefulWidget {
  late final int index;
  TemplatePage({super.key, required this.index});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          'page of : ${widget.index}',
          style: theme.textTheme.headline6,
        ),
      ),
    );
  }
}
