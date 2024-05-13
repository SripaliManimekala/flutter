import 'package:flutter/material.dart';
import 'package:frontend/models/employee.dart';

class EmployeeTable extends StatelessWidget {
  const EmployeeTable({super.key, required this.employees});

  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      // child: Table(
      //   border: TableBorder.all(),
      //   children: [
      //     TableRow(children: [
      //       TableCell(
      //           child: Center(
      //         child: Text(
      //           'Code',
      //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                 color: Theme.of(context).colorScheme.surface,
      //               ),
      //         ),
      //       )),
      //       TableCell(
      //           child: Center(
      //         child: Text(
      //           'Employee Name',
      //           textAlign: TextAlign.center,
      //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                 color: Theme.of(context).colorScheme.surface,
      //               ),
      //         ),
      //       )),
      //       TableCell(
      //           child: Center(
      //         child: Text(
      //           'Salary',
      //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                 color: Theme.of(context).colorScheme.surface,
      //               ),
      //         ),
      //       )),
      //       TableCell(
      //           child: Center(
      //         child: Text(
      //           'Action',
      //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //                 color: Theme.of(context).colorScheme.surface,
      //               ),
      //         ),
      //       )),
      //     ]),
      //     for (final emp in employees)
      //       TableRow(
      //         children: [
      //           TableCell(
      //             child: Center(
      //               child: Text(emp.empCode),
      //             ),
      //           ),
      //           TableCell(
      //             child: Center(
      //               child: Text(emp.empName),
      //             ),
      //           ),
      //           TableCell(
      //             child: Center(
      //               child: Text(emp.empSalary.toString()),
      //             ),
      //           ),
      //           const TableCell(
      //             child: Center(
      //               child: Text('Action'),
      //             ),
      //           ),
      //         ],
      //       ),
      //   ],
      //   // ),
      // ),
      child: InteractiveViewer(
        child: DataTable(
          columns: [
            DataColumn(label: Text(
                  'Code',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                )),
            DataColumn(label: Text(
                  'Employee Name',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ), 
            ),
            DataColumn(label: Text(
                  'Salary',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),),
            DataColumn(label: Text(
                  'Action',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),),
          ], 
          rows: [
            for (final emp in employees)
            DataRow(cells: [
        DataCell(Center(
                      child: Text(emp.empCode),
                    )),
        DataCell(Center(
                      child: Text(emp.empName),
                    )),
        DataCell(Center(
                      child: Text(emp.empSalary.toString()),
                    )),
         const DataCell(Center(
                      child: Text('Action'),
                    )),
            ])
          ]
          ),
      ),
    );
  }
}
              // TableRowInkWell(
              //   onTap: () {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content:  Text('Row tapped'))
              //     );
              //   },
              // ),