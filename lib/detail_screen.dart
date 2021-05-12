import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:know2me_sample_project/model/employee_data.dart';

class DetailScreen extends StatelessWidget {
  static final String id = "detail_screen";

  @override
  Widget build(BuildContext context) {
    final EmployeeData employeeData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details"),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(employeeData.imageUrl),
            TextWidget(
              keyText: 'Name',
              data: '${employeeData.firstName} ${employeeData.lastName}',
            ),
            TextWidget(
              keyText: 'Email',
              data: employeeData.email,
            ),
            TextWidget(
              keyText: 'Contact Number',
              data: employeeData.contactNumber,
            ),
            TextWidget(keyText: 'Age', data: '${employeeData.age}'),
            TextWidget(
              keyText: 'Date of Birth',
              data: employeeData.dob,
            ),
            TextWidget(keyText: 'Salary', data: '${employeeData.salary}'),
            TextWidget(keyText: 'Address', data: employeeData.address),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String keyText;
  final String data;

  TextWidget({this.keyText, this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$keyText : ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        Text(
          data,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}
