// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'admin/DataModel.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({required this.redirect, required this.img, required this.title, required this.desc, this.checkInspect, Key? key}) : super(key: key);
  Widget redirect;
  String img;
  String title; 
  String desc;
  dataCheckInspect? checkInspect;

  @override
  _MenuWidgetState createState() => _MenuWidgetState(redirect: redirect, img: img, title: title, desc: desc, checkInspect: checkInspect);
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  // BuildContext context;
  _MenuWidgetState({required this.redirect, required this.img, required this.title, required this.desc, this.checkInspect});
  Widget redirect;
  String img;
  String title; 
  String desc;
  dataCheckInspect? checkInspect;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
      return 
    Card(
      child: InkWell(
        onTap: () async {
          if(checkInspect != null){
              var url = Uri.parse(checkInspect!.link);
              try {
                final response =
                    await http.get(url).timeout(
                  const Duration(seconds: 1),
                  onTimeout: () {
                    return http.Response('Error', 408);
                  },
                );
                print(url);
                print(response.statusCode);
                if (response.statusCode == 200) {
                  var respon = Json.tryDecode(response.body);
                  if (respon['inspection']) {
                    if (this.mounted) {
                      setState(() {
                        checked = true;
                      });
                    }
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: checkInspect!.text_belum_inspect,
                      content: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);                                      
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return redirect;
                                }),
                              );
                            }),
                      ],
                    ).show();
                  } else {
                    if (this.mounted) {
                      setState(() {
                        checked = false;
                      });
                    }
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title:checkInspect!.text_sudah_inspect,
                      content: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            """
  Email Inspektor  : ${respon['data_user']['email']}
  Tanggal Inspeksi : ${respon['data_inspeksi']['timestamp']}
  """,
                            style: TextStyle(
                                fontSize: 14),
                          )
                        ],
                      ),
                      buttons: [
                        DialogButton(
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    ).show();
                  }
                }     
              } on Exception catch (e) {print(e);}
          }
          else{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                // return InspeksiApar();
                return redirect;
              }),
            );
          }
        },
        child: Container(
            width: MediaQuery.of(context).size.width - 50,
            padding: EdgeInsets.all(5),
            height: 80,
            child: Row(
              children: [
                Image.asset(
                  img,
                  width: 100,
                  height: 100,
                ),
                Container(
                  width:
                      MediaQuery.of(context).size.width - 160,
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        desc,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}