import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/NewTransaction.dart';
import 'widgets/transactionList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.black,
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(title: TextStyle(fontFamily: 'Roboto', fontSize: 20)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
          fontFamily: 'Roboto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        amount: 69.89, title: 'OnePlus Buds', id: '1', date: DateTime.now()),
    Transaction(
        amount: 299, title: 'Apple Watch', id: '2', date: DateTime.now())
  ];

  void addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(transactions.length, addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddNewTransaction(context))
        ],
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
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            TransactionList(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
