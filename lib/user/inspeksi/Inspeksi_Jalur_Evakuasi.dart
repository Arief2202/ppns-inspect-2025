// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppns_inspect/DisabledInput.dart';
import 'package:ppns_inspect/RadioForm.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:developer';

class InspeksiJalurEvakuasi extends StatefulWidget {
  InspeksiJalurEvakuasi({required this.lokasi, Key? key}) : super(key: key);
  String lokasi;
  @override
  _InspeksiJalurEvakuasiState createState() => _InspeksiJalurEvakuasiState(lokasi: lokasi);
}

class _InspeksiJalurEvakuasiState extends State<InspeksiJalurEvakuasi> {
  _InspeksiJalurEvakuasiState({required this.lokasi});
  DateTime now = DateTime.now();
  static List<String> monthName = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  String lokasi = "";
  String pintu_terkunci = "" ;
  String pintu_berfungsi = "" ;
  String ganjal = "" ;
  String ganjal_tangga = "" ;
  String kebersihan_tangga = "" ;
  String hambatan_eksit = "" ; 
  String eksit_terkunci = "" ; 
  String visibilitas_eksit = "" ; 
  String pencahayaan_eksit = "" ;

  String lokasi_img = "";
  String pintu_terkunci_img = "" ;
  String pintu_berfungsi_img = "" ;
  String ganjal_img = "" ;
  String ganjal_tangga_img = "" ;
  String kebersihan_tangga_img = "" ;
  String hambatan_eksit_img = "" ; 
  String eksit_terkunci_img = "" ; 
  String visibilitas_eksit_img = "" ; 
  String pencahayaan_eksit_img = "" ;

  String durasi = "00:00";

  static String pintu_terkunci_text = "Pintu eksit tidak terkunci.";
  static String pintu_berfungsi_text = "Pintu eksit berfungsi.";
  static String ganjal_text = "Ketersediaan ganjal pintu eksit.";
  static String ganjal_tangga_text = "Ketersediaan ganjal untuk menahan pintu tangga kebakaran.";
  static String kebersihan_tangga_text = "Kondisi tangga kebakaran.";
  static String hambatan_eksit_text = "Akses eksit bebas hambatan";
  static String eksit_terkunci_text = "Eksit pelepasan di lantai dasar tidak terkunci.";
  static String visibilitas_eksit_text = "Visibilitas tanda eksit.";
  static String pencahayaan_eksit_text = "Lampu Pencahayaan Tanda Eksit.";

