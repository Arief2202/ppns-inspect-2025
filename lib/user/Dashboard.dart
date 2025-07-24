// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ppns_inspect/MenuWidget.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'package:ppns_inspect/user/TermsCondition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:async';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:ppns_inspect/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    check_reminder_inspeksi();
    notif.initialize(flutterLocalNotificationsPlugin);
    globals.timerNotif = Timer.periodic(
        Duration(milliseconds: 1000), (Timer t) => updateNotification());
  }

  void onFocusScreen() {
    // check_kadaluarsa();
  }

  void updateNotification() async {
    try {
      final response = await http.get(Uri.parse("http://${globals.endpoint}/api_notification.php?read&user_id=${globals.user_id}")).timeout(
        const Duration(seconds: 1),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      if (response.statusCode == 200) {
        var respon = Json.tryDecode(response.body)['data'];
        for (int a = 0; a < respon.length; a++) {
          notif.showNotif(
              id: int.parse(respon[a]['id']),
              head: respon[a]['title'],
              body: respon[a]['content'],
              fln: flutterLocalNotificationsPlugin);
              
          try {
            await http.get(Uri.parse("http://${globals.endpoint}/api_notification.php?displayed&notif_id=${respon[a]['id']}")).timeout(
              const Duration(seconds: 1),
              onTimeout: () {
                return http.Response('Error', 408);
              },
            );
          } on Exception catch (_){}
        }
      }
    } on Exception catch (_) {}
  }
  
  void check_reminder_inspeksi() async {
    try {
      final response = await http.get(Uri.parse("http://${globals.endpoint}/api_notification.php?check_reminder_inspeksi&user_id=${globals.user_id}")).timeout(
        const Duration(seconds: 1),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      print(response.statusCode);
    } on Exception catch (_) {}
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

                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
