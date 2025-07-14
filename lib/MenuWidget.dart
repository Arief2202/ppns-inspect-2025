// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last

import 'package:flutter/material.dart';

Widget MenuWidget(BuildContext context, Widget redirect, String img, String title, String desc){
  return 
    Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              // return InspeksiApar();
              return redirect;
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