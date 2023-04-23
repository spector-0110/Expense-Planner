import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('expense chart'),
          Text('expense data'),
        ],
      ),
    );
  }
}
