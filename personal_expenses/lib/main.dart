import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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

  final List<Transaction> transactions  = [
    Transaction(
      id:'t1',
      title: 'Shoes',
      amount: 69.99,
      date: DateTime.now()
    ),

    Transaction(
        id:'t2',
        title: 'Groccery',
        amount: 19.99,
        date: DateTime.now()
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Flutter Expenses App'),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
                color: Colors.pinkAccent,
                child: Text('Chart area!'),
                elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((txn) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        /*'Rs.' + txn.amount.toString(),*/
                        '\$${txn.amount}',
                        style: TextStyle(
                          fontWeight:  FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurple,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          txn.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                            DateFormat.yMMMd().format(txn.date),
                            style: TextStyle(
                              fontWeight:  FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                        ),
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          ),
        ],
      )
    );
  }
}