import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter course",
        amount: 300,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Movie - Hacksaw Ridge",
        amount: 400,
        date: DateTime.now(),
        category: Category.leisure)
  ];
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
