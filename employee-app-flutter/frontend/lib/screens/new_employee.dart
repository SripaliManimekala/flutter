
import 'package:flutter/material.dart';
import 'package:frontend/models/employee.dart';
import 'package:frontend/services/employee_service.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({super.key, this.employee});

  final Employee? employee;

  @override
  State<NewEmployeeScreen> createState() {
    return _NewEmployeeScreenState();
  }
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  // var _enteredName = '';
  // var _enteredCode = '';
  // var _enteredEmail = '';
  // var _enteredMobile = '';
  // var _enteredSalary = 0;
  // var _isSending = false;
  late String _enteredName ;
  late String _enteredCode ;
  late String _enteredEmail;
  late String _enteredMobile;
  late int _enteredSalary ;
  late int _selectedDep ;
  var _isSending = false;
  String? _error;
  bool error = false;
  bool _isEditing = false;
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
  // late int _selectedDep;
  final EmployeeService _employeeService = EmployeeService();//emp service instance

  void _showDialog() {
    showDialog(
      context: context, 
      builder: (ctx)=> AlertDialog(
        title: const Text('Success!'),
        content: const Text('Employee Added.'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(ctx).pop();//close dialog
            }, 
            child: const Text('OK')
          )
        ],
      ));
  }

  void _saveEmployee() async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
        error = false;
        _error = null;
      });
      try {
        final Map<String, dynamic> resData = await _employeeService.addEmployee(
          _enteredCode, 
          _enteredName, 
          _enteredEmail, 
          _enteredSalary, 
          _enteredMobile, 
          _selectedDep);
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
        
        _showDialog();
        setState(() {
          _isSending = false;
        });
        
      } catch(err) {
        setState(() {
          _isSending = false;
        });
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
    // _selectedDep = departments[0]['id'];
    if(widget.employee != null) {
      _isEditing = true;
      _enteredCode = widget.employee!.empCode;
      _enteredName = widget.employee!.empName;
      _enteredEmail = widget.employee!.empEmail;
      _enteredMobile = widget.employee!.empMobile ?? '';
      _enteredSalary = widget.employee!.empSalary;
      _selectedDep = widget.employee!.departmentId;
    }
  }

  @override
  Widget build(BuildContext context) {
    //pixel overflow error
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Employee' : 'Add a new Employee'),
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
                padding: EdgeInsets.fromLTRB(30,20,30,keyboardSpace+20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 50,
                        decoration: const InputDecoration(label: Text('Name')),
                        initialValue: _enteredName,
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
                        initialValue: _enteredCode,
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
                        initialValue: _enteredEmail,
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
                        decoration: const InputDecoration(label: Text('Mobile')),
                        initialValue: _enteredMobile,
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
                        initialValue: _enteredSalary.toString(),
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
                          // error ? Text(_error!) : Container(),
                          if (error) Flexible(child: Text(_error!)),
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
