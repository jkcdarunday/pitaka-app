import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  Transaction(
      {this.id,
      this.accountId,
      this.description = '',
      this.category = 'Others',
      this.amount = 0,
      this.timestamp});

  final int id;
  final int accountId;
  final String description;
  final String category;
  final double amount;
  final DateTime timestamp;
}

class TransactionWidget extends StatelessWidget {
  TransactionWidget({Key key, this.transaction, this.currency})
      : super(key: key);

  final String currency;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    String amountAbs = NumberFormat.currency(symbol: '', decimalDigits: 2)
        .format(transaction.amount.abs());
    String amountText = transaction.amount < 0 ? "($amountAbs)" : amountAbs;
    Color amountColor =
        transaction.amount < 0 ? Colors.redAccent : Colors.lightGreenAccent;

    return Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Container(
            constraints: BoxConstraints(minWidth: double.infinity),
            padding: const EdgeInsets.all(21.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("${transaction.description}"),
                    Text(amountText, style: TextStyle(color: amountColor)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${transaction.category}'),
                    Text(
                        DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY)
                            .add_jm()
                            .format(transaction.timestamp),
                        style: TextStyle(fontSize: 11))
                  ],
                ),
              ],
            )));
  }
}
