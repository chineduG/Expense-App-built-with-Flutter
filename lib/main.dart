import 'package:build101/widgets/new_transactions.dart';
import 'package:build101/widgets/trasactions_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'modles/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple, 
        fontFamily: 'Aboreto',
        ),
      debugShowCheckedModeBanner: false,
      
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  // const ExpenseApp({super.key});
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  //! Predefined list of transactions.
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 67.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Bags', amount: 35.89, date: DateTime.now())
  ];

//! Get user transactions.
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

//* setState(newTx); function
    setState(() {
      _userTransactions.add(newTx);
    });
  }

//! showModalBottomSheet
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Expense App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                  child: Text('CHART'), elevation: 5, color: Colors.blue),
            ),
            TransactionList(_userTransactions)
            // NewTransaction(),
            // TransactionList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
