import 'package:build101/modles/transaction.dart';
import 'package:build101/widgets/trasaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // TextController

   final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Expense App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: const Card(
                child: Text('CHART'), elevation: 5, color: Colors.blue),
          ),
          Card(
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
                    print(titleControler.text);
                  },
                )
              ]),
            ),
          ),
         TransactionList(),
        ],
      ),
    );
  }
}
