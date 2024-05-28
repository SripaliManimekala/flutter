
import 'package:frontend/models/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeService {

  Future<List<Employee>?> getAllEmployees() async {
    final url = Uri.parse('http://192.168.1.129:1337/api/v1/get-all-employee');


      final response = await http.get(url);
      // print(response.body);

      if (response.statusCode == 200) {
        final Map<String,dynamic> employeesData =  json.decode(response.body);
        final List<dynamic> listData = employeesData['employees'];
        final List<Employee> loadedEmp = [];
        for (final empData in listData) {
          Map<String,dynamic> emp = empData as  Map<String,dynamic>;
          loadedEmp.add(Employee(
              id: emp["id"],
              empCode: emp['emp_code'],
              empName: emp['emp_name'],
              empEmail: emp['emp_email'],
              empMobile: emp['emp_mobile'],
              empSalary: emp['emp_salary'] as int,
              departmentId: emp['department_id']
              ));
        }
        if(loadedEmp.isEmpty) {
          return null;
        }
        return loadedEmp;

      } else if(response.statusCode >= 400){
        throw Exception('Failed to fetch data. Please try again later');
      } else {
        throw Exception('Something went wrong! Please try again later.');
      }
  }

  Future<void> deleteEmployee(int id) async {
    
    final url = Uri.parse('http://192.168.1.129:1337/api/v1/delete-employee?id=$id');
    final response = await http.post(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  } 

  Future<Map<String, dynamic>> addEmployee(String code, String name, String email,int salary, String mobile,int departmentId ) async {
    final url = Uri.parse('http://192.168.1.129:1337/api/v1/add-employee');

    final response = await http.post(url,
        headers: {'Content-Type':'application/json'},
        body: json.encode({
          'emp_code': code,
          'emp_name': name,
          'emp_email': email,
          'emp_salary': salary,
          'emp_mobile': mobile,
          'department_id': departmentId
        }));

    if(response.statusCode == 200) {
      return json.decode(response.body);//convert json response to a map
    } else if (response.statusCode >= 400) {
      print(response);
      throw Exception('Failed to add employee');
    } else {
        throw Exception('Something went wrong! Please try again later.');
    }    
  }

  Future<Map<String,dynamic>> updateEmployee(int id, String code, String name, String email,int salary, String mobile,int departmentId) async {
    
    final url = Uri.parse('http://192.168.1.129:1337/api/v1/edit-employee?id=$id');
    final response = await http.post(url,
    headers: {'Content-Type':'application/json'},
    body: json.encode({
      'id':id,
      'emp_code': code,
      'emp_name': name,
      'emp_email': email,
      'emp_salary': salary,
      'emp_mobile': mobile,
      'department_id': departmentId
    }));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode >= 400) {
      throw Exception('Failed to update employee');
    } else {
        throw Exception('Something went wrong! Please try again later.');
    } 
  }
}