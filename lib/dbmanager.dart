import 'package:crud_sqlite/models/studentsdetails.dart';
// import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'students.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE studentdetails(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, course TEXT, regnumber TEXT, departments TEXT, gender TEXT, agecategory TEXT, area TEXT, facility TEXT)");
        return;
      },
      version: 1,
    );
  }

  Future<int> insertStudentDetails(StudentDetails studentdetails) async {
    int studentdetailsid = 0;
    Database _db = await database();
    await _db
        .insert('studentdetails', studentdetails.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      studentdetailsid = value;
    });
    return studentdetailsid;
  }

  Future<List<StudentDetails>> getStudentDetails() async {
    Database _db = await database();

    List<Map<String, dynamic>> studentdetailsMap =
        await _db.rawQuery("SELECT * FROM studentdetails");
    return List.generate(studentdetailsMap.length, (index) {
      return StudentDetails(
          name: studentdetailsMap[index]['name'].toString(),
          course: studentdetailsMap[index]['course'].toString(),
          regnumber: studentdetailsMap[index]['regnumber'].toString(),
          departments: studentdetailsMap[index]['departments'].toString(),
          gender: studentdetailsMap[index]['gender'].toString(),
          facility: studentdetailsMap[index]['facility'].toString(),
          agecategory: studentdetailsMap[index]['agecategory'].toString(),
          area: studentdetailsMap[index]['area'].toString());
    });
  }

  Future<List<StudentDetails>> UpdateStudentDetails() async {
    Database _db = await database();

    List<Map<String, dynamic>> studentdetailsMap = await _db.rawQuery(
        "SELECT * FROM studentdetails where name =  'Oliver' ");
    return List.generate(studentdetailsMap.length, (index) {
      return StudentDetails(
          name: studentdetailsMap[index]['name'].toString(),
          course: studentdetailsMap[index]['course'].toString(),
          regnumber: studentdetailsMap[index]['regnumber'].toString(),
          departments: studentdetailsMap[index]['departments'].toString(),
          gender: studentdetailsMap[index]['gender'].toString(),
          facility: studentdetailsMap[index]['facility'].toString(),
          agecategory: studentdetailsMap[index]['agecategory'].toString(),
          area: studentdetailsMap[index]['area'].toString());
    });
  }

  // Future<void> updateStudentDetails(String studentdetailsId) async {
  //   Database _db = await database();
  //   await _db.rawUpdate("UPDATE patient WHERE id = '$studentdetailsId'");
  // }
}
