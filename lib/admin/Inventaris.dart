// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ppns_inspect/admin/Data/Data_Apar.dart';
import 'package:ppns_inspect/admin/Data/Data_Hydrant_IHB.dart';
import 'package:ppns_inspect/admin/Data/Data_Hydrant_OHB.dart';
import 'package:ppns_inspect/admin/Data/Data_P3K.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ppns_inspect/globals.dart' as globals;

class DataInventaris extends StatefulWidget {
  DataInventaris({Key? key}) : super(key: key);

  @override
  _DataInventarisState createState() => _DataInventarisState();
}

class _DataInventarisState extends State<DataInventaris> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: Column(children: [
                SizedBox(height: 50),
                IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Do you want to Logout ?",
                        buttons: [
                          DialogButton(
                              child: Text(
                                "No",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          DialogButton(
                              child: Text(
                                "Yes",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.remove('user_id');
                                await prefs.remove('user_role');
                                await prefs.remove('user_name');
                                await prefs.remove('user_email');
                                await prefs.remove('user_password');
                                setState(() {
                                  globals.user_id = "";
                                  globals.user_role = "";
                                  globals.user_name = "";
                                  globals.user_email = "";
                                  globals.user_password = "";
                                  globals.isLoggedIn = false;
                                });
                                // Navigator.pop(context);
                                Phoenix.rebirth(context);
                              }),
                        ],
                      ).show();
                    }),
              ])),
          Align(
              alignment: Alignment.topLeft,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, right: 20.0, top: 40),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/img/logoHorizontal.png',
                        height: 65,
                      ),
                    ],
                  ),
                ),
              ])),
              
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 120, bottom: 50),
              child: SingleChildScrollView(
                child:  
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "INVENTARIS",
                            style: TextStyle(
                              fontFamily: "SanFrancisco",
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              color: Color.fromARGB(255, 255, 50, 50)
                            ),
                          ),
                        ],
                      )                
                    ),
                  ]
                )
              )
            )
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 180, bottom: 50),
              child: SingleChildScrollView(
                child:  
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DataApar();
                            }),
                          );
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: EdgeInsets.all(5),
                            height: 80,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/img/apar.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "APAR",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Alat Pemadam Api Ringan (Apar)",
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                      )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    

                    // Card(
                    //   child: InkWell(
                    //     onTap: () {
                    //       // Navigator.push(
                    //       //   context,
                    //       //   MaterialPageRoute(builder: (context) {
                    //       //     return DataApar();
                    //       //   }),
                    //       // );
                    //     },
                    //     child: Container(
                    //         width: MediaQuery.of(context).size.width - 50,
                    //         padding: EdgeInsets.all(5),
                    //         height: 80,
                    //         child: Row(
                    //           children: [
                    //             Image.asset(
                    //               'assets/img/apab.png',
                    //               width: 100,
                    //               height: 100,
                    //             ),
                    //             Column(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   "APAB",
                    //                   style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 18,
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   "Alat Pemadam Api Berat (Apab)",
                    //                   style: TextStyle(
                    //                     fontSize: 12
                    //                   ),
                    //                   )
                    //               ],
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   elevation: 5,
                    //   margin: EdgeInsets.all(10),
                    // ),
                    
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DataHydrantOHB();
                            }),
                          );
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: EdgeInsets.all(5),
                            height: 80,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/img/hydrant.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HYDRANT OHB",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Hydrant Outdoor (Luar Gedung)",
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                      )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    
                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DataHydrantIHB();
                            }),
                          );
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: EdgeInsets.all(5),
                            height: 80,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/img/hydrant.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HYDRANT IHB",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Hydrant Indoor (dalam gedung)",
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                      )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),

                    Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DataP3K();
                            }),
                          );
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            padding: EdgeInsets.all(5),
                            height: 80,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/img/p3k.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "P3K",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Kotak P3K",
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                      )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),

                    
                  ],
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}