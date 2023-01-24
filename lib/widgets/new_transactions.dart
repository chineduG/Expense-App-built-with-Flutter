import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // TextController
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

//! Refactoring code to call from other functions.
  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);

//! to pop out a screen
    Navigator.of(context).pop(); 
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            controller: titleControler,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
            controller: amountControler,
            //! subData function
            onSubmitted: (_) => submitData,
          ),
          ElevatedButton(
            child: Text('Add Transaction'),
            onPressed: submitData,
          )
        ]),
      ),
    );
  }
}
