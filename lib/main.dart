import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
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

  double ROW_WIDTH = 400.0;
  double ROW_HEIGHT = 50.0;

  var manager = Manager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수확행"),
        centerTitle: true,
      ),
      body: Center(

          child: Column(
            children: <Widget>[

              SizedBox(
                height: 10.0,
              ),

              Container(
                decoration: BoxDecoration(
                  color: manager.data.serverBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: ROW_WIDTH,
                height: ROW_HEIGHT,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(manager.data.serverStatusText),

                      ElevatedButton.icon(
                        onPressed: () {
                          setState (() {
                            manager.updateCurrentStatus();
                          });
                        }, icon: Icon(Icons.refresh, size: 18),
                        label: Text("정보 받아오기"),
                      )
                    ]
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {

                        }, icon: Icon(Icons.build, size: 18),
                        label: Text("AI 진단"),
                      ),

                      ElevatedButton.icon(
                        onPressed: () {

                        }, icon: Icon(Icons.trending_up, size: 18),
                        label: Text("상세 정보"),
                      ),
                    ]
                ),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: ROW_WIDTH,
                height: ROW_HEIGHT,
              ),

              SizedBox(
                height: 10.0,
              ),

              Container(
                child: Text(
                  manager.data.tempStatusText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: ROW_WIDTH,
                height: ROW_HEIGHT,
              ),

              SizedBox(
                height: 10.0,
              ),

              Container(
                child: Text(
                  manager.data.humidStatusText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: ROW_WIDTH,
                height: ROW_HEIGHT,
              ),

              const SizedBox(
                height: 10.0,
              ),

              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton( onPressed: () {
                      }, child: Text('WATERPUMP'), ),

                      ElevatedButton.icon(
                        onPressed: () {
                          manager.activate(manager.data.WATERPUMP);
                        }, icon: Icon(Icons.build, size: 18),
                        label: Text("동작"),
                      )
                    ]
                ),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: ROW_WIDTH,
                height: ROW_HEIGHT,
              ),

              const SizedBox(
                height: 10.0,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: ROW_WIDTH,
                height: ROW_HEIGHT,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton( onPressed: () {
                      }, child: Text('LED'), ),

                      ElevatedButton.icon(
                        onPressed: () {
                          manager.activate(manager.data.LED);
                        }, icon: Icon(Icons.build, size: 18),
                        label: Text(manager.data.ledStatusText),
                      )
                    ]
                ),
              ),
            ],
          )
      ),
    );
  }
}
