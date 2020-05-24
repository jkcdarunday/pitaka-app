import 'package:flutter/material.dart';
import 'package:pitaka/account.dart';
import 'package:pitaka/accountlist.dart';
import 'package:pitaka/transaction.dart';
import 'package:pitaka/transactionlist.dart';

void main() => runApp(PitakaApp());

class PitakaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pitaka',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MainPage(title: 'Pitaka'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var accounts = [
    Account(id: 1, name: "total", value: 10000, total: true),
    Account(id: 2, name: "Security Bank", value: 100100),
    Account(id: 3, name: "BDO", value: 1234),
  ];

  List<Transaction> transactions = [
    Transaction(id: 1, accountId: 2, description: "Buy rice", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy food", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Get salary", amount: 30000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy fridge", amount: -40000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy rice", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy food", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Get salary", amount: 30000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy fridge", amount: -40000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy rice", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy food", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Get salary", amount: 30000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy fridge", amount: -40000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 2, description: "Buy rice", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy food", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Get salary", amount: 30000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy fridge", amount: -40000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy rice", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy food", amount: -400, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Get salary", amount: 30000, timestamp: DateTime.now()),
    Transaction(id: 1, accountId: 3, description: "Buy fridge", amount: -40000, timestamp: DateTime.now()),
  ];

  List<Transaction> visibleTransactions = [];

  @override
  void initState() {
    visibleTransactions = transactions;
  }

  void onAccountChange(int id) {
    setState(() {
      var account = accounts.firstWhere((account) => account.id == id);
      visibleTransactions = account.total
          ? transactions
          : transactions
              .where((transaction) => transaction.accountId == id)
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Pitaka"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AccountListWidget(accounts: accounts, onChange: onAccountChange),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text("Transactions", style: TextStyle(fontSize: 16))),
            TransactionListWidget(transactions: visibleTransactions)
          ],
        ),
      ),
    );
  }
}
