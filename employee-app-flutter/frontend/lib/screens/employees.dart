import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/models/employee.dart';
import 'package:frontend/screens/new_employee.dart';
import 'package:frontend/services/employee_service.dart';
import 'package:frontend/widgets/employee_table.dart';


class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() {
    return _EmployeeScreenState();
  }
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<Employee> _employees = [];
  bool _isLoading = true;
  String? _error;

  final EmployeeService _employeeService = EmployeeService();//emp service instance

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }
/////////////////////////////////////////////////////////////////
Future<void> _loadEmployees() async { 
    try {
      final loadedEmp = await _employeeService.getAllEmployees();
      if (loadedEmp == null) {
        setState(() {
          _isLoading = false;
        });
        return;
      }
      setState(() {
        _employees = loadedEmp;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        if(error is SocketException) {
          _isLoading = false;
          _error = 'Connection timed out.Please check your internet connection.';
        } else {
          _error = error.toString().split(": ")[1];
        }
      });
    }
}
/////////////////////////////////////////////////////////////////////
void _removeEmployee(Employee employee) async{
  // final emp_index = _employees.indexOf(employee);

  try {
  setState(() {
    _employees.remove(employee);
  });
  await _employeeService.deleteEmployee(employee.id);
  } catch(error) {
    setState(() {
      _error = error.toString().split(": ")[1];
    });
  }
 
}
//////////////////////////////////////////////////////////////////
void _addEmployeeLocally() async {
  final newEmp = await Navigator.of(context).push<Employee>(
    MaterialPageRoute(builder: (ctx) => const NewEmployeeScreen())
  );
  print(newEmp);
  if(newEmp == null) {
    return;
  }
  setState(() {
    _employees.add(newEmp);
  });
}
//////////////////////////////////////////////////////////////////
void _editEmployee(Employee employee) async {
  final updatedEmp = await Navigator.of(context).push<Employee>(MaterialPageRoute(
    builder: (context) => NewEmployeeScreen(employee: employee,)));
  if(updatedEmp == null) {
    return;
  }
  setState(() {
    int index = _employees.indexWhere((emp) => emp.id == updatedEmp.id);
    _employees[index] = updatedEmp;
  });
}
//////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    Widget content = EmployeeTable(
      employees: _employees,
      onRemove: _removeEmployee,
      onEdit: _editEmployee,
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (_employees.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try adding employee!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ));
    }

    if (_error != null && _isLoading == true) {
      content = Center(
        child: Text(_error!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        // backgroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: _addEmployeeLocally, //ADD EMP,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
