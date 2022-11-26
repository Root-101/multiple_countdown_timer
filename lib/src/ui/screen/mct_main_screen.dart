import 'package:flutter/material.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTMainScreen extends StatelessWidget {
  static const ROUTE_NAME = "/mct-homepage-screen";

  MCTMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: MCTMainBody(),
      floatingActionButton: MCTCreateButton(),
    );
  }
}
