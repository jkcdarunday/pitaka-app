import 'package:flutter/material.dart';
import 'package:pitaka/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  TransactionListWidget({Key key, this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Transactions", style: TextStyle(fontSize: 16))),
          Expanded(
            child: ListView(
              children: transactions
                  .map((transaction) =>
                      TransactionWidget(transaction: transaction))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
