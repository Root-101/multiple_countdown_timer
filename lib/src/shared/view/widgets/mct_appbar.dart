import 'package:flutter/material.dart';

class MCTAppBar extends StatelessWidget {
  String title;

  MCTAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      //actions: _actions(),
      floating: true,
      title: Text(
        title,
      ),
    );
  }
}
