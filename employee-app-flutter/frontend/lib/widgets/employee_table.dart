import 'package:flutter/material.dart';
import 'package:frontend/models/employee.dart';

class EmployeeTable extends StatelessWidget {
  const EmployeeTable({super.key, required this.employees, required this.onRemove, required this.onEdit});

  final void Function(Employee employee) onRemove;
  final void Function(Employee employee) onEdit;
  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const  {
          0: FixedColumnWidth(70), // Adjust the width of the first column
          1: FlexColumnWidth(), // Let the second column take remaining space
          2: FixedColumnWidth(80), // Adjust the width of the third column
          3: FixedColumnWidth(100), // Adjust the width of the fourth column
        },
        border: TableBorder.all(borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
        ),
        children: [
          TableRow(children: [
            TableCell(
              child: Center(
              child: Text(
                'Code',
                style: Theme.of(context).textTheme.titleSmall
              ),
            )),
            TableCell(
                child: Center(
              child: Text(
                'Employee Name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall
              ),
            )),
            TableCell(
                child: Center(
              child: Text(
                'Salary',
                style: Theme.of(context).textTheme.titleSmall
              ),
            )),
            TableCell(
                child: Center(
              child: Text(
                'Action',
                style: Theme.of(context).textTheme.titleSmall
              ),
            )),
          ]),
          for (final emp in employees)
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text(emp.empCode),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(emp.empName),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(emp.empSalary.toString()),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            onEdit(emp);
                            print(emp.empMobile);
                          }, 
                          icon: const Icon(Icons.edit),
                          color:const Color.fromARGB(255, 53, 144, 208),
                          ),
                        const SizedBox(width: 2,),
                        IconButton(
                          onPressed: () {
                            onRemove(emp);
                          }, 
                          icon: const Icon(Icons.delete),
                          color: const Color.fromARGB(255, 197, 30, 18),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
        // ),
      ),
    );
  }
}
