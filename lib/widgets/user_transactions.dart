import 'package:build101/widgets/new_transactions.dart';
import 'package:build101/widgets/trasactions_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        // ignore: prefer_const_constructors
        TransactionList(),

      ],
    );
  }
}
