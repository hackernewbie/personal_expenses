import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Flutter Expenses App'),
    ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
                color: Colors.pinkAccent,
                child: Text('Chart area!'),
                elevation: 5,
            ),
          ),
          Card(
            child: Text('List of transactions'),
          ),
        ],
      )
    );
  }
}