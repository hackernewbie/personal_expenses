import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import 'models/transaction.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontFamily: 'OpenSans',
            fontSize: 20,
            )
          ))
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //String titleInput;
  //String amountInput;
  //final titleController = TextEditingController();
  //final amountController = TextEditingController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [

  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

    void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
      return GestureDetector(
          child: NewTransaction(_addTransaction),
        onTap: () {},
        behavior: HitTestBehavior.opaque,
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Flutter Expenses App',
        style: TextStyle(
            fontFamily: 'Open Sans'
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                  child: Text('Chart area!'),
                  elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}