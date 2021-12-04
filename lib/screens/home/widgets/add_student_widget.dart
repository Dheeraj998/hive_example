import 'package:flutter/material.dart';
import 'package:hive_example/db/functions/db_functions.dart';
import 'package:hive_example/db/models/data_model.dart';

class StudentWidget extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
              hintText: 'age',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClicked();
              },
              icon: Icon(Icons.add),
              label: Text('Add student'))
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    final _student = StudentModel(name: _name, age: _age);
    addStudent(_student);
  }
}
