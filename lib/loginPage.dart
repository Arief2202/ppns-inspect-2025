// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_declarations, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, curly_braces_in_flow_control_structures, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, unnecessary_new, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ppns_inspect/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  List<TextEditingController> _data = [TextEditingController(), TextEditingController()];
  List<bool> _error = [false, false, false, false];
  String _passwordMsg = "Value Can\'t Be Empty";

  @override
  void initState() {
    super.initState();
    if(globals.timerNotif != null) globals.timerNotif!.cancel();
    if(globals.timerData != null) globals.timerData!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/img/logoHorizontal.png',
                          width: MediaQuery.of(context).size.width/2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20),
                            errorText: _error[0] ? 'Value Can\'t Be Empty' : null,
                          ),
                          controller: _data[0],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 15),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 20),
                            errorText: _error[1] ? 'Value Can\'t Be Empty' : null,
                          ),
                          controller: _data[1],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 10,
                      child: ElevatedButton(
                        onPressed: () {
                          _doLogin(context);
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
                        ),
                      ),
                    ),
                    // SizedBox(height: MediaQuery.of(context).size.width / 15),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
                    //   width: double.infinity,
                    //   height: MediaQuery.of(context).size.width / 10,
                    //   child: OutlinedButton(
                    //     onPressed: () {
                    //       // Navigator.push(
                    //       //   context,
                    //       //   MaterialPageRoute(builder: (context) {
                    //       //     return RegisterPage();
                    //       //   }),
                    //       // );
                    //     },
                    //     child: Text(
                    //       "Sign Up",
                    //       style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.width / 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

  Future _doLogin(context) async {
    bool status = true;
    setState(() {
      _passwordMsg = "Value Can\'t Be Empty";
      for (int a = 0; a < 2; a++) {
        if (_data[a].text.isEmpty) {
          _error[a] = true;
          status = false;
        } else
          _error[a] = false;
      }
    });
    if (status) {
      String _email = _data[0].text;
      String _password = _data[1].text;
      // context.loaderOverlay.show();
      var url = Uri.parse('http://' + globals.endpoint + '/login.php');
      final response = await http.post(url, body: {'email': _email, 'password': _password}).timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Error', 408); // Request Timeout response status code
        },
      );
      // context.loaderOverlay.hide();

      if (response.statusCode == 200) {
        Map<String, dynamic> parsed = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', (parsed['data']['user']['id']).toString());
        await prefs.setString('user_role', parsed['data']['user']['role']);
        await prefs.setString('user_name', parsed['data']['user']['name']);
        await prefs.setString('user_email', parsed['data']['user']['email']);
        await prefs.setString('user_password', parsed['data']['user']['password']);
        setState(() {
          globals.user_id = (parsed['data']['user']['id']).toString();
          globals.user_role = parsed['data']['user']['role'];
          globals.user_name = parsed['data']['user']['name'];
          globals.user_email = parsed['data']['user']['email'];
          globals.user_password = parsed['data']['user']['password'];
          globals.isLoggedIn = true;
        });
        Alert(
          context: context,
          type: AlertType.info,
          desc: "Login Success!",
          buttons: [
            DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Phoenix.rebirth(context);
                })
          ],
        ).show();
      } else {
        print(response.body);
        Map<String, dynamic> parsed = Json.tryDecode(response.body);
        Alert(
          context: context,
          type: AlertType.error,
          title: "Login Failed!",
          desc: parsed["pesan"],
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ).show();
      }
    }
  }
}


class Json {
  static String? tryEncode(data) {
    try {
      return jsonEncode(data);
    } catch (e) {
      return " ";
    }
  }

  static dynamic tryDecode(data) {
    try {
      return jsonDecode(data);
    } catch (e) {
      return " ";
    }
  }

}