import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  // TextController
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleControler,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountControler,
          ),
          ElevatedButton(
            child: Text('Add Transaction'),
            onPressed: () {
              addTx(titleControler.text, double.parse(amountControler.text));
            },
          )
        ]),
      ),
    );
  }
}
