import 'package:expense_planner/model/expense.dart';
import 'package:expense_planner/widgets/expenses_list/expense_items.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses});

  List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItems(
        expenses[index],
      ),
    );
  }
}
