import 'package:flutter/material.dart';
import 'package:frontend/models/employee.dart';
import 'package:frontend/services/employee_service.dart';
import 'package:frontend/widgets/employee_table.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

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
/////////////////////////////////
Future<void> _loadEmployees() async {
  
    try {
      final loadedEmp = await _employeeService.getAllEmployees();

      // if (listData == null) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   return;
      // }

      setState(() {
        _employees = loadedEmp;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = e.toString();
      });
    }
}
/////////////////////////////////////////////////////////////////////
void _removeEmployee(Employee employee) async{
  // final emp_index = _employees.indexOf(employee);

  setState(() {
    _employees.remove(employee);
  });

  print(employee.id);
  final url = Uri.parse('http://192.168.1.129:1337/api/v1/delete-employee?id=${employee.id}');

  final response = await http.post(url);
  print(response.statusCode);
}
//////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    Widget content = EmployeeTable(
      employees: _employees,
      onRemove: _removeEmployee,
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
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: () {}, //ADD EMP,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
