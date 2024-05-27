
import 'package:flutter/material.dart';
import 'package:frontend/models/employee.dart';
import 'package:frontend/services/employee_service.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({super.key});

  @override
  State<NewEmployeeScreen> createState() {
    return _NewEmployeeScreenState();
  }
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredCode = '';
  var _enteredEmail = '';
  var _enteredMobile = '';
  var _enteredSalary = 0;
  var _isSending = false;
  String? _error;
  bool error = false;
  List<Map<String, dynamic>> departments = [
    {
      'id': 1,
      'name': 'Development',
    },
    {
      'id': 2,
      'name': 'QA',
    },
    {
      'id': 3,
      'name': 'HR',
    },
    {
      'id': 4,
      'name': 'BA',
    },
  ];
  late int _selectedDep;
  final EmployeeService _employeeService = EmployeeService();//emp service instance

  void _saveEmployee() async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      try {
        // print('code: $_enteredCode');
        // print('salary: $_enteredSalary');
        final Map<String, dynamic> resData = await _employeeService.addEmployee(_enteredCode, _enteredName, _enteredEmail, _enteredSalary, _enteredMobile, _selectedDep);
        // print(resData);
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop(Employee(
          id: resData['new_employee']['id'], 
          empCode: _enteredCode, 
          empName: _enteredName, 
          empEmail: _enteredEmail, 
          empSalary: _enteredSalary,
          departmentId: _selectedDep ));
      } catch(err) {
        _isSending = false;
        error = true;
        setState(() {
          _error = err.toString().split(": ")[1];
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedDep = departments[0]['id'];
  }

  @override
  Widget build(BuildContext context) {
    //pixel overflow error
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Employee'),
        // backgroundColor: Theme.of(context).colorScheme.surface,
      ),

      body: LayoutBuilder(builder: ((context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,keyboardSpace+20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 50,
                        decoration: const InputDecoration(label: Text('Name')),
                        validator: (value) {
                          //can return error if validation fails
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return 'Must be between 1 and 50 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredName = value!;
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      TextFormField(
                        maxLength: 10,
                        decoration: const InputDecoration(label: Text('Code')),
                        validator: (value) {
                          //can return error if validation fails
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 10) {
                            return 'Must be between 1 and 10 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredCode = value!;
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Email')),
                        validator: (value) {
                          //can return error if validation fails
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
                          );
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email.';
                          }
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      TextFormField(
                        maxLength: 10,
                        decoration:
                            const InputDecoration(label: Text('Mobile')),
                        validator: (value) {
                          //can return error if validation fails
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 1 ||
                              value.trim().length > 50) {
                            return 'Must be between 1 and 10 characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredMobile = value!;
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      TextFormField(
                        maxLength: 10,
                        decoration:
                            const InputDecoration(label: Text('Salary')),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          //can return error if validation fails
                          if (value == null ||
                              value.isEmpty ) {
                            return 'Please Enter a salary';
                          }
                          if(int.tryParse(value) == null) {
                            return 'Please enter a valid number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          if(value !=null && value.isNotEmpty) {
                            _enteredSalary = int.parse(value);
                          }
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      DropdownButtonFormField(
                          value: _selectedDep,
                          items: departments
                              .map((dep) => DropdownMenuItem<int>(
                                    value: dep['id'],
                                    child: Text(dep['name'],
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .labelMedium
                                        ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedDep = value!;
                            });
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          error ? Text(_error!) : Container(),
                          const SizedBox(width: 10,),
                          TextButton(
                              onPressed: _isSending
                              ? null
                              :() {
                                _formKey.currentState!.reset();
                              },
                              child: const Text('Reset')),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: _isSending ? null : _saveEmployee, 
                              child: _isSending
                              ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator()
                              )
                              : const Text('Add'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      })),
    );
  }
}
