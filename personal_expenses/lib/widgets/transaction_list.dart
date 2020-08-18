import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransaction.map((txn) {
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
    );
  }
}
