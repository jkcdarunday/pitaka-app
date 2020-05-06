import 'package:flutter/material.dart';
import 'package:pitaka/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  TransactionListWidget({Key key, this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      children: transactions.map((transaction) =>
          TransactionWidget(transaction: transaction)).toList(),
    ));
  }

}