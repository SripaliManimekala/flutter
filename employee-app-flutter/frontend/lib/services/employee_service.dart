
import 'package:frontend/models/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeService {

  Future<List<Employee>> getAllEmployees() async {
    final url = Uri.parse('http://192.168.1.129:1337/api/v1/get-all-employee');


      final response = await http.get(url);
      print(response.body);

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
              empSalary: emp['emp_salary'] as int,
              // departmentId: emp.value['department_id']['id']
              ));
        }
        // if(listData.isEmpty) {
        //   return null;
        // }
        return loadedEmp;

      } else {
        throw Exception('Failed to fetch data. Please try again later');
      }
  }
}