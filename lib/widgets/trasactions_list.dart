import 'package:build101/modles/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //! const was here
  // TransactionList({super.key});

  final List<Transaction> transaction;

  TransactionList(this.transaction);

  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
        return Card(
            child: Row(children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            // ignore: sort_child_properties_last
            child: Text(
              '\$${tx.amount}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(tx.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(
              DateFormat.yMMMd().format(tx.date),
              style: TextStyle(color: Colors.grey),
            ),
          ])
        ]));
      }).toList(),
    );
  }
}
