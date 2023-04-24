import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpense> {
  var titleInput = " ";
  void _saveTitileInput(String inputValue) {
    titleInput = inputValue;
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitileInput,
            maxLength: 60,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('save'))
            ],
          ),
        ],
      ),
    );
  }
}
