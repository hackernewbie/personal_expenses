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
        child: transactions.isEmpty
            ? Column(children: <Widget>[
                Text('No Transactions',
                  style: Theme.of(context).textTheme.title,
                ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover),
              ),
        ],
        ) : ListView.builder(
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
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor ,
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: Theme.of(context).textTheme.subtitle2,
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