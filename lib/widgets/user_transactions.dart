import 'package:build101/widgets/new_transactions.dart';
import 'package:build101/widgets/trasactions_list.dart';
import 'package:flutter/material.dart';

import '../modles/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        // ignore: prefer_const_constructors
        TransactionList(_userTransactions),
      ],
    );
  }
}
