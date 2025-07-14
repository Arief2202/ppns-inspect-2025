// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ppns_inspect/MenuWidget.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'package:ppns_inspect/user/TermsCondition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  bool checked = false;
  String id = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          DialogButton(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
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
                  margin: new EdgeInsets.only(left: 30.0, right: 20.0, top: 40),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "INSPEKSI",
                              style: TextStyle(
                                fontFamily: "SanFrancisco",
                                decoration: TextDecoration.none,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                fontSize: 32,
                                color: Color.fromARGB(255, 255, 50, 50)
                              ),
                            ),
                          ],
                        )
                      ),
                      MenuWidget(context, TermsCondition(code: 'apar'), 'assets/img/apar.png', "Inspeksi APAR & APAB", "Alat Pemadam Api Ringan & Alat Pemadam Api Berat"),
                      MenuWidget(context, TermsCondition(code: 'hydrantOHB'), 'assets/img/hydrant.png', "Inspeksi Hydrant OHB", "Hydrant Outdoor (Luar Gedung)"),
                      MenuWidget(context, TermsCondition(code: 'hydrantIHB'), 'assets/img/hydrant.png', "Inspeksi Hydrant IHB", "Hydrant Intdoor (Dalam Gedung)"),
                      MenuWidget(context, TermsCondition(code: 'P3K'), 'assets/img/p3k.png', "Inspeksi Kotak P3K", "Kotak P3K"),
                      MenuWidget(context, TermsCondition(code: 'exit'), 'assets/img/emergency_exit.png', "Inspeksi Jalur Evakuasi", "Jalur Evakuasi"),

                      // Card(
                      //   child: InkWell(
                      //     onTap: () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(builder: (context) {
                      //       //     // return InspeksiApar();
                      //       //     return TermsCondition(code: 'apar');
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
                      //                   "Inspeksi APAB",
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 18,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   "Alat Pemadam Api Berat",
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

                      // Card(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) {
                      //           return TermsCondition(code: 'hydrantOHB');
                      //         }),
                      //       );
                      //     },
                      //     child: Container(
                      //         width: MediaQuery.of(context).size.width - 50,
                      //         padding: EdgeInsets.all(5),
                      //         height: 80,
                      //         child: Row(
                      //           children: [
                      //             Image.asset(
                      //               'assets/img/hydrant.png',
                      //               width: 100,
                      //               height: 100,
                      //             ),
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   "Inspeksi HYDRANT OHB",
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 18,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   "Hydrant Outdoor (Luar Gedung)",
                      //                   style: TextStyle(fontSize: 12),
                      //                 )
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

                      // Card(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) {
                      //           return TermsCondition(code: 'hydrantIHB');
                      //         }),
                      //       );
                      //     },
                      //     child: Container(
                      //         width: MediaQuery.of(context).size.width - 50,
                      //         padding: EdgeInsets.all(5),
                      //         height: 80,
                      //         child: Row(
                      //           children: [
                      //             Image.asset(
                      //               'assets/img/hydrant.png',
                      //               width: 100,
                      //               height: 100,
                      //             ),
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   "Inspeksi HYDRANT IHB",
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 18,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   "Hydrant Indoor (dalam gedung)",
                      //                   style: TextStyle(fontSize: 12),
                      //                 )
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

                      //              Card(
                      //                   child: InkWell(
                      //                     onTap: () async{

                      //                       FocusManager.instance.primaryFocus?.unfocus();
                      //                       var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_rumah_pompa.php?search");

                      //                       try {
                      //                         final response =
                      //                             await http.get(url).timeout(
                      //                           const Duration(seconds: 1),
                      //                           onTimeout: () {
                      //                             return http.Response(
                      //                                 'Error', 408);
                      //                           },
                      //                         );
                      //                         if (response.statusCode == 200) {
                      //                           var respon =
                      //                               Json.tryDecode(response.body);
                      //                           if (respon['inspection']) {
                      //                             if (this.mounted) {
                      //                               setState(() {
                      //                                 checked = true;
                      //                               });
                      //                             }
                      //                             Alert(
                      //                               context: context,
                      //                               type: AlertType.success,
                      //                               title:
                      //                                   "Rumah Pompa Hydrant belum di inspeksi",
                      //                               content: Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment.start,
                      //                                 children: [
                      //                                   SizedBox(height: 10),
                      //                                 ],
                      //                               ),
                      //                               buttons: [
                      //                                 DialogButton(
                      //                                     child: Text(
                      //                                       "Next",
                      //                                       style: TextStyle(
                      //                                           color: Colors.white,
                      //                                           fontSize: 20),
                      //                                     ),
                      //                                     onPressed: () {
                      //                                       Navigator.pop(context);
                      //                                       Navigator.push(
                      //                                         context,
                      //                                         MaterialPageRoute(builder: (context) {
                      //                                           return TermsCondition(code: 'rumah_pompa');
                      //                                         }),
                      //                                       );
                      //                                     }),
                      //                               ],
                      //                             ).show();
                      //                           } else {
                      //                             if (this.mounted) {
                      //                               setState(() {
                      //                                 checked = false;
                      //                               });
                      //                             }
                      //                             Alert(
                      //                               context: context,
                      //                               type: AlertType.error,
                      //                               title:
                      //                                   "Rumah Pompa Hydrant telah di inspeksi bulan ini!",
                      //                               content: Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment.start,
                      //                                 children: [
                      //                                   SizedBox(height: 10),
                      //                                   Text(
                      //                                     """
                      // Email Inspektor  : ${respon['data_user']['email']}
                      // Tanggal Inspeksi : ${respon['data_inspeksi']['created_at']}
                      // """,
                      //                                     style: TextStyle(
                      //                                         fontSize: 14),
                      //                                   )
                      //                                 ],
                      //                               ),
                      //                               buttons: [
                      //                                 DialogButton(
                      //                                     child: Text(
                      //                                       "Close",
                      //                                       style: TextStyle(
                      //                                           color: Colors.white,
                      //                                           fontSize: 20),
                      //                                     ),
                      //                                     onPressed: () {
                      //                                       Navigator.pop(context);
                      //                                     }),
                      //                               ],
                      //                             ).show();
                      //                           }
                      //                         }
                      //                       } on Exception catch (_) {}
                      //                     },
                      //                     child: Container(
                      //                         width: MediaQuery.of(context).size.width - 50,
                      //                         padding: EdgeInsets.all(5),
                      //                         height: 80,
                      //                         child: Row(
                      //                           children: [
                      //                             Image.asset(
                      //                               'assets/img/hydrant.png',
                      //                               width: 100,
                      //                               height: 100,
                      //                             ),
                      //                             Column(
                      //                               mainAxisAlignment: MainAxisAlignment.start,
                      //                               crossAxisAlignment: CrossAxisAlignment.start,
                      //                               children: [
                      //                                 Text(
                      //                                   "RUMAH POMPA",
                      //                                   style: TextStyle(
                      //                                     fontWeight: FontWeight.bold,
                      //                                     fontSize: 18,
                      //                                   ),
                      //                                 ),
                      //                                 Text(
                      //                                   "Rumah Pompa",
                      //                                   style: TextStyle(
                      //                                     fontSize: 12
                      //                                   ),
                      //                                   )
                      //                               ],
                      //                             ),
                      //                           ],
                      //                         )),
                      //                   ),
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(10.0),
                      //                   ),
                      //                   elevation: 5,
                      //                   margin: EdgeInsets.all(10),
                      //                 ),

                      // Card(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) {
                      //           // return InspeksiApar();
                      //           return TermsCondition(code: 'P3K');
                      //         }),
                      //       );
                      //     },
                      //     child: Container(
                      //         width: MediaQuery.of(context).size.width - 50,
                      //         padding: EdgeInsets.all(5),
                      //         height: 80,
                      //         child: Row(
                      //           children: [
                      //             Image.asset(
                      //               'assets/img/p3k.png',
                      //               width: 100,
                      //               height: 100,
                      //             ),
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   "Inspeksi Kotak P3K",
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 18,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   "Kotak P3K",
                      //                   style: TextStyle(fontSize: 12),
                      //                 )
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

                      // Card(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) {
                      //           // return InspeksiApar();
                      //           return TermsCondition(code: 'exit');
                      //         }),
                      //       );
                      //     },
                      //     child: Container(
                      //         width: MediaQuery.of(context).size.width - 50,
                      //         padding: EdgeInsets.all(5),
                      //         height: 80,
                      //         child: Row(
                      //           children: [
                      //             Image.asset(
                      //               'assets/img/emergency_exit.png',
                      //               width: 100,
                      //               height: 100,
                      //             ),
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   "Inspeksi Jalur Evakuasi",
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 18,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   "Jalur Evakuasi",
                      //                   style: TextStyle(fontSize: 12),
                      //                 )
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
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
