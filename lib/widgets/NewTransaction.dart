import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final int transactionId;
  final Function addTransaction;

  NewTransaction(this.transactionId, this.addTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submit() {
    double amt = double.parse(amountController.text);
    if (titleController.text.isEmpty || amt < 0) {
      return;
    }
    Transaction transaction = Transaction(
        id: transactionId.toString(),
        title: titleController.text,
        amount: double.parse(amt.toStringAsFixed(2)),
        date: DateTime.now());
    addTransaction(transaction);
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
            FlatButton(
                onPressed: submit,
                textColor: Colors.purple,
                child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
