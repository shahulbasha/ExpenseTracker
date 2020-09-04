import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/NewTransaction.dart';
import 'package:expenses_app/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(transactions.length, addTransaction),
        TransactionList(transactions)
      ],
    );
  }
}
