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
        resizeDuration: const Duration(seconds: 1),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.8),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          child: Center(child:  Text("Expense Deleted", style: Theme.of(context).textTheme.titleLarge,)),
        ),
        key: ValueKey(ExpenseItems(
          expenses[index],
        )),
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
