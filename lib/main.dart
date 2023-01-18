import 'package:build101/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  // Tramsaction
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 67.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Bags', amount: 35.00, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Expense App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
                child: const Text('CHART'), elevation: 5, color: Colors.blue),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(children: [
                Container(child: Text(tx.amount.toString())),
                Column(children: [
                  Text(tx.title),
                  Text(tx.date.toString()),
                ])
              ]));
            }).toList(),
          )
        ],
      ),
    );
  }
}
