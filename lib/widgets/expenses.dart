import 'package:expense_planner/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/model/expense.dart';
import 'package:expense_planner/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpense = [
    Expense(
      title: "flutter",
      amount: 19.99,
      category: Category.work,
      dateTime: DateTime.now(),
    ),
    Expense(
      title: "Cinema",
      amount: 19.99,
      category: Category.leistur,
      dateTime: DateTime.now(),
    ),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('expense chart'),
          Expanded(child: ExpenseList(expenses: registeredExpense)),
        ],
      ),
    );
  }
}
