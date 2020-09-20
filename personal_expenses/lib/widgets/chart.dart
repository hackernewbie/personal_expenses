import 'package:flutter/material.dart';
import '../widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {               //This is a loop which runs from 0 to 6 and subtracts the number of days from today
      final weekDay = DateTime.now().subtract(
        Duration(
            days: index
        ),);

      var totalSum = 0.0;

      for (var i=0; i < recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day
            && recentTransactions[i].date.month == weekDay.month
            && recentTransactions[i].date.year == weekDay.year){
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'day':DateFormat.E().format(weekDay).substring(0,1),                    //Shortcut for day name. M- Monday, T - Tuesday...
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: groupedTransactionValues.map((data) {
            //return Text(data['day'].toString() + " : " + data['amount'].toString());
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending
              ),
            );
          }).toList(),
        ),
      ),
    );

  }
}
