// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ppns_inspect/admin/Hasil_Inspeksi/apar.dart';
import 'package:ppns_inspect/admin/Hasil_Inspeksi/hydrantIHB.dart';
import 'package:ppns_inspect/admin/Hasil_Inspeksi/hydrantOHB.dart';
import 'package:ppns_inspect/admin/Hasil_Inspeksi/jalur_evakuasi.dart';
import 'package:ppns_inspect/admin/Hasil_Inspeksi/p3k.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:ppns_inspect/MenuWidget.dart';

class HasilInspeksi extends StatefulWidget {
  HasilInspeksi({Key? key}) : super(key: key);

  @override
  _HasilInspeksiState createState() => _HasilInspeksiState();
}

class _HasilInspeksiState extends State<HasilInspeksi> {
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
                            "HASIL INSPEKSI",
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
                    
                    MenuWidget(context, HasilApar(), 'assets/img/apar.png', "APAR & APAB", "Alat Pemadam Api Ringan & Alat Pemadam Api Berat"),
                    MenuWidget(context, HasilHydrantOHB(), 'assets/img/hydrant.png', "Hydrant OHB", "Hydrant Outdoor (Luar Gedung)"),
                    MenuWidget(context, HasilHydrantIHB(), 'assets/img/hydrant.png', "Hydrant IHB", "Hydrant Intdoor (Dalam Gedung)"),
                    MenuWidget(context, HasilP3K(), 'assets/img/p3k.png', "Kotak P3K", "Kotak P3K"),
                    MenuWidget(context, HasilJalurEvakuasi(), 'assets/img/emergency_exit.png', "Evacuation Route", "Jalur Evakuasi"),
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