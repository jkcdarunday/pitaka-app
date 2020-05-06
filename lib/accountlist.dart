import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'account.dart';

class AccountListWidget extends StatefulWidget {
  AccountListWidget({Key key, this.accounts, this.onChange}) : super(key: key);
  final List<Account> accounts;
  final ValueChanged<int> onChange;

  @override
  State<StatefulWidget> createState() {
    return AccountListWidgetState();
  }
}

class AccountListWidgetState extends State<AccountListWidget> {
  List<Account> get accounts => widget.accounts ?? [];
  ValueChanged<int> get onChange => widget.onChange ?? () => {};
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
            height: 130,
            aspectRatio: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                onChange(accounts[index].id);
                _current = index;
              });
            }),
        items:
            accounts.map((account) => AccountWidget(account: account)).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: accounts.map((account) {
          int index = accounts.indexOf(account);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(128, 128, 128, 0.9)
                  : Color.fromRGBO(128, 128, 128, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
