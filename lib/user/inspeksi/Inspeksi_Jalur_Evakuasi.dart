// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppns_inspect/DisabledInput.dart';
import 'package:ppns_inspect/RadioForm.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:developer';

class InspeksiJalurEvakuasi extends StatefulWidget {
  InspeksiJalurEvakuasi({Key? key}) : super(key: key);

  @override
  _InspeksiJalurEvakuasiState createState() => _InspeksiJalurEvakuasiState();
}

class _InspeksiJalurEvakuasiState extends State<InspeksiJalurEvakuasi> {
  _InspeksiJalurEvakuasiState();
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
  String kebersihan = "";
  String penanda_exit = "";
  String kebebasan_hambatan = "";
  String penerangan_jalur = "";
  String tanda_arah = "";
  String material_lantai = "";
  String tanda_pintu_darurat = "";
  String pegangan_rambat = "";
  String pencahayaan_darurat = "";
  String identifikasi_titik_kumpul = "";
  String jalur_menuju_titik_kumpul = "";
  String peralatan_darurat = "";
  String peta_evakuasi = "";

  static String kebersihanText = "Akses eksit gedung bersih";
  static String penanda_exitText = "Terdapat tanda yang jelas dan mudah terlihat menuju pintu eksit";
  static String kebebasan_hambatanText = "Jalur evakuasi bebas dari barang-barang yang mengganggu kelancaran evakuasi.";
  static String penerangan_jalurText = "Penerangan cukup, termasuk pencahayaan darurat jika listrik padam.";
  static String tanda_arahText = "Terdapat petunjuk arah yang jelas menuju pintu keluar darurat.";
  static String material_lantaiText = "Material lantai tidak licin dan aman untuk dilewati.";
  static String tanda_pintu_daruratText = "Pintu keluar darurat diberi tanda yang jelas dan mudah dikenali.";
  static String pegangan_rambatText = "Terdapat railing di salah satu sisi koridor, terutama untuk disabilitas.";
  static String pencahayaan_daruratText = "Koridor dilengkapi pencahayaan darurat otomatis saat keadaan darurat terjadi.";
  static String identifikasi_titik_kumpulText = "Titik kumpul ditandai dengan jelas dan mudah terlihat oleh semua orang.";
  static String jalur_menuju_titik_kumpulText = "Jalur menuju titik kumpul jelas, praktis, dan tidak terhambat oleh apapun.";
  static String peralatan_daruratText = "Tersedia APAR, kotak P3K,  atau peralatan lain di lokasi strategis.";
  static String peta_evakuasiText = "Peta jalur evakuasi tersedia di lokasi yang mudah dilihat oleh pengguna gedung.";


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
                                  RadioForm(title: "${kebersihanText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {kebersihan = value!;});log("${kebersihanText} : ${kebersihan}");}),
                                  RadioForm(title: "${penanda_exitText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {penanda_exit = value!;});log("${penanda_exitText} : ${penanda_exit}");}),
                                  RadioForm(title: "${kebebasan_hambatanText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {kebebasan_hambatan = value!;});log("${kebebasan_hambatanText} : ${kebebasan_hambatan}");}),
                                  RadioForm(title: "${penerangan_jalurText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {penerangan_jalur = value!;});log("${penerangan_jalurText} : ${penerangan_jalur}");}),
                                  RadioForm(title: "${tanda_arahText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {tanda_arah = value!;});log("${tanda_arahText} : ${tanda_arah}");}),
                                  RadioForm(title: "${material_lantaiText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {material_lantai = value!;});log("${material_lantaiText} : ${material_lantai}");}),
                                  RadioForm(title: "${tanda_pintu_daruratText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {tanda_pintu_darurat = value!;});log("${tanda_pintu_daruratText} : ${tanda_pintu_darurat}");}),
                                  RadioForm(title: "${pegangan_rambatText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {pegangan_rambat = value!;});log("${pegangan_rambatText} : ${pegangan_rambat}");}),
                                  RadioForm(title: "${pencahayaan_daruratText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {pencahayaan_darurat = value!;});log("${pencahayaan_daruratText} : ${pencahayaan_darurat}");}),
                                  RadioForm(title: "${identifikasi_titik_kumpulText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {identifikasi_titik_kumpul = value!;});log("${identifikasi_titik_kumpulText} : ${identifikasi_titik_kumpul}");}),
                                  RadioForm(title: "${jalur_menuju_titik_kumpulText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {jalur_menuju_titik_kumpul = value!;});log("${jalur_menuju_titik_kumpulText} : ${jalur_menuju_titik_kumpul}");}),
                                  RadioForm(title: "${peralatan_daruratText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {peralatan_darurat = value!;});log("${peralatan_daruratText} : ${peralatan_darurat}");}),
                                  RadioForm(title: "${peta_evakuasiText} :", option: ["Ya", "Tidak", "Lainnya"], onChange: (String? value) {setState(() {peta_evakuasi = value!;});log("${peta_evakuasiText} : ${peta_evakuasi}");}),
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
                            var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_jalur_evakuasi.php?create&user_id=${globals.user_id}&kebersihan=${kebersihan}&penanda_exit=${penanda_exit}&kebebasan_hambatan=${kebebasan_hambatan}&penerangan_jalur=${penerangan_jalur}&tanda_arah=${tanda_arah}&material_lantai=${material_lantai}&tanda_pintu_darurat=${tanda_pintu_darurat}&pegangan_rambat=${pegangan_rambat}&pencahayaan_darurat=${pencahayaan_darurat}&identifikasi_titik_kumpul=${identifikasi_titik_kumpul}&jalur_menuju_titik_kumpul=${jalur_menuju_titik_kumpul}&peralatan_darurat=${peralatan_darurat}&peta_evakuasi=${peta_evakuasi}");  
                            try {
                              final response = await http.get(url).timeout(
                                const Duration(seconds: 2),
                                onTimeout: () {
                                  return http.Response('Error', 408);
                                },
                              );
                              print(response.statusCode);
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