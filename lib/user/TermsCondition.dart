// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ppns_inspect/user/input_nomor.dart';
import 'package:ppns_inspect/user/inspeksi/Inspeksi_Jalur_Evakuasi.dart';


class TermsCondition extends StatefulWidget {
  TermsCondition({required this.code, Key? key}) : super(key: key);
  String code;
  @override
  _TermsConditionState createState() => _TermsConditionState(code: code);
}

class _TermsConditionState extends State<TermsCondition> {
  _TermsConditionState({required this.code});
  String code;
  String nfpa = "";
  String desc = "";
  @override
  void initState() {
    super.initState();
    if(code == "apar"){
      setState(() {
        nfpa = """Permen PUPR Nomor 26 Tahun 2008 tentang Persyaratan Teknis Sistem Proteksi Kebakaran Pada Bangunan Gedung dan Lingkungan""";
        desc = """
(1) Lokasi di tempat yang ditentukan.  
(2) Halangan akses atau pandangan (visibilitas).  
(3) Pelat nama instruksi operasi jelas terbaca dan menghadap keluar.  
(4) Terisi penuh ditentukan dengan ditimbang, dirasakan dengan diangkat,  atau dilihat indikator tekanan (bila ada).  
(5) Pemeriksaan visuil untuk kerusakan fisik, karat, kebocoran, atau nozel tersumbat. 
(6) Bacaan penunjuk atau indikator tekanan menunjukkan pada posisi dapat dioperasikan. 
(7) Untuk yang memakai roda, kondisi dari roda, kereta, slang dan nozel.  
(8) Terdapat label (tag) pemeliharaan. 
""";
      });
    }
    else if(code == "hydrantIHB"){
      setState(() {
        nfpa = """Permen PUPR Nomor 26 Tahun 2008 tentang Persyaratan Teknis Sistem Proteksi Kebakaran Pada Bangunan Gedung dan Lingkungan""";
        desc = """
Tabel 7.4.5.2 (3)
-	sambungan selang
-	kondisi slang (termasuk kopling)
-	nozel slang
-	alat penyimpan slang (rak dan penggulung)
- kondisi kotak atau boks""";
      });
    }
    else if(code == "hydrantOHB"){
      setState(() {
        nfpa = """Permen PUPR Nomor 26 Tahun 2008 tentang Persyaratan Teknis Sistem Proteksi Kebakaran Pada Bangunan Gedung dan Lingkungan""";
        desc = """
Tabel 7.4.5.2 (2) hidran halaman
- kemudahan akses
- kebocoran pilar/ aoutlet
- mur operasi hidran aus
- alur nozel yang aus
- ketersediaan kunci pilar hidran""";
      });
    }
    else if(code == "P3K"){
      setState(() {
        nfpa = "Permenaker RI No. PER-15/MEN/VIII/2008 tentang Pertolongan Pertama Pada Kecelakaan di Tempat Kerja";
        desc = """
ketentuan isi :
- kasa steril
- Perban (lebar 5 cm) 
- Perban (lebar 10 cm) 
- Plester (lebar 1,25 cm) 
- Plester Cepat 
- Kapas (25 gram) 
- Kain segitiga/mittela 
- Gunting 
- Peniti 
- Sarung tangan sekali pakai (pasangan) 
- Masker 
- Pinset 
- Lampu senter 
- Gelas untuk cuci mata 
- Kantong plastik bersih 
- Aquades (100 ml lar. Saline) 
- Povidon Iodin (60 ml) 
- Alkohol 70%
- oxygen
- obat luka bakar 
- Buku panduan P3K di tempat kerja 
- Buku catatan 
- Daftar isi kotak""";
      });
    }
    else if(code == "exit"){
      setState(() {
        nfpa = "Permen PUPR Nomor 26 Tahun 2008 tentang Persyaratan Teknis Sistem Proteksi Kebakaran Pada Bangunan Gedung dan Lingkungan BAB III";
        desc = """
7.3.5.1 Inspeksi Inspeksi harus dilakukan secara berkala 
setiap bulan, atau lebih sering tergantung kondisi, untuk 
sebagai berikut: 
(1) Pintu eksit 
(a) Tidak boleh dikunci atau digembok. 
(b) Kerusakan pada penutup pintu otomatik (door closer).
(c) Terdapatnya ganjal atau ikatan yang menahan pintu selalu
 terbuka, pada pintu yang harus selalu pada keadaan tertutup.  
(d) Halangan benda dan lain-lain di depan pintu eksit.
(3) Akses eksit dan koridor yang digunakan sebagai jalur 
untuk ke luar  
(a) Bebas dari segala macam hambatan.  
(b) Tidak digunakan untuk gudang.  
(4) Eksit pelepasan di lantai dasar yang menuju ke jalan 
umum atau tempat terbuka di luar bangunan harus tidak
 boleh dikunci.  
(5) Tanda eksit  
(a) Jelas kelihatan tidak terhalang.  
(b) Lampu pencahayaannya hidup. """;
      });
    }
  }
  bool checked = false;

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
                      margin: EdgeInsets.only(top: 40),
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
                
              // Align(
              //     alignment: Alignment.topCenter,
              //     child: Column(children: [
              //       Container(
              //         margin: EdgeInsets.only(top: 130),
              //         child: 
              //             Text(
              //               "AS REGULATORY INFORMATION IS USED",
              //               style: TextStyle(
              //                 fontFamily: "SanFrancisco",
              //                 decoration: TextDecoration.none,
              //                 fontStyle: FontStyle.italic,
              //                 fontWeight: FontWeight.w900,
              //                 fontSize: 14,
              //                 color: Colors.black
              //               ),
              //             ),
              //       ),
              //     ]
              //   )
              // ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 130),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: 
                          Text(
                            nfpa,
                            style: TextStyle(
                              fontFamily: "SanFrancisco",
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.black
                            ),
                          ),
                    ),
                  ]
                )
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [                    
                     Container(
                        // width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height-350,
                        margin: EdgeInsets.only(left:20, right: 30, bottom: 200 , top: 190),
                        // decoration: new BoxDecoration(color: const Color.fromARGB(49, 244, 67, 54)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 15),
                                child: 
                                Text(desc,
                                  style: TextStyle(
                                    fontFamily: "SanFrancisco",
                                    decoration: TextDecoration.none,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                    )
                  ]
                  )
              ),

              Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left:20, right: 20, top: MediaQuery.of(context).size.height-120),
                      child: 
                      Row(children: [
                        
                      Checkbox(
                          value: checked,
                          onChanged: (bool? value) {
                            setState(() {
                              checked = value!;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            "I have read, understand and comprehend the regulatory provisions used. I am responsible for the entered data.",
                            style: TextStyle(
                                  fontFamily: "SanFrancisco",
                                  decoration: TextDecoration.none,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12.5,
                                  color: Colors.black
                                ),
                            ),
                        ),
                      ],)
                    ),
                  ]
                )
              ),
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
                          onPressed: !checked ? null : (){     
                            setState(() {
                              checked = false;
                            });                                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return InputNomor(code: code);
                              }),
                            );
                          }, 
                          child: Text("Next")
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