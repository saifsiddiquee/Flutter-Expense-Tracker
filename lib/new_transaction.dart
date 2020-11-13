import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.addTxHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTxHandler;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTxHandler(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              textInputAction: TextInputAction.next,
              onEditingComplete: () => node.nextFocus(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              onPressed: () {
                _submitData();
                node.unfocus();
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
