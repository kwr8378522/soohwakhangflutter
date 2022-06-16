import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/widget/ButtonCard.dart';
import 'package:soohwakhangflutter/widget/GraphCard.dart';
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

            // SERVER STATUS
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 4,
                    color: Color.fromARGB(20, 0, 0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 8)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  manager.updateInfoViewModel.title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        ElevatedButton.icon( onPressed: () {
                          setState(() {
                            manager.updateInfoViewModel.onButtonClicked();
                          });
                        },
                          icon: Icon(manager.updateInfoViewModel.buttonIcon, size: 18),
                          label: Text(manager.updateInfoViewModel.buttonText),
                          style: TextButton.styleFrom(
                            primary: Colors.green[200],
                            backgroundColor: Colors.green[400],),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, bottom : 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded( child :Text(
                          manager.updateInfoViewModel.description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.green[400],
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),

            InfoCard(viewModel: manager.tempuratureViewModel),
            InfoCard(viewModel: manager.humidViewModel),
            InfoCard(viewModel: manager.soilMoistureViewModel),
            ButtonCard(viewModel: manager.ledViewModel),
            ButtonCard(viewModel: manager.waterpumpViewModel),
            GraphCard(viewModel: manager.graphViewModel),
          ],
        )
    );
  }
}