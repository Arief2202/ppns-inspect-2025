// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppns_inspect/DisabledInput.dart';
import 'package:ppns_inspect/RadioForm.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:developer';

class InspeksiRumahPompa extends StatefulWidget {
  InspeksiRumahPompa({Key? key}) : super(key: key);

  @override
  _InspeksiRumahPompaState createState() => _InspeksiRumahPompaState();
}

class _InspeksiRumahPompaState extends State<InspeksiRumahPompa> {
  _InspeksiRumahPompaState();
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
  String durasi = "00:00";
  String lokasi = "";
  String kondisi = "";
  String ventilasi = "";
  String katup_hisap = "";
  String perpipaan = "";
  String pengukur_hisap = "";
  String pengukur_sistem = "";
  String tangki_hisap = "";
  String saringan_hisap = "";
  String katup_uji = "";
  String lampu_pengontrol = "";
  String lampu_saklar = "";
  String saklar_isolasi = "";
  String lampu_rotasi = "";
  String level_oli_motor = "";
  String pompa_pemeliharaan = "";
  String tangki_bahan_bakar = "";
  String saklar_pemilih = "";
  String pembacaan_tegangan = "";
  String pembacaan_arus = "";
  String lampu_baterai = "";
  String semua_lampu_alarm = "";
  String pengukur_waktu = "";
  String ketinggian_oli = "";
  String level_oli_mesin = "";
  String ketinggian_air = "";
  String tingkat_elektrolit = "";
  String terminal_baterai = "";
  String pemanas_jaket = "";
  String kondisi_uap = "";

  String lokasi_img = "";
  String kondisi_img = "";
  String ventilasi_img = "";
  String katup_hisap_img = "";
  String perpipaan_img = "";
  String pengukur_hisap_img = "";
  String pengukur_sistem_img = "";
  String tangki_hisap_img = "";
  String saringan_hisap_img = "";
  String katup_uji_img = "";
  String lampu_pengontrol_img = "";
  String lampu_saklar_img = "";
  String saklar_isolasi_img = "";
  String lampu_rotasi_img = "";
  String level_oli_motor_img = "";
  String pompa_pemeliharaan_img = "";
  String tangki_bahan_bakar_img = "";
  String saklar_pemilih_img = "";
  String pembacaan_tegangan_img = "";
  String pembacaan_arus_img = "";
  String lampu_baterai_img = "";
  String semua_lampu_alarm_img = "";
  String pengukur_waktu_img = "";
  String ketinggian_oli_img = "";
  String level_oli_mesin_img = "";
  String ketinggian_air_img = "";
  String tingkat_elektrolit_img = "";
  String terminal_baterai_img = "";
  String pemanas_jaket_img = "";
  String kondisi_uap_img = "";

