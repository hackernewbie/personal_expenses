import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';
class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'T1',
      title: 'Shoes',
      date: DateTime.now(),
      amount: 45.55,
    ),
    Transaction(
      id: 'T2',
      title: 'Shirts',
      date: DateTime.now(),
      amount: 32.55,
    ),
  ];

  void _addTransaction(String txTitle, double txAmount){
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ]
    );
  }
}
