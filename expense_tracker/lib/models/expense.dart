
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leasure, work}

const categoryIcons = {

  Category.food : Icons.lunch_dining ,
  Category.travel: Icons.flight_takeoff,
  Category.leasure : Icons.movie,
  Category.work   : Icons.work,

};

class Expense {

  //constructor
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => formatter.format(date);
}

//add new data model for charts
class ExpenseBucket {//we need one bucket for every category

  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for(final expense  in expenses) {
      sum += expense.amount;
    }
    return sum;
  } 
}