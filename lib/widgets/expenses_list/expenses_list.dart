import 'package:expense_planner/model/expense.dart';
import 'package:expense_planner/widgets/expenses_list/expense_items.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          ExpenseItems(
            expenses[index],
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItems(
          expenses[index],
        ),
      ),
    );
  }
}
