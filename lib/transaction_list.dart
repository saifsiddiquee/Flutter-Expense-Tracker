import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._transactions);

  final List<Transaction> _transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 4,
            child: Row(
              children: [
                Container(
                  child: Text(
                    '৳ ${_transactions[index].amount.toStringAsFixed(2)}', //string interpolation using $ sign
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(4.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(_transactions[index].date),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: _transactions.length,
      ),
    );
  }
}
