import 'dart:convert';

import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:know2me_sample_project/detail_screen.dart';
import 'package:know2me_sample_project/model/employee_data.dart';
import 'package:know2me_sample_project/widgets/list_tile.dart';
import 'package:speech_bubble/speech_bubble.dart';

const int PAGE_SIZE = 10;

class ListScreen extends StatefulWidget {
  static final String id = "list_screen";

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<EmployeeData> employeeList = [];
  List<EmployeeData> list = [];
  ScrollController controller;
  int currentPageNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    loadData();
  }

  void loadData() {
    setState(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (currentPageNumber < employeeList.length) {
          for (int i = currentPageNumber;
              i < currentPageNumber + PAGE_SIZE;
              i++) {
            list.add(employeeList[i]);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Employees'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.0),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('file/employees.json'),
          builder: (context, snapshot) {
            List<dynamic> employeeData = jsonDecode(snapshot.data.toString());
            if (employeeData != null) {
              for (dynamic data in employeeData) {
                EmployeeData employee = EmployeeData.fromJson(data);
                employeeList.add(employee);
              }
            }

            employeeList.sort((a, b) => a.firstName.compareTo(b.firstName));

            return ListView.builder(
              itemBuilder: (context, index) {
                return EmployeeListTile(
                  employeeData: employeeList[index],
                  onClick: () {
                    Navigator.pushNamed(context, DetailScreen.id,
                        arguments: employeeList[index]);
                  },
                );
              },
              itemCount: employeeList.length,
              //controller: controller,
            );
          },
        ),
      ),
    );
  }
}
