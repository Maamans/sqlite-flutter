import 'package:crud_sqlite/update.dart';
import 'package:flutter/material.dart';
import 'package:crud_sqlite/form.dart';

import 'dbmanager.dart';
// import 'package:crud_sqlite/form.dart';


class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreen();
  
}

class _MyDetailsScreen extends State<MyDetailsScreen> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  

   @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children:[
          FutureBuilder(
            initialData: [],
            future: _dbHelper.getStudentDetails(),
            builder: (context, snapshot) {
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
                return ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            IconButton(onPressed: (){

                             Navigator.push(context, MaterialPageRoute(builder: (context)=> (UpdateFormPage(title: "Update", name: snapshot.data![index].name))));
                             

                            }, icon: Icon(Icons.edit, size: 20, color: Colors.green,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 20, color: Colors.red[900],)),
                            ]),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(.0, 5.0, 5.0, 5.0),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.teal),
                                      borderRadius:
                                          BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                        snapshot
                                                            .data![index]
                                                            .name,
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            color: Color(
                                                                0xFF205072))),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Course',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot
                                                      .data![index].course,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('regnumber',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot.data![index]
                                                      .regnumber,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('departments',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot.data![index]
                                                      .departments,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('gender',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot
                                                      .data![index].gender,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('facility',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot.data![index]
                                                      .facility,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('agecategory',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot.data![index]
                                                      .agecategory,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('area',
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff389e9d))),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  snapshot.data![index]
                                                      .area,
                                                  textAlign:
                                                      TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          0xFF205072))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }),
                );
              }
            },
          )
          
        ]
      ),
    );
    
  }
}