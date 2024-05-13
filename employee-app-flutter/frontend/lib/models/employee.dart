

class Employee {

  final String empCode;
  final String empName;
  final String empEmail;
  final String? empMobile;
  final double empSalary;
  final int departmentId;

  const Employee({
    required this.empCode,
    required this.empName,
    required this.empEmail,
    this.empMobile,
    required this.empSalary,
    required this.departmentId,
  });

}