  String lokasiText = "Lokasi";
  String kondisiText = "Kondisi rumah pompa Panas memadai";
  String ventilasiText = "Ventilasi";
  String katup_hisapText = "Katup hisap dan pelepasan pompa serta katup bypass terbuka penuh";
  String perpipaanText = "Perpipaan bebas dari kebocoran.";
  String pengukur_hisapText = "Pembacaan pengukur tekanan saluran hisap";
  String pengukur_sistemText = "Pembacaan pengukur tekanan saluran sistem";
  String tangki_hisapText = "Tangki hisap penuh";
  String saringan_hisapText = "Saringan hisap lubang basah";
  String katup_ujiText = "Katup uji aliran air";
  String lampu_pengontrolText = "Lampu pilot pengontrol (daya hidup) menyala.";
  String lampu_saklarText = "Lampu pilot normal sakelar transfer menyala";
  String saklar_isolasiText = "Sakelar isolasi tertutup — sumber siaga (darurat).";
  String lampu_rotasiText = "lampu pilot rotasi fase normal menyala.";
  String level_oli_motorText = "Level oli pada kaca penglihatan motor vertical";
  String pompa_pemeliharaanText = "Pompa pemeliharaan daya untuk tekanan jockey pump";
  String tangki_bahan_bakarText = "Tangki bahan bakar terisi minimal dua pertiganya.";
  String saklar_pemilihText = "Sakelar pemilih pengontrol berada pada posisi otomatis.";
  String pembacaan_teganganText = "Pembacaan tegangan baterai";
  String pembacaan_arusText = "Pembacaan arus pengisian baterai";
  String lampu_bateraiText = "lampu pilot baterai menyala atau baterai rusak lampu pilot mati.";
  String semua_lampu_alarmText = "Semua lampu pilot alarm mati";
  String pengukur_waktuText = "Pengukur waktu berjalan mesin sedang membaca";
  String ketinggian_oliText = "Ketinggian oli pada penggerak gigi sudut kanan";
  String level_oli_mesinText = "Level oli bak mesin";
  String ketinggian_airText = "Ketinggian air pendingin";
  String tingkat_elektrolitText = "Tingkat elektrolit dalam baterai";
  String terminal_bateraiText = "Terminal baterai bebas dari korosi";
  String pemanas_jaketText = "Pemanas jaket air sedang beroperasi";
  String kondisi_uapText = "Kondisi sistem uap";

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
                        "Inspeksi Rumah Pompa",
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
                                  RadioForm(title: "${lokasiText} :", option: ["Rumah Pompa Hydrant", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {lokasi = value!.selected; lokasi_img = value.image;});log("${lokasiText} : ${lokasi}");}),
                                  RadioForm(title: "${kondisiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {kondisi = value!.selected; kondisi_img = value.image;});log("${kondisiText} : ${kondisi}");}),
                                  RadioForm(title: "${ventilasiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {ventilasi = value!.selected; ventilasi_img = value.image;});log("${ventilasiText} : ${ventilasi}");}),
                                  RadioForm(title: "${katup_hisapText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {katup_hisap = value!.selected; katup_hisap_img = value.image;});log("${katup_hisapText} : ${katup_hisap}");}),
                                  RadioForm(title: "${perpipaanText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {perpipaan = value!.selected; perpipaan_img = value.image;});log("${perpipaanText} : ${perpipaan}");}),
                                  RadioForm(title: "${pengukur_hisapText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {pengukur_hisap = value!.selected; pengukur_hisap_img = value.image;});log("${pengukur_hisapText} : ${pengukur_hisap}");}),
                                  RadioForm(title: "${pengukur_sistemText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {pengukur_sistem = value!.selected; pengukur_sistem_img = value.image;});log("${pengukur_sistemText} : ${pengukur_sistem}");}),
                                  RadioForm(title: "${tangki_hisapText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {tangki_hisap = value!.selected; tangki_hisap_img = value.image;});log("${tangki_hisapText} : ${tangki_hisap}");}),
                                  RadioForm(title: "${saringan_hisapText} :", option: ["Tidak Terhalang", "Terhalang"], onChange: (dataRadioForm? value) {setState(() {saringan_hisap = value!.selected; saringan_hisap_img = value.image;});log("${saringan_hisapText} : ${saringan_hisap}");}),
                                  RadioForm(title: "${katup_ujiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {katup_uji = value!.selected; katup_uji_img = value.image;});log("${katup_ujiText} : ${katup_uji}");}),
                                  RadioForm(title: "${lampu_pengontrolText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {lampu_pengontrol = value!.selected; lampu_pengontrol_img = value.image;});log("${lampu_pengontrolText} : ${lampu_pengontrol}");}),
                                  RadioForm(title: "${lampu_saklarText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {lampu_saklar = value!.selected; lampu_saklar_img = value.image;});log("${lampu_saklarText} : ${lampu_saklar}");}),
                                  RadioForm(title: "${saklar_isolasiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {saklar_isolasi = value!.selected; saklar_isolasi_img = value.image;});log("${saklar_isolasiText} : ${saklar_isolasi}");}),
                                  RadioForm(title: "${lampu_rotasiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {lampu_rotasi = value!.selected; lampu_rotasi_img = value.image;});log("${lampu_rotasiText} : ${lampu_rotasi}");}),
                                  RadioForm(title: "${level_oli_motorText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {level_oli_motor = value!.selected; level_oli_motor_img = value.image;});log("${level_oli_motorText} : ${level_oli_motor}");}),
                                  RadioForm(title: "${pompa_pemeliharaanText} :", option: ["Disediakan", "Tidak Disediakan"], onChange: (dataRadioForm? value) {setState(() {pompa_pemeliharaan = value!.selected; pompa_pemeliharaan_img = value.image;});log("${pompa_pemeliharaanText} : ${pompa_pemeliharaan}");}),
                                  RadioForm(title: "${tangki_bahan_bakarText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {tangki_bahan_bakar = value!.selected; tangki_bahan_bakar_img = value.image;});log("${tangki_bahan_bakarText} : ${tangki_bahan_bakar}");}),
                                  RadioForm(title: "${saklar_pemilihText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {saklar_pemilih = value!.selected; saklar_pemilih_img = value.image;});log("${saklar_pemilihText} : ${saklar_pemilih}");}),
                                  RadioForm(title: "${pembacaan_teganganText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {pembacaan_tegangan = value!.selected; pembacaan_tegangan_img = value.image;});log("${pembacaan_teganganText} : ${pembacaan_tegangan}");}),
                                  RadioForm(title: "${pembacaan_arusText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {pembacaan_arus = value!.selected; pembacaan_arus_img = value.image;});log("${pembacaan_arusText} : ${pembacaan_arus}");}),
                                  RadioForm(title: "${lampu_bateraiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {lampu_baterai = value!.selected; lampu_baterai_img = value.image;});log("${lampu_bateraiText} : ${lampu_baterai}");}),
                                  RadioForm(title: "${semua_lampu_alarmText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {semua_lampu_alarm = value!.selected; semua_lampu_alarm_img = value.image;});log("${semua_lampu_alarmText} : ${semua_lampu_alarm}");}),
                                  RadioForm(title: "${pengukur_waktuText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {pengukur_waktu = value!.selected; pengukur_waktu_img = value.image;});log("${pengukur_waktuText} : ${pengukur_waktu}");}),
                                  RadioForm(title: "${ketinggian_oliText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {ketinggian_oli = value!.selected; ketinggian_oli_img = value.image;});log("${ketinggian_oliText} : ${ketinggian_oli}");}),
                                  RadioForm(title: "${level_oli_mesinText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {level_oli_mesin = value!.selected; level_oli_mesin_img = value.image;});log("${level_oli_mesinText} : ${level_oli_mesin}");}),
                                  RadioForm(title: "${ketinggian_airText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {ketinggian_air = value!.selected; ketinggian_air_img = value.image;});log("${ketinggian_airText} : ${ketinggian_air}");}),
                                  RadioForm(title: "${tingkat_elektrolitText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {tingkat_elektrolit = value!.selected; tingkat_elektrolit_img = value.image;});log("${tingkat_elektrolitText} : ${tingkat_elektrolit}");}),
                                  RadioForm(title: "${terminal_bateraiText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {terminal_baterai = value!.selected; terminal_baterai_img = value.image;});log("${terminal_bateraiText} : ${terminal_baterai}");}),
                                  RadioForm(title: "${pemanas_jaketText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {pemanas_jaket = value!.selected; pemanas_jaket_img = value.image;});log("${pemanas_jaketText} : ${pemanas_jaket}");}),
                                  RadioForm(title: "${kondisi_uapText} :", option: ["Aman", "Tidak Aman"], onChange: (dataRadioForm? value) {setState(() {kondisi_uap = value!.selected; kondisi_uap_img = value.image;});log("${kondisi_uapText} : ${kondisi_uap}");}),
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
                            var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_rumah_pompa.php?create&user_id=${globals.user_id}&lokasi=${lokasi}&kondisi=${kondisi}&ventilasi=${ventilasi}&katup_hisap=${katup_hisap}&perpipaan=${perpipaan}&pengukur_hisap=${pengukur_hisap}&pengukur_sistem=${pengukur_sistem}&tangki_hisap=${tangki_hisap}&saringan_hisap=${saringan_hisap}&katup_uji=${katup_uji}&lampu_pengontrol=${lampu_pengontrol}&lampu_saklar=${lampu_saklar}&saklar_isolasi=${saklar_isolasi}&lampu_rotasi=${lampu_rotasi}&level_oli_motor=${level_oli_motor}&pompa_pemeliharaan=${pompa_pemeliharaan}&tangki_bahan_bakar=${tangki_bahan_bakar}&saklar_pemilih=${saklar_pemilih}&pembacaan_tegangan=${pembacaan_tegangan}&pembacaan_arus=${pembacaan_arus}&lampu_baterai=${lampu_baterai}&semua_lampu_alarm=${semua_lampu_alarm}&pengukur_waktu=${pengukur_waktu}&ketinggian_oli=${ketinggian_oli}&level_oli_mesin=${level_oli_mesin}&ketinggian_air=${ketinggian_air}&tingkat_elektrolit=${tingkat_elektrolit}&terminal_baterai=${terminal_baterai}&pemanas_jaket=${pemanas_jaket}&kondisi_uap=${kondisi_uap}");
                            print(url);
                            try {
                              var request = http.MultipartRequest(
                                'POST',
                                Uri.parse("http://${globals.endpoint}/api_inspeksi_rumah_pompa.php"),
                              );
                              Map<String, String> headers = {"Content-type": "multipart/form-data"};
                              request.fields['create'] = "";
                              request.fields['user_id'] = "${globals.user_id}";
                              request.fields['lokasi'] = "${lokasi}";
                              request.fields['durasi_inspeksi'] = "${durasi}";
                              request.fields['kondisi'] = "${kondisi}";
                              request.fields['ventilasi'] = "${ventilasi}";
                              request.fields['katup_hisap'] = "${katup_hisap}";
                              request.fields['perpipaan'] = "${perpipaan}";
                              request.fields['pengukur_hisap'] = "${pengukur_hisap}";
                              request.fields['pengukur_sistem'] = "${pengukur_sistem}";
                              request.fields['tangki_hisap'] = "${tangki_hisap}";
                              request.fields['saringan_hisap'] = "${saringan_hisap}";
                              request.fields['katup_uji'] = "${katup_uji}";
                              request.fields['lampu_pengontrol'] = "${lampu_pengontrol}";
                              request.fields['lampu_saklar'] = "${lampu_saklar}";
                              request.fields['saklar_isolasi'] = "${saklar_isolasi}";
                              request.fields['lampu_rotasi'] = "${lampu_rotasi}";
                              request.fields['level_oli_motor'] = "${level_oli_motor}";
                              request.fields['pompa_pemeliharaan'] = "${pompa_pemeliharaan}";
                              request.fields['tangki_bahan_bakar'] = "${tangki_bahan_bakar}";
                              request.fields['saklar_pemilih'] = "${saklar_pemilih}";
                              request.fields['pembacaan_tegangan'] = "${pembacaan_tegangan}";
                              request.fields['pembacaan_arus'] = "${pembacaan_arus}";
                              request.fields['lampu_baterai'] = "${lampu_baterai}";
                              request.fields['semua_lampu_alarm'] = "${semua_lampu_alarm}";
                              request.fields['pengukur_waktu'] = "${pengukur_waktu}";
                              request.fields['ketinggian_oli'] = "${ketinggian_oli}";
                              request.fields['level_oli_mesin'] = "${level_oli_mesin}";
                              request.fields['ketinggian_air'] = "${ketinggian_air}";
                              request.fields['tingkat_elektrolit'] = "${tingkat_elektrolit}";
                              request.fields['terminal_baterai'] = "${terminal_baterai}";
                              request.fields['pemanas_jaket'] = "${pemanas_jaket}";
                              request.fields['kondisi_uap'] = "${kondisi_uap}";

                              if(lokasi_img != "") request.files.add(addPhoto(lokasi_img, 'lokasi_img'));
                              if(kondisi_img != "") request.files.add(addPhoto(kondisi_img, 'kondisi_img'));
                              if(ventilasi_img != "") request.files.add(addPhoto(ventilasi_img, 'ventilasi_img'));
                              if(katup_hisap_img != "") request.files.add(addPhoto(katup_hisap_img, 'katup_hisap_img'));
                              if(perpipaan_img != "") request.files.add(addPhoto(perpipaan_img, 'perpipaan_img'));
                              if(pengukur_hisap_img != "") request.files.add(addPhoto(pengukur_hisap_img, 'pengukur_hisap_img'));
                              if(pengukur_sistem_img != "") request.files.add(addPhoto(pengukur_sistem_img, 'pengukur_sistem_img'));
                              if(tangki_hisap_img != "") request.files.add(addPhoto(tangki_hisap_img, 'tangki_hisap_img'));
                              if(saringan_hisap_img != "") request.files.add(addPhoto(saringan_hisap_img, 'saringan_hisap_img'));
                              if(katup_uji_img != "") request.files.add(addPhoto(katup_uji_img, 'katup_uji_img'));
                              if(lampu_pengontrol_img != "") request.files.add(addPhoto(lampu_pengontrol_img, 'lampu_pengontrol_img'));
                              if(lampu_saklar_img != "") request.files.add(addPhoto(lampu_saklar_img, 'lampu_saklar_img'));
                              if(saklar_isolasi_img != "") request.files.add(addPhoto(saklar_isolasi_img, 'saklar_isolasi_img'));
                              if(lampu_rotasi_img != "") request.files.add(addPhoto(lampu_rotasi_img, 'lampu_rotasi_img'));
                              if(level_oli_motor_img != "") request.files.add(addPhoto(level_oli_motor_img, 'level_oli_motor_img'));
                              if(pompa_pemeliharaan_img != "") request.files.add(addPhoto(pompa_pemeliharaan_img, 'pompa_pemeliharaan_img'));
                              if(tangki_bahan_bakar_img != "") request.files.add(addPhoto(tangki_bahan_bakar_img, 'tangki_bahan_bakar_img'));
                              if(saklar_pemilih_img != "") request.files.add(addPhoto(saklar_pemilih_img, 'saklar_pemilih_img'));
                              if(pembacaan_tegangan_img != "") request.files.add(addPhoto(pembacaan_tegangan_img, 'pembacaan_tegangan_img'));
                              if(pembacaan_arus_img != "") request.files.add(addPhoto(pembacaan_arus_img, 'pembacaan_arus_img'));
                              if(lampu_baterai_img != "") request.files.add(addPhoto(lampu_baterai_img, 'lampu_baterai_img'));
                              if(semua_lampu_alarm_img != "") request.files.add(addPhoto(semua_lampu_alarm_img, 'semua_lampu_alarm_img'));
                              if(pengukur_waktu_img != "") request.files.add(addPhoto(pengukur_waktu_img, 'pengukur_waktu_img'));
                              if(ketinggian_oli_img != "") request.files.add(addPhoto(ketinggian_oli_img, 'ketinggian_oli_img'));
                              if(level_oli_mesin_img != "") request.files.add(addPhoto(level_oli_mesin_img, 'level_oli_mesin_img'));
                              if(ketinggian_air_img != "") request.files.add(addPhoto(ketinggian_air_img, 'ketinggian_air_img'));
                              if(tingkat_elektrolit_img != "") request.files.add(addPhoto(tingkat_elektrolit_img, 'tingkat_elektrolit_img'));
                              if(terminal_baterai_img != "") request.files.add(addPhoto(terminal_baterai_img, 'terminal_baterai_img'));
                              if(pemanas_jaket_img != "") request.files.add(addPhoto(pemanas_jaket_img, 'pemanas_jaket_img'));
                              if(kondisi_uap_img != "") request.files.add(addPhoto(kondisi_uap_img, 'kondisi_uap_img'));

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