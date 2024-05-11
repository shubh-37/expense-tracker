import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, super.key, required this.removeExpense});
  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(expenses[index]),
              child: ExpenseItem(expenses[index]),
              onDismissed: (duration) {
                removeExpense(expenses[index]);
              },
            ));
  }
}
