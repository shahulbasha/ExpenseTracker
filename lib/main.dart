import 'package:expenses_app/transaction.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Text('Chart!!'),
            ),
            Card(
              child: Column(
                children: [
                  ...transactions.map((transaction) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 3)),
                          child: Card(
                            child: Text(
                              transaction.amount.toString(),
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          padding: EdgeInsets.all(8),
                        ),
                        Column(
                          children: [
                            Text(
                              transaction.title,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Text(transaction.date.toString(),
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey))
                          ],
                        )
                      ],
                    );
                  }).toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
