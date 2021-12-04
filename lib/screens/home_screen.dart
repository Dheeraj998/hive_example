import 'package:flutter/material.dart';
import 'package:hive_example/db/functions/db_functions.dart';
import 'package:hive_example/screens/home/widgets/add_student_widget.dart';
import 'package:hive_example/screens/home/widgets/list_student_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          StudentWidget(),
          Expanded(
            child: ListStudentWidget(),
          ),
        ],
      )),
    );
  }
}
