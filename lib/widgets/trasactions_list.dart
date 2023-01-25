import 'package:build101/modles/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //! const was here
  // TransactionList({super.key});

  final List<Transaction> transaction;
  TransactionList(this.transaction);

  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              // ignore: sort_child_properties_last
              child: Text(
                '\$${transaction[index].amount}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(transaction[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontFamily: 'Explora')),
              Text(
                DateFormat.yMMMd().format(transaction[index].date),
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Explora',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ])
          ]));
        },
        itemCount: transaction.length,
      ),
    );
  }
}
