import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Account {
  Account(
      {this.id,
      this.name,
      this.value,
      this.total = false,
      this.currency = "₱"});

  int id;
  String name;
  String currency;
  double value;
  bool total;
}

class AccountWidget extends StatelessWidget {
  AccountWidget({Key key, this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: double.infinity),
        padding: const EdgeInsets.all(21.0),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: account.total
                    ? [Colors.cyanAccent, Colors.deepPurpleAccent]
                    : [Colors.greenAccent, Colors.blueAccent])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Your ${account.name} balance:",
                style: TextStyle(color: Colors.white)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  account.currency,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  NumberFormat.currency(decimalDigits: 2, symbol: '')
                      .format(account.value),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ));
  }
}
