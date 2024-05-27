

class Employee {
  final int id;
  final String empCode;
  final String empName;
  final String empEmail;
  final String? empMobile;
  final int empSalary;
  final int departmentId;

  const Employee({
    required this.id,
    required this.empCode,
    required this.empName,
    required this.empEmail,
    this.empMobile,
    required this.empSalary,
    required this.departmentId,
  });

}
