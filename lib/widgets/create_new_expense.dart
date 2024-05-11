import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class CreateNewExpense extends StatefulWidget {
  const CreateNewExpense({super.key});
  @override
  State<CreateNewExpense> createState() {
    return _CreateNewState();
  }
}

class _CreateNewState extends State<CreateNewExpense> {
  DateTime? _selectedDate;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _showCalender() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixText: "Rs. ", label: Text("Amount")),
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No selected Date'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _showCalender,
                      icon: const Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Submit')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
