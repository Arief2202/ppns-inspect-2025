// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppns_inspect/DisabledInput.dart';
import 'package:ppns_inspect/RadioForm.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:developer';

class InspeksiHydrantOHB extends StatefulWidget {
  InspeksiHydrantOHB({required this.nomor, required this.id, Key? key}) : super(key: key);
  String nomor;
  String id;
  @override
  _InspeksiHydrantOHBState createState() => _InspeksiHydrantOHBState(nomor: nomor);
}

class _InspeksiHydrantOHBState extends State<InspeksiHydrantOHB> {
  _InspeksiHydrantOHBState({required this.nomor});
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
  String nomor;
  String durasi = "00:00";

  String kondisi_kotak = "";
  String posisi_kotak = "";
  String kondisi_nozzle= "";
  String kondisi_selang = "";
  String jenis_selang = "";
  String kondisi_coupling = "";
  String tuas_pembuka = "";
  String kondisi_outlet = "";
  String penutup_cop = "";
  String flushing_hydrant = "";
  String tekanan_hydrant = "";

  String kondisi_kotak_img = "";
  String posisi_kotak_img = "";
  String kondisi_nozzle_img = "";
  String kondisi_selang_img = "";
  String jenis_selang_img = "";
  String kondisi_coupling_img = "";
  String tuas_pembuka_img = "";
  String kondisi_outlet_img = "";
  String penutup_cop_img = "";
  String flushing_hydrant_img = "";
  String tekanan_hydrant_img = "";

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
                        "Inspeksi Hydrant OHB",
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
                                  disabledInput("Nomor", "${nomor}"), 
                                  SizedBox(height: 20),
                                  disabledInput("Email Inspektor", "${globals.user_email}"),   
                                  SizedBox(height: 20),
                                  disabledInput("Tanggal Inspeksi", "${now.day} ${monthName[now.month-1]} ${now.year}"),                
                                  RadioForm(title: "Kondisi Kotak :", option: ["Bersih", "Kotor", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kondisi_kotak = value!.selected; kondisi_kotak_img = value.image;});log("Kondisi Kotak : ${kondisi_kotak}");}),
                                  RadioForm(title: "Posisi Kotak :", option: ["Tidak Terhalang", "Terhalang"], onChange: (dataRadioForm? value) {setState(() {posisi_kotak = value!.selected; posisi_kotak_img = value.image;});log("Posisi Kotak : ${posisi_kotak}");}),
                                  RadioForm(title: "Kondisi Nozzle :", option: ["Baik", "Rusak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kondisi_nozzle = value!.selected; kondisi_nozzle_img = value.image;});log("Kondisi Nozzle : ${kondisi_nozzle}");}),
                                  RadioForm(title: "Kondisi Selang :", option: ["Baik", "Bocor", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kondisi_selang = value!.selected; kondisi_selang_img = value.image;});log("Kondisi Selang : ${kondisi_selang}");}),
                                  RadioForm(title: "Jenis Selang :", option: ["Kanvas hose", "Rubber hose"], onChange: (dataRadioForm? value) {setState(() {jenis_selang = value!.selected; jenis_selang_img = value.image;});log("Jenis Selang : ${jenis_selang}");}),
                                  RadioForm(title: "Kondisi Coupling :", option: ["Baik", "Rusak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kondisi_coupling = value!.selected; kondisi_coupling_img = value.image;});log("Kondisi Coupling : ${kondisi_coupling}");}),
                                  RadioForm(title: "Tuas Pembuka Pillar Hydrant : ", option: ["Tersedia", "Tidak Tersedia"], onChange: (dataRadioForm? value) {setState(() {tuas_pembuka = value!.selected; tuas_pembuka_img = value.image;});log("Tuas Pembuka Pillar Hydrant : ${tuas_pembuka}");}),
                                  RadioForm(title: "Kondisi Outlet Cop dan Bonet Pillar Hydrant :", option: ["Baik", "Bocor", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kondisi_outlet = value!.selected; kondisi_outlet_img = value.image;});log("Kondisi Outlet Cop dan Bonet Pillar Hydrant : ${kondisi_outlet}");}),
                                  RadioForm(title: "Penutup Cop Hydrant :", option: ["Baik", "Retak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {penutup_cop = value!.selected; penutup_cop_img = value.image;});log("Penutup Cop Hydrant : ${penutup_cop}");}),
                                  RadioForm(title: "Apakah akan dilakukan flushing Hydrant :", option: ["Ya", "Tidak"], onChange: (dataRadioForm? value) {setState(() {flushing_hydrant = value!.selected; flushing_hydrant_img = value.image;});log("Apakah akan dilakukan flushing Hydrant : ${flushing_hydrant}");}),
                                  RadioForm(title: "Berapa Tekanan Jalur Hydrant :", option: ["Tidak ada Pressure Gauge", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {tekanan_hydrant = value!.selected; tekanan_hydrant_img = value.image;});log("Berapa Tekanan Jalur Hydrant : ${tekanan_hydrant}");}),
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
                            // var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_ohb.php?create&user_id=${globals.user_id}&hydrant_id=${widget.id}&kondisi_kotak=${kondisi_kotak}&posisi_kotak=${posisi_kotak}&kondisi_nozzle=${kondisi_nozzle}&kondisi_selang=${kondisi_selang}&jenis_selang=${jenis_selang}&kondisi_coupling=${kondisi_coupling}&tuas_pembuka=${tuas_pembuka}&kondisi_outlet=${kondisi_outlet}&penutup_cop=${penutup_cop}&flushing_hydrant=${flushing_hydrant}&tekanan_hydrant=${tekanan_hydrant}&durasi_inspeksi=${durasi}");  
                            try {
                              var request = http.MultipartRequest(
                                'POST',
                                Uri.parse("http://${globals.endpoint}/api_inspeksi_ohb.php"),
                              );
                              Map<String, String> headers = {"Content-type": "multipart/form-data"};
                              request.fields['create'] = "";
                              request.fields['user_id'] = "${globals.user_id}";
                              request.fields['hydrant_id'] = "${widget.id}";
                              request.fields['durasi_inspeksi'] = "${durasi}";
                              request.fields['kondisi_kotak'] = "${kondisi_kotak}";
                              request.fields['posisi_kotak'] = "${posisi_kotak}";
                              request.fields['kondisi_nozzle'] = "${kondisi_nozzle}";
                              request.fields['kondisi_selang'] = "${kondisi_selang}";
                              request.fields['jenis_selang'] = "${jenis_selang}";
                              request.fields['kondisi_coupling'] = "${kondisi_coupling}";
                              request.fields['tuas_pembuka'] = "${tuas_pembuka}";
                              request.fields['kondisi_outlet'] = "${kondisi_outlet}";
                              request.fields['penutup_cop'] = "${penutup_cop}";
                              request.fields['flushing_hydrant'] = "${flushing_hydrant}";
                              request.fields['tekanan_hydrant'] = "${tekanan_hydrant}";

                              if(kondisi_kotak_img != "") request.files.add(addPhoto(kondisi_kotak_img, 'kondisi_kotak_img'));
                              if(posisi_kotak_img != "") request.files.add(addPhoto(posisi_kotak_img, 'posisi_kotak_img'));
                              if(kondisi_nozzle_img != "") request.files.add(addPhoto(kondisi_nozzle_img, 'kondisi_nozzle_img'));
                              if(kondisi_selang_img != "") request.files.add(addPhoto(kondisi_selang_img, 'kondisi_selang_img'));
                              if(jenis_selang_img != "") request.files.add(addPhoto(jenis_selang_img, 'jenis_selang_img'));
                              if(kondisi_coupling_img != "") request.files.add(addPhoto(kondisi_coupling_img, 'kondisi_coupling_img'));
                              if(tuas_pembuka_img != "") request.files.add(addPhoto(tuas_pembuka_img, 'tuas_pembuka_img'));
                              if(kondisi_outlet_img != "") request.files.add(addPhoto(kondisi_outlet_img, 'kondisi_outlet_img'));
                              if(penutup_cop_img != "") request.files.add(addPhoto(penutup_cop_img, 'penutup_cop_img'));
                              if(flushing_hydrant_img != "") request.files.add(addPhoto(flushing_hydrant_img, 'flushing_hydrant_img'));
                              if(tekanan_hydrant_img != "") request.files.add(addPhoto(tekanan_hydrant_img, 'tekanan_hydrant_img'));

                              request.headers.addAll(headers);
                              print("request: " + request.toString());
                              var response = await request.send().timeout(
                                const Duration(seconds: 1)
                              );

                              // final response = await http.get(url).timeout(
                              //   const Duration(seconds: 1),
                              //   onTimeout: () {
                              //     return http.Response('Error', 408);
                              //   },
                              // );
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