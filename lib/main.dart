import 'package:expenses_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 69.89, title: 'OnePlus Buds', id: '1', date: DateTime.now()),
    Transaction(
        amount: 299, title: 'Apple Watch', id: '2', date: DateTime.now())
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart!!'),
                elevation: 5,
                color: Colors.purple,
              ),
            ),
            Card(
              elevation: 7,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    FlatButton(
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text);
                        },
                        textColor: Colors.purple,
                        child: Text('Add Transaction'))
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ...transactions.map((transaction) {
                  return Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 3)),
                        child: Card(
                          child: Text(
                            '\$${transaction.amount}',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(transaction.date),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey))
                        ],
                      )
                    ],
                  );
                }).toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
