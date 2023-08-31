import 'dart:math';

import 'package:crud_sqlite/details.dart';
import 'package:crud_sqlite/models/studentsdetails.dart';
import 'package:flutter/material.dart';
import 'dbmanager.dart';

class UpdateFormPage extends StatefulWidget {
  const UpdateFormPage({super.key, required this.title, required this.name});

  final String title;
  final String name;

  @override
  State<UpdateFormPage> createState() => _UpdateFormPageState();
}

class _UpdateFormPageState extends State<UpdateFormPage> {
  String facilityValue = 'Select Facility';
  String deptValue = 'Select Department';
  String genderValue = 'Select Gender';
  String ageValue = 'Select Age Category';
  String areaValue = 'Select Area';
  String? selectedDep = '';

  DatabaseHelper _dbHelper = DatabaseHelper();

  final _nameController = TextEditingController();
  final _courseController = TextEditingController();
  final _regnumberController = TextEditingController();
  // final _departmentsController = TextEditingController();
  // final _genderController = TextEditingController();
  // final _facilityController = TextEditingController();
  // final _agecategoryController = TextEditingController();
  // final _areaController = TextEditingController();
  final _formkey = new GlobalKey<FormState>();
  int _studentdetailsId = 0;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
    getData();
  }


  Future<List<StudentDetails>> getData(){
   return _dbHelper.UpdateStudentDetails()  ;

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqlite project'),
      ),
      body: FutureBuilder(
          future:getData() ,
        builder: (context, snapshot){
   if (snapshot.data!.isEmpty) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No student found",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Color(0xFFE02020)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ])
                    ]);
              } else { 
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder:(context, index){
          Text(snapshot.data![index].name);

        } );
        
        // ListView(
        //   children: [
        //     Form(
        //         child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Column(
        //         key: _formkey,
        //         children: [
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'name',
        //             ),
        //             onTap: () {},
        //             // initialValue: snapshot.data!.name.toString(),
        //             controller: _nameController,
        //           ),
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'course',
        //             ),
        //             controller: _courseController,
        //           ),
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'regnumber',
        //             ),
        //             controller: _regnumberController,
        //           ),
        //           Column(
        //             children: [
        //               DropdownButton<String>(
        //                 isExpanded: true,
        //                 value: deptValue,
        //                 icon: const Icon(Icons.arrow_drop_down),
        //                 elevation: 16,
        //                 underline: Container(
        //                   height: 1,
        //                   color: Colors.grey,
        //                 ),
        //                 onChanged: (String? newValue) {
        //                   setState(() {
        //                     deptValue = newValue!;
        //                   });
        //                 },
        //                 items: <String>[
        //                   'Select Department',
        //                   'Lawa Department',
        //                   'Social Science department',
        //                   'Engineering Department',
        //                   'Medical Department'
        //                 ].map<DropdownMenuItem<String>>((String value) {
        //                   return DropdownMenuItem<String>(
        //                     value: value,
        //                     child: Text(value),
        //                   );
        //                 }).toList(),
        //               ),
        //               DropdownButton<String>(
        //                 isExpanded: true,
        //                 value: facilityValue,
        //                 icon: const Icon(Icons.arrow_drop_down),
        //                 elevation: 16,
        //                 underline: Container(
        //                   height: 1,
        //                   color: Colors.grey,
        //                 ),
        //                 onChanged: (String? newValue) {
        //                   setState(() {
        //                     facilityValue = newValue!;
        //                   });
        //                 },
        //                 items: <String>[
        //                   'Select Facility',
        //                   'Cottage/PCMH',
        //                   'Connaught',
        //                   '34 Military Hospital',
        //                 ].map<DropdownMenuItem<String>>((String value) {
        //                   return DropdownMenuItem<String>(
        //                     value: value,
        //                     child: Text(value),
        //                   );
        //                 }).toList(),
        //               ),
        //               DropdownButton<String>(
        //                 isExpanded: true,
        //                 value: genderValue,
        //                 icon: const Icon(Icons.arrow_drop_down),
        //                 elevation: 16,
        //                 underline: Container(
        //                   height: 1,
        //                   color: Colors.grey,
        //                 ),
        //                 onChanged: (String? newValue) {
        //                   setState(() {
        //                     genderValue = newValue!;
        //                   });
        //                 },
        //                 items: <String>[
        //                   'Select Gender',
        //                   'Male',
        //                   'Female',
        //                 ].map<DropdownMenuItem<String>>((String value) {
        //                   return DropdownMenuItem<String>(
        //                     value: value,
        //                     child: Text(value),
        //                   );
        //                 }).toList(),
        //               ),
        //               DropdownButton<String>(
        //                 isExpanded: true,
        //                 value: ageValue,
        //                 icon: const Icon(Icons.arrow_drop_down),
        //                 elevation: 16,
        //                 underline: Container(
        //                   height: 1,
        //                   color: Colors.grey,
        //                 ),
        //                 onChanged: (String? newValue) {
        //                   setState(() {
        //                     ageValue = newValue!;
        //                   });
        //                 },
        //                 items: <String>[
        //                   'Select Age Category',
        //                   'Teenager(0-18',
        //                   'Young Adults(18-24)',
        //                   'Adults(18-45)',
        //                   'Middle Age(46-54)',
        //                   'Old Age(55-60)'
        //                 ].map<DropdownMenuItem<String>>((String value) {
        //                   return DropdownMenuItem<String>(
        //                     value: value,
        //                     child: Text(value),
        //                   );
        //                 }).toList(),
        //               ),
        //               DropdownButton<String>(
        //                 isExpanded: true,
        //                 value: areaValue,
        //                 icon: const Icon(Icons.arrow_drop_down),
        //                 elevation: 16,
        //                 underline: Container(
        //                   height: 1,
        //                   color: Colors.grey,
        //                 ),
        //                 onChanged: (String? newValue) {
        //                   setState(() {
        //                     areaValue = newValue!;
        //                   });
        //                 },
        //                 items: <String>[
        //                   'Select Area',
        //                   'Teenager(0-18',
        //                   'Western Area Urban',
        //                   'Western Area Rural',
        //                   'Southern Province',
        //                   'Eastern Province',
        //                   'Nothern Province'
        //                 ].map<DropdownMenuItem<String>>((String value) {
        //                   return DropdownMenuItem<String>(
        //                     value: value,
        //                     child: Text(value),
        //                   );
        //                 }).toList(),
        //               ),
        //             ],
        //           ),
        //           ElevatedButton(
        //               onPressed: () async {
        //                 StudentDetails _newStudentDetails = StudentDetails(
        //                     name: _nameController.text,
        //                     course: _courseController.text,
        //                     regnumber: _regnumberController.text,
        //                     departments: '$deptValue',
        //                     gender: '$genderValue',
        //                     facility: '$facilityValue',
        //                     agecategory: '$ageValue',
        //                     area: '$areaValue');
        //                 _studentdetailsId = await _dbHelper
        //                     .insertStudentDetails(_newStudentDetails);
        //                 // put information in a setstate to print out data without refreshing your application
        //                 setState(() {
        //                   print(_newStudentDetails.name);
        //                   print(_newStudentDetails.course);
        //                   print(_newStudentDetails.regnumber);
        //                   print(_newStudentDetails.departments);
        //                   print(_newStudentDetails.gender);
        //                   print(_newStudentDetails.facility);
        //                   print(_newStudentDetails.agecategory);
        //                   print(_newStudentDetails.area);
        //                 });
        //               },
        //               child: Text('Submit'))
        //         ],
        //       ),
        //     )),
        //     Row(
        //       children: [
        //         TextButton(
        //             onPressed: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => MyDetailsScreen()));
        //             },
        //             child: Text('View Details'))
        //       ],
        //     ),
        //   ],
        // );
        }
        }

      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
