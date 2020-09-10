import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final int transactionId;
  final Function addTransaction;

  NewTransaction(this.transactionId, this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

  void chooseDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;
      });
    });
  }

  void submit() {
    double amt = double.parse(amountController.text);
    if (titleController.text.isEmpty || amt < 0 || selectedDate == null) {
      return;
    }
    Transaction transaction = Transaction(
        id: widget.transactionId.toString(),
        title: titleController.text,
        amount: double.parse(amt.toStringAsFixed(2)),
        date: selectedDate);
    widget.addTransaction(transaction);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => submit(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      selectedDate == null
                          ? 'No Date chosen'
                          : DateFormat.yMMMd().format(selectedDate),
                      style: Theme.of(context).textTheme.headline2),
                ),
                FlatButton(
                  onPressed: chooseDate,
                  child: Text('Choose a date'),
                  textTheme: ButtonTextTheme.normal,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
                onPressed: submit,
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
