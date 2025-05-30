// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppns_inspect/DisabledInput.dart';
import 'package:ppns_inspect/RadioForm.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:developer';

class InspeksiP3K extends StatefulWidget {
  InspeksiP3K({required this.nomor, required this.id, Key? key}) : super(key: key);
  String nomor;
  String id;
  @override
  _InspeksiP3KState createState() => _InspeksiP3KState(nomor: nomor);
}

class _InspeksiP3KState extends State<InspeksiP3K> {
  _InspeksiP3KState({required this.nomor});
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
  String kasa_steril_bungkus = "";
  String perban5 = "";
  String perban10 = "";
  String plester125 = "";
  String plester_cepat = "";
  String kapas = "";
  String mitella = "";
  String gunting = "";
  String peniti = "";
  String sarung_tangan = "";
  String masker = "";
  String pinset = "";
  String lampu_senter = "";
  String gelas_cuci_mata = "";
  String kantong_plastik = "";
  String aquades = "";

  @override
  void initState() {
    super.initState();

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
                        "Inspeksi Kotak P3K",
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
                                  RadioForm(title: "Kasa Steril Bungkus :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {kasa_steril_bungkus = value!;});log("kasa_steril_bungkus: ${kasa_steril_bungkus}");}),
                                  RadioForm(title: "Perban (lebar 5cm) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {perban5 = value!;});log("perban5: ${perban5}");}),
                                  RadioForm(title: "Perban (lebar 10cm) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {perban10 = value!;});log("perban10: ${perban10}");}),
                                  RadioForm(title: "Plester (lebar 1.25cm) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {plester125 = value!;});log("plester125: ${plester125}");}),
                                  RadioForm(title: "Plester Cepat :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {plester_cepat = value!;});log("plester_cepat: ${plester_cepat}");}),
                                  RadioForm(title: "Kapas (25 Gram) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {kapas = value!;});log("kapas: ${kapas}");}),
                                  RadioForm(title: "Kain Segitiga / Mitela:", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {mitella = value!;});log("mitella: ${mitella}");}),
                                  RadioForm(title: "Gunting :", option: ["Berfungsi", "Rusak", "Lainnya"], onChange: (String? value) {setState(() {gunting = value!;});log("gunting: ${gunting}");}),
                                  RadioForm(title: "Peniti :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {peniti = value!;});log("peniti: ${peniti}");}),
                                  RadioForm(title: "Sarung Tangan Sekali Pakai :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {sarung_tangan = value!;});log("sarung_tangan: ${sarung_tangan}");}),
                                  RadioForm(title: "Masker :", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {masker = value!;});log("masker: ${masker}");}),
                                  RadioForm(title: "Pinset :", option: ["Berfungsi", "Rusak", "Lainnya"], onChange: (String? value) {setState(() {pinset = value!;});log("pinset: ${pinset}");}),
                                  RadioForm(title: "Lampu Senter:", option: ["Berfungsi", "Rusak", "Lainnya"], onChange: (String? value) {setState(() {lampu_senter = value!;});log("lampu_senter: ${lampu_senter}");}),
                                  RadioForm(title: "Gelas Untuk Cuci Mata:", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {gelas_cuci_mata = value!;});log("gelas_cuci_mata: ${gelas_cuci_mata}");}),
                                  RadioForm(title: "Kantong Plastik Bersih:", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {kantong_plastik = value!;});log("kantong_plastik: ${kantong_plastik}");}),
                                  RadioForm(title: "Aquades (100ml lar Saline):", option: ["Ada", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {aquades = value!;});log("aquades: ${aquades}");}),
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
                            var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_p3k.php?create&user_id=${globals.user_id}&kotak_id=${widget.id}&kasa_steril_bungkus=${kasa_steril_bungkus}&perban5=${perban5}&perban10=${perban10}&plester125=${plester125}&plester_cepat=${plester_cepat}&kapas=${kapas}&mitella=${mitella}&gunting=${gunting}&peniti=${peniti}&sarung_tangan=${sarung_tangan}&masker=${masker}&pinset=${pinset}&lampu_senter=${lampu_senter}&gelas_cuci_mata=${gelas_cuci_mata}&kantong_plastik=${kantong_plastik}&aquades=${aquades}");  
                            try {
                              final response = await http.get(url).timeout(
                                const Duration(seconds: 1),
                                onTimeout: () {
                                  return http.Response('Error', 408);
                                },
                              );
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