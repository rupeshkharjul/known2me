import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:know2me_sample_project/model/employee_data.dart';

class EmployeeListTile extends StatelessWidget {
  final EmployeeData employeeData;
  final Function onClick;

  EmployeeListTile({@required this.employeeData, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        margin: EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(employeeData.imageUrl),
              height: 70.0,
              width: 70.0,
            ),
            Text(
              "${employeeData.firstName} ${employeeData.lastName}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
