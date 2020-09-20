import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController  = TextEditingController();
  DateTime _selectedDate ;

  void _presentDatePicker(){
  showDatePicker(
      context: context,
      initialDate: DateTime.now() ,
      firstDate: DateTime(2019), lastDate: DateTime.now(),
  ).then((pickedDate){
      if (pickedDate == null){
        print('User cancelled');
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
  });
  }

  void _submitData(){
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle  = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate == null){
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate
    );

    //Closes the popup after entering value
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,   //Moves the button to the end
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              onSubmitted: (_) => _submitData() ,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData() ,
            ),
            Container(
              height: 70,
              child: Expanded(
                child: Row(
                  children: [
                    Text(_selectedDate == null ? 'No Date Chosen!' : 'Selected date: ' + DateFormat.yMMMMd().format(_selectedDate)),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: _submitData,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
