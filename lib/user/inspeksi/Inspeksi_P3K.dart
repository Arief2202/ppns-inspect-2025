// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppns_inspect/DisabledInput.dart';
import 'package:ppns_inspect/RadioForm.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
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
  String durasi = "00:00";
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
  String oxygen = "";
  String obat_luka_bakar = "";
  String buku_catatan = "";
  String daftar_isi = "";

  String kasa_steril_bungkus_img = "";
  String perban5_img = "";
  String perban10_img = "";
  String plester125_img = "";
  String plester_cepat_img = "";
  String kapas_img = "";
  String mitella_img = "";
  String gunting_img = "";
  String peniti_img = "";
  String sarung_tangan_img = "";
  String masker_img = "";
  String pinset_img = "";
  String lampu_senter_img = "";
  String gelas_cuci_mata_img = "";
  String kantong_plastik_img = "";
  String aquades_img = "";
  String oxygen_img = "";
  String obat_luka_bakar_img = "";
  String buku_catatan_img = "";
  String daftar_isi_img = "";

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
                                  RadioForm(title: "Kasa Steril Bungkus :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kasa_steril_bungkus = value!.selected; kasa_steril_bungkus_img = value.image;});log("kasa_steril_bungkus: ${kasa_steril_bungkus}");}),
                                  RadioForm(title: "Perban (lebar 5cm) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {perban5 = value!.selected; perban5_img = value.image;});log("perban5: ${perban5}");}),
                                  RadioForm(title: "Perban (lebar 10cm) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {perban10 = value!.selected; perban10_img = value.image;});log("perban10: ${perban10}");}),
                                  RadioForm(title: "Plester (lebar 1.25cm) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {plester125 = value!.selected; plester125_img = value.image;});log("plester125: ${plester125}");}),
                                  RadioForm(title: "Plester Cepat :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {plester_cepat = value!.selected; plester_cepat_img = value.image;});log("plester_cepat: ${plester_cepat}");}),
                                  RadioForm(title: "Kapas (25 Gram) :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kapas = value!.selected; kapas_img = value.image;});log("kapas: ${kapas}");}),
                                  RadioForm(title: "Kain Segitiga / Mitela:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {mitella = value!.selected; mitella_img = value.image;});log("mitella: ${mitella}");}),
                                  RadioForm(title: "Gunting :", option: ["Berfungsi", "Rusak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {gunting = value!.selected; gunting_img = value.image;});log("gunting: ${gunting}");}),
                                  RadioForm(title: "Peniti :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {peniti = value!.selected; peniti_img = value.image;});log("peniti: ${peniti}");}),
                                  RadioForm(title: "Sarung Tangan Sekali Pakai :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {sarung_tangan = value!.selected; sarung_tangan_img = value.image;});log("sarung_tangan: ${sarung_tangan}");}),
                                  RadioForm(title: "Masker :", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {masker = value!.selected; masker_img = value.image;});log("masker: ${masker}");}),
                                  RadioForm(title: "Pinset :", option: ["Berfungsi", "Rusak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {pinset = value!.selected; pinset_img = value.image;});log("pinset: ${pinset}");}),
                                  RadioForm(title: "Lampu Senter:", option: ["Berfungsi", "Rusak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {lampu_senter = value!.selected; lampu_senter_img = value.image;});log("lampu_senter: ${lampu_senter}");}),
                                  RadioForm(title: "Gelas Untuk Cuci Mata:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {gelas_cuci_mata = value!.selected; gelas_cuci_mata_img = value.image;});log("gelas_cuci_mata: ${gelas_cuci_mata}");}),
                                  RadioForm(title: "Kantong Plastik Bersih:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {kantong_plastik = value!.selected; kantong_plastik_img = value.image;});log("kantong_plastik: ${kantong_plastik}");}),
                                  RadioForm(title: "Aquades (100ml lar Saline):", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {aquades = value!.selected; aquades_img = value.image;});log("aquades: ${aquades}");}),
                                  RadioForm(title: "Oxygen:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {oxygen = value!.selected; oxygen_img = value.image;});log("oxygen: ${oxygen}");}),
                                  RadioForm(title: "Obat Luka Bakar:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {obat_luka_bakar = value!.selected; obat_luka_bakar_img = value.image;});log("obat_luka_bakar: ${obat_luka_bakar}");}),
                                  RadioForm(title: "Buku Catatan:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {buku_catatan = value!.selected; buku_catatan_img = value.image;});log("buku_catatan: ${buku_catatan}");}),
                                  RadioForm(title: "Daftar Isi:", option: ["Ada", "Tidak", "Lainnya"], onChange: (dataRadioForm? value) {setState(() {daftar_isi = value!.selected; daftar_isi_img = value.image;});log("daftar_isi: ${daftar_isi}");}),
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

                            // var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_p3k.php?create&user_id=${globals.user_id}&kotak_id=${widget.id}&kasa_steril_bungkus=${kasa_steril_bungkus}&perban5=${perban5}&perban10=${perban10}&plester125=${plester125}&plester_cepat=${plester_cepat}&kapas=${kapas}&mitella=${mitella}&gunting=${gunting}&peniti=${peniti}&sarung_tangan=${sarung_tangan}&masker=${masker}&pinset=${pinset}&lampu_senter=${lampu_senter}&gelas_cuci_mata=${gelas_cuci_mata}&kantong_plastik=${kantong_plastik}&aquades=${aquades}&oxygen=${oxygen}&obat_luka_bakar=${obat_luka_bakar}&buku_catatan=${buku_catatan}&daftar_isi=${daftar_isi}&durasi_inspeksi=${durasi}");  
                            try {
                              var request = http.MultipartRequest(
                                'POST',
                                Uri.parse("http://${globals.endpoint}/api_inspeksi_p3k.php"),
                              );
                              Map<String, String> headers = {"Content-type": "multipart/form-data"};
                              request.fields['create'] = "";
                              request.fields['user_id'] = "${globals.user_id}";
                              request.fields['kotak_id'] = "${widget.id}";
                              request.fields['durasi_inspeksi'] = "${durasi}";
                              request.fields['kasa_steril_bungkus'] = "${kasa_steril_bungkus}";
                              request.fields['perban5'] = "${perban5}";
                              request.fields['perban10'] = "${perban10}";
                              request.fields['plester125'] = "${plester125}";
                              request.fields['plester_cepat'] = "${plester_cepat}";
                              request.fields['kapas'] = "${kapas}";
                              request.fields['mitella'] = "${mitella}";
                              request.fields['gunting'] = "${gunting}";
                              request.fields['peniti'] = "${peniti}";
                              request.fields['sarung_tangan'] = "${sarung_tangan}";
                              request.fields['masker'] = "${masker}";
                              request.fields['pinset'] = "${pinset}";
                              request.fields['lampu_senter'] = "${lampu_senter}";
                              request.fields['gelas_cuci_mata'] = "${gelas_cuci_mata}";
                              request.fields['kantong_plastik'] = "${kantong_plastik}";
                              request.fields['aquades'] = "${aquades}";
                              request.fields['oxygen'] = "${oxygen}";
                              request.fields['obat_luka_bakar'] = "${obat_luka_bakar}";
                              request.fields['buku_catatan'] = "${buku_catatan}";
                              request.fields['daftar_isi'] = "${daftar_isi}";

                              if(kasa_steril_bungkus_img != "") request.files.add(addPhoto(kasa_steril_bungkus_img, 'kasa_steril_bungkus_img'));
                              if(perban5_img != "") request.files.add(addPhoto(perban5_img, 'perban5_img'));
                              if(perban10_img != "") request.files.add(addPhoto(perban10_img, 'perban10_img'));
                              if(plester125_img != "") request.files.add(addPhoto(plester125_img, 'plester125_img'));
                              if(plester_cepat_img != "") request.files.add(addPhoto(plester_cepat_img, 'plester_cepat_img'));
                              if(kapas_img != "") request.files.add(addPhoto(kapas_img, 'kapas_img'));
                              if(mitella_img != "") request.files.add(addPhoto(mitella_img, 'mitella_img'));
                              if(gunting_img != "") request.files.add(addPhoto(gunting_img, 'gunting_img'));
                              if(peniti_img != "") request.files.add(addPhoto(peniti_img, 'peniti_img'));
                              if(sarung_tangan_img != "") request.files.add(addPhoto(sarung_tangan_img, 'sarung_tangan_img'));
                              if(masker_img != "") request.files.add(addPhoto(masker_img, 'masker_img'));
                              if(pinset_img != "") request.files.add(addPhoto(pinset_img, 'pinset_img'));
                              if(lampu_senter_img != "") request.files.add(addPhoto(lampu_senter_img, 'lampu_senter_img'));
                              if(gelas_cuci_mata_img != "") request.files.add(addPhoto(gelas_cuci_mata_img, 'gelas_cuci_mata_img'));
                              if(kantong_plastik_img != "") request.files.add(addPhoto(kantong_plastik_img, 'kantong_plastik_img'));
                              if(aquades_img != "") request.files.add(addPhoto(aquades_img, 'aquades_img'));
                              if(oxygen_img != "") request.files.add(addPhoto(oxygen_img, 'oxygen_img'));
                              if(obat_luka_bakar_img != "") request.files.add(addPhoto(obat_luka_bakar_img, 'obat_luka_bakar_img'));
                              if(buku_catatan_img != "") request.files.add(addPhoto(buku_catatan_img, 'buku_catatan_img'));
                              if(daftar_isi_img != "") request.files.add(addPhoto(daftar_isi_img, 'daftar_isi_img'));

                              request.headers.addAll(headers);
                              print("request: " + request.toString());
                              var response = await request.send().timeout(
                                const Duration(seconds: 1)
                              );
                              print(response.statusCode);
                              log(request.fields.toString());

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