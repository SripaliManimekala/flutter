import 'package:flutter/material.dart';
import 'package:frontend/widgets/employee_table.dart';
import 'package:frontend/data/employees.dart';

class EmployeeScreen extends StatefulWidget {

  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() {
    return _EmployeeScreenState();
  }
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: () {},//ADD EMP, 
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const EmployeeTable(employees: employees,),
    );
  }
}