import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateNewExpense extends StatefulWidget {
  const CreateNewExpense({super.key});
  @override
  State<CreateNewExpense> createState() {
    return _CreateNewState();
  }
}

class _CreateNewState extends State<CreateNewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
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
          Expanded(
              child: Row(
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixText: "Rs. ", label: Text("Amount")),
              ),
            ],
          )),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Submit')),
              ElevatedButton(onPressed: () {}, child: const Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
