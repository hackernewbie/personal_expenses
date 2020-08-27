import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        /*'Rs.' + txn.amount.toString(),*/
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
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
                          transactions[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transactions[index].date),
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
          },
          itemCount: transactions.length,
          //children: transactions.map((txn) {

          //).toList(),
        ),
    );
  }
}