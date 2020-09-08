import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions added yet!!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: 200,
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorLight,
                                width: 3)),
                        child: Card(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: Theme.of(context).textTheme.headline1)
                        ],
                      )
                    ],
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
