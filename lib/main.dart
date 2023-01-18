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
        id: 't1', title: 'New Shoes', amount: 67.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Bags', amount: 35.89, date: DateTime.now())
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
            child: const Card(
                child: Text('CHART'), elevation: 5, color: Colors.blue),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    tx.date.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ])
              ]));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