  @override
  void initState() {
    super.initState();
    globals.page = "inspeksi";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 35),
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
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 110),
                      child: Text(
                        "Inspeksi Jalur Evakuasi",
                        style: TextStyle(
                            fontFamily: "SanFrancisco",
                            decoration: TextDecoration.none,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 50, 50)),
                      ),
                    ),
                  ])),

              Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 215,
                      margin: EdgeInsets.only(top: 150),
                      // decoration: new BoxDecoration(color: const Color.fromARGB(49, 244, 67, 54)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [           
                                  SizedBox(height: 20),
                                  disabledInput("Email Inspektor", "${globals.user_email}"),   
                                  SizedBox(height: 20),
                                  disabledInput("Tanggal Inspeksi", "${now.day} ${monthName[now.month-1]} ${now.year}"),  
                                  SizedBox(height: 20),
                                  disabledInput("Lokasi", "${lokasi}"),     
                                  SizedBox(height: 30),
                                  Text("1. Pintu Exit",style: TextStyle(fontFamily: "SanFrancisco",decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 16)),           
                                  RadioForm(title: "${pintu_terkunci_text} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {pintu_terkunci = value!.selected; pintu_terkunci_img = value.image;});log("${pintu_terkunci_text} : ${pintu_terkunci}");}),
                                  RadioForm(title: "${pintu_berfungsi_text} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {pintu_berfungsi = value!.selected; pintu_berfungsi_img = value.image;});log("${pintu_berfungsi_text} : ${pintu_berfungsi}");}),
                                  RadioForm(title: "${ganjal_text} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {ganjal = value!.selected; ganjal_img = value.image;});log("${ganjal_text} : ${ganjal}");}),
                                  SizedBox(height: 30),
                                  Text("2. Tangga Kebakaran",style: TextStyle(fontFamily: "SanFrancisco",decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 16)),           
                                  RadioForm(title: "${ganjal_tangga_text} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {ganjal_tangga = value!.selected; ganjal_tangga_img = value.image;});log("${ganjal_tangga_text} : ${ganjal_tangga}");}),
                                  RadioForm(title: "${kebersihan_tangga_text} :", option: ["Bersih", "Kotor", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kebersihan_tangga = value!.selected; kebersihan_tangga_img = value.image;});log("${kebersihan_tangga_text} : ${kebersihan_tangga}");}),
                                  SizedBox(height: 30),
                                  Text("3. Akses eksit dan koridor untuk jalur ke luar",style: TextStyle(fontFamily: "SanFrancisco",decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 16)),           
                                  RadioForm(title: "${hambatan_eksit_text} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {hambatan_eksit = value!.selected; hambatan_eksit_img = value.image;});log("${hambatan_eksit_text} : ${hambatan_eksit}");}),
                                  SizedBox(height: 30),
                                  Text("4. Eksit pelepasan di lantai dasar",style: TextStyle(fontFamily: "SanFrancisco",decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 16)),           
                                  RadioForm(title: "${eksit_terkunci_text} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {eksit_terkunci = value!.selected; eksit_terkunci_img = value.image;});log("${eksit_terkunci_text} : ${eksit_terkunci}");}),
                                  SizedBox(height: 30),
                                  Text("5. Tanda Eksit",style: TextStyle(fontFamily: "SanFrancisco",decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 16)),           
                                  RadioForm(title: "${visibilitas_eksit_text} :", option: ["Terlihat", "Terhalang", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {visibilitas_eksit = value!.selected; visibilitas_eksit_img = value.image;});log("${visibilitas_eksit_text} : ${visibilitas_eksit}");}),
                                  RadioForm(title: "${pencahayaan_eksit_text} :", option: ["Menyala", "Mati", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {pencahayaan_eksit = value!.selected; pencahayaan_eksit_img = value.image;});log("${pencahayaan_eksit_text} : ${pencahayaan_eksit}");}),
                                  Padding(padding: EdgeInsets.all(20))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ])),

                  Align(
                  alignment: Alignment.bottomRight,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left:20, right: 20, top: MediaQuery.of(context).size.height-60),
                      child: 
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white
                          ),
                          onPressed: () async{     
                            Duration diff = DateTime.now().difference(now);                            
                            int days = diff.inDays;
                            int hours = diff.inHours % 24;
                            int minutes = diff.inMinutes % 60;
                            int seconds = diff.inSeconds % 60;
                            durasi = "";
                            if(days > 0) durasi += "${days} Hari ";                      
                            durasi += hours<10? '0' : '';
                            durasi += "${hours}:";
                            durasi += minutes<10? '0' : '';
                            durasi += "${minutes}:";
                            durasi += seconds<10? '0' : '';
                            durasi += "${seconds}";
                            // var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_jalur_evakuasi.php?create&user_id=${globals.user_id}&lokasi=${lokasi}&pintu_terkunci=${pintu_terkunci}&pintu_berfungsi=${pintu_berfungsi}&ganjal=${ganjal}&ganjal_tangga=${ganjal_tangga}&kebersihan_tangga=${kebersihan_tangga}&hambatan_eksit=${hambatan_eksit}&eksit_terkunci=${eksit_terkunci}&visibilitas_eksit=${visibilitas_eksit}&pencahayaan_eksit=${pencahayaan_eksit}&durasi_inspeksi=${durasi}");  

                            try {
                              var request = http.MultipartRequest(
                                'POST',
                                Uri.parse("http://${globals.endpoint}/api_inspeksi_jalur_evakuasi.php"),
                              );
                              Map<String, String> headers = {"Content-type": "multipart/form-data"};
                              request.fields['create'] = "";
                              request.fields['user_id'] = "${globals.user_id}";
                              request.fields['lokasi'] = "${lokasi}";
                              request.fields['durasi_inspeksi'] = "${durasi}";
                              request.fields['pintu_terkunci'] = "${pintu_terkunci}";
                              request.fields['pintu_berfungsi'] = "${pintu_berfungsi}";
                              request.fields['ganjal'] = "${ganjal}";
                              request.fields['ganjal_tangga'] = "${ganjal_tangga}";
                              request.fields['kebersihan_tangga'] = "${kebersihan_tangga}";
                              request.fields['hambatan_eksit'] = "${hambatan_eksit}";
                              request.fields['eksit_terkunci'] = "${eksit_terkunci}";
                              request.fields['visibilitas_eksit'] = "${visibilitas_eksit}";
                              request.fields['pencahayaan_eksit'] = "${pencahayaan_eksit}";

                              if(pintu_terkunci_img != "") request.files.add(addPhoto(pintu_terkunci_img, 'pintu_terkunci_img'));
                              if(pintu_berfungsi_img != "") request.files.add(addPhoto(pintu_berfungsi_img, 'pintu_berfungsi_img'));
                              if(ganjal_img != "") request.files.add(addPhoto(ganjal_img, 'ganjal_img'));
                              if(ganjal_tangga_img != "") request.files.add(addPhoto(ganjal_tangga_img, 'ganjal_tangga_img'));
                              if(kebersihan_tangga_img != "") request.files.add(addPhoto(kebersihan_tangga_img, 'kebersihan_tangga_img'));
                              if(hambatan_eksit_img != "") request.files.add(addPhoto(hambatan_eksit_img, 'hambatan_eksit_img'));
                              if(eksit_terkunci_img != "") request.files.add(addPhoto(eksit_terkunci_img, 'eksit_terkunci_img'));
                              if(visibilitas_eksit_img != "") request.files.add(addPhoto(visibilitas_eksit_img, 'visibilitas_eksit_img'));
                              if(pencahayaan_eksit_img != "") request.files.add(addPhoto(pencahayaan_eksit_img, 'pencahayaan_eksit_img'));

                              request.headers.addAll(headers);
                              print("request: " + request.toString());
                              var response = await request.send().timeout(
                                const Duration(seconds: 1)
                              );

                              // final response = await http.get(url).timeout(
                              //   const Duration(seconds: 2),
                              //   onTimeout: () {
                              //     return http.Response('Error', 408);
                              //   },
                              // );
                              // print(response.statusCode);
                              if (response.statusCode == 200) {
                                
                                  Alert(
                                    context: context,
                                    type: AlertType.success,
                                    onWillPopActive: true,
                                    title: "Inspeksi Berhasil!",
                                    buttons: [
                                      DialogButton(
                                          child: Text(
                                            "Close",
                                            style:
                                                TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  ).show();
                              }
                              else{
                                
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Inspeksi Gagal!\nHubungi Admin",
                                    buttons: [
                                      DialogButton(
                                          child: Text(
                                            "Close",
                                            style:
                                                TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  ).show();
                              }
                            } on Exception catch (_) {}
                          }, 
                          child: Text("Submit")
                        ),
                    ),
                  ]
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}