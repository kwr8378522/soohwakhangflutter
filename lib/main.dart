import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/widget/ButtonCard.dart';
import 'package:soohwakhangflutter/widget/InfoCard.dart';
import 'package:soohwakhangflutter/widget/TitleItem.dart';

import 'manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '수확행 SERVICE',
      theme: ThemeData(
        fontFamily: 'Jalnan',
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: '수확행 SERVICE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var manager = Manager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            TitleItem(viewModel: manager.titleItemViewModel),
            ButtonCard(viewModel: manager.updateInfoViewModel),
            InfoCard(viewModel: manager.tempuratureViewModel),
            InfoCard(viewModel: manager.humidViewModel),
            InfoCard(viewModel: manager.soilMoistureViewModel),
            ButtonCard(viewModel: manager.ledViewModel),
            ButtonCard(viewModel: manager.waterpumpViewModel),
          ],
        )
    );
  }
}