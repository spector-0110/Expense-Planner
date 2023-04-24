import 'package:flutter/material.dart';
import 'package:expense_planner/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final Function(Expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final start = DateTime(now.year - 40, now.month, now.day);
    final end = DateTime(now.year + 10, now.month, now.day);
    var pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: start, lastDate: end);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpense() {
    final enteredAmount = double.parse(_amountController.text);
    final amountIsInvalid = enteredAmount ==  null || enteredAmount <= 0;
    final titleIsInvalid = _titleController.text.trim().isEmpty;
    final dateIsInvalid = _selectedDate == null;
    if (titleIsInvalid || amountIsInvalid || dateIsInvalid) {
      // condition for false input
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('enter correct date and time and amount'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('okay'))
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
        amount: enteredAmount,
        title: _titleController.text,
        dateTime: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'no date selected'
                        : formatter.format(_selectedDate!)),
                    /* " ! " is used so that we can force dart to assume its value wont be null */

                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
