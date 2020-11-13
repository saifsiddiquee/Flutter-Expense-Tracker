import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import 'models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 'tr1',
      title: 'New Shirt',
      amount: 800,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tr2',
      title: 'New Shoes',
      amount: 2800,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
