// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:ppns_inspect/openCamera.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'package:ppns_inspect/globals.dart' as globals;

class RadioForm extends StatefulWidget {
  RadioForm(
      {required this.title,
      required this.option,
      required this.onChange,
      this.selected,
      Key? key})
      : super(key: key);
  List<String> option;
  String title;
  String? selected;
  final Function onChange;
  @override
  _RadioFormState createState() =>
      _RadioFormState(option: option, title: title);
}

class _RadioFormState extends State<RadioForm> {
  _RadioFormState({required this.title, required this.option});
  List<String> option;
  String title;
  String output = "";
  dataRadioForm outputs = dataRadioForm(selected: "", image: "");
  @override
  void initState() {
    super.initState();
    setState(() {
      output = option.first;
      outputs.selected = option.first;
      for (int a = 0; a < option.length; a++) {
        if (widget.selected == option[a]) output = option[a];
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChange(outputs);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          width: 500,
          height: (MediaQuery.of(context).size.width / 8.5 > title.length)
              ? 30
              : ((MediaQuery.of(context).size.width / 8.5) * 2 > title.length)
                  ? 45
                  : 70,
          // height: 45,
          child: ListTile(
            title: Text(title),
          ),
        ),
        for (int i = 0; i < option.length; i++)
          SizedBox(
            width: 500,
            height: 30,
            child: ListTile(
              title: Text(option[i]),
              leading: Radio<String>(
                value: option[i],
                groupValue: output,
                onChanged: (String? value) {
                  setState(() {
                    output = value!;
                    outputs.selected = value;
                  });
                  if (output != "Lainnya") widget.onChange(outputs);
                },
              ),
            ),
          ),
       
        if (output == "Lainnya")
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            // height: 60,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lainnya',
                labelStyle: TextStyle(fontSize: 20),
                // errorText: _error[1] ? 'Value Can\'t Be Empty' : null,
              ),
              onChanged: (value) {
                if (value != null && value != "") {
                  outputs.selected=value;
                  widget.onChange(outputs);
                }
              },
            ), // controller: _data[1],
          ),

          if (output != option[0])
          Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        WidgetsFlutterBinding.ensureInitialized();
                        final cameras = await availableCameras();
                        final firstCamera = cameras.first;
                        globals.tempDir = "";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                            return TakePictureScreen(camera: firstCamera);
                            }
                          )
                        ).then((value){
                          print(globals.tempDir);
                          outputs.image = globals.tempDir;
                          widget.onChange(outputs);
                        });
                      },
                      child: Text("Take Picture"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      side: BorderSide(color: Colors.red)))),
                    ),
                  ),
                  if(outputs.image != "")
                  Container(
                  margin: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DisplayPictureScreen(imagePath: outputs.image);
                              }
                            )
                          );
                        },
                        child: Text("Preview"),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    side: BorderSide(color: Colors.grey)))),
                      ),
                    ),
                  )
                ],
              )),
        SizedBox(height: 20),
      ]),
    );
  }
}
