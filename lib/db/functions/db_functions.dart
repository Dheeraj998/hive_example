import 'package:flutter/foundation.dart';
import 'package:hive_example/db/models/data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  final id = studentDb.add(value);
  value.id = id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.delete(id);
}
