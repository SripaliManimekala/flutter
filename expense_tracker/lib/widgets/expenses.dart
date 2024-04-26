import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/new_expense.dart';


class Expenses extends StatefulWidget {

  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class  _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work ),
    Expense(title: 'Trip', amount: 150.00, date: DateTime.now(), category: Category.travel ),
    Expense(title: 'Dinner', amount: 30.00, date: DateTime.now(), category: Category.food ),
    Expense(title: 'Cinnema', amount: 30.00, date: DateTime.now(), category: Category.leasure ),
    Expense(title: 'lunch', amount: 30.00, date: DateTime.now(), category: Category.food ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter ExpenseTracker',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        actions:[
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon:const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue,
        
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense,)),
        ],
      ),
    );
  }
}