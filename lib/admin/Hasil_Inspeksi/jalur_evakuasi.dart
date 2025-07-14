// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, sized_box_for_whitespace, sort_child_properties_last, unused_local_variable, must_be_immutable, prefer_final_fields, use_key_in_widget_constructors, unnecessary_this, depend_on_referenced_packages, non_constant_identifier_names, curly_braces_in_flow_control_structures, unnecessary_brace_in_string_interps, unused_field

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ppns_inspect/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:table_sticky_headers/table_sticky_headers.dart';
import 'package:ppns_inspect/admin/DataModel.dart';
import 'dart:async';
import 'package:month_year_picker/month_year_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class HasilJalurEvakuasi extends StatefulWidget {
  HasilJalurEvakuasi({super.key, this.restorationId});
  final String? restorationId;

  @override
  _HasilJalurEvakuasiState createState() => _HasilJalurEvakuasiState();
}


class _HasilJalurEvakuasiState extends State<HasilJalurEvakuasi> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year-5),
          lastDate: DateTime(DateTime.now().year+20),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
  static String kebersihan = "Akses eksit gedung bersih";
  static String penanda_exit = "Terdapat tanda yang jelas dan mudah terlihat menuju pintu eksit";
  static String kebebasan_hambatan = "Jalur evakuasi bebas dari barang-barang yang mengganggu kelancaran evakuasi.";
  static String penerangan_jalur = "Penerangan cukup, termasuk pencahayaan darurat jika listrik padam.";
  static String tanda_arah = "Terdapat petunjuk arah yang jelas menuju pintu keluar darurat.";
  static String material_lantai = "Material lantai tidak licin dan aman untuk dilewati.";
  static String tanda_pintu_darurat = "Pintu keluar darurat diberi tanda yang jelas dan mudah dikenali.";
  static String pegangan_rambat = "Terdapat railing di salah satu sisi koridor, terutama untuk disabilitas.";
  static String pencahayaan_darurat = "Koridor dilengkapi pencahayaan darurat otomatis saat keadaan darurat terjadi.";
  static String identifikasi_titik_kumpul = "Titik kumpul ditandai dengan jelas dan mudah terlihat oleh semua orang.";
  static String jalur_menuju_titik_kumpul = "Jalur menuju titik kumpul jelas, praktis, dan tidak terhambat oleh apapun.";
  static String peralatan_darurat = "Tersedia APAR, kotak P3K,  atau peralatan lain di lokasi strategis.";
  static String peta_evakuasi = "Peta jalur evakuasi tersedia di lokasi yang mudah dilihat oleh pengguna gedung.";

  static String pintu_dikunci = "Pintu eksit tidak dikunci atau digembok.";
  static String pintu_berfungsi = "Pintu exit berfungsi.";
  static String terdapat_ganjal = "Terdapat ganjal atau ikatan penahan pintu selalu terbuka, pada pintu yang harus selalu pada keadaan tertutup.";
  static String terbebas_halangan = "Terbebas halangan benda dan lain-lain di depan pintu eksi.";
  static String terbebas_hambatan = "Akses eksit dan koridor yang digunakan sebagai jalur untuk ke luar Bebas dari segala macam hambatan.";
  static String pintu_pelepasan_terkunci = "Eksit pelepasan di lantai dasar yang menuju ke jalan umum atau tempat terbuka di luar bangunan tidak terkunci.";

  List<TextEditingController> _controller = [
    TextEditingController(text: ''),
    TextEditingController(text: ''),
    TextEditingController(text: '')
  ];

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        _controller[2].text = "${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day} 00:00:00";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(_controller[2].text),
        // ));
      });
    }
  }
  DateTime selectedDate = DateTime.now();
  Timer? timer;
  List<String> titleColumn = [
    "id inspeksi", 
    "Email Inspektor", 
    kebersihan,
    penanda_exit,
    kebebasan_hambatan,
    penerangan_jalur,
    tanda_arah,
    material_lantai,
    tanda_pintu_darurat,
    pegangan_rambat,
    pencahayaan_darurat,
    identifikasi_titik_kumpul,
    jalur_menuju_titik_kumpul,
    peralatan_darurat,
    peta_evakuasi,
    pintu_dikunci,
    pintu_berfungsi,
    terdapat_ganjal,
    terbebas_halangan,
    terbebas_hambatan,
    pintu_pelepasan_terkunci,
  ];
  TextStyle tsyleTitle = TextStyle(
    fontSize: 18,
  );
  TextStyle tsyleContent = TextStyle(
    fontSize: 18,
  );

  List<String> titleColumnExport = [
    "id inspeksi", 
    "Email Inspektor",     
    kebersihan,
    penanda_exit,
    kebebasan_hambatan,
    penerangan_jalur,
    tanda_arah,
    material_lantai,
    tanda_pintu_darurat,
    pegangan_rambat,
    pencahayaan_darurat,
    identifikasi_titik_kumpul,
    jalur_menuju_titik_kumpul,
    peralatan_darurat,
    peta_evakuasi,
    pintu_dikunci,
    pintu_berfungsi,
    terdapat_ganjal,
    terbebas_halangan,
    terbebas_hambatan,
    pintu_pelepasan_terkunci,
  ];

  List<List<String>> makeData = [];
  
  late DataInspeksiJalurEvakuasiAPI currentData = DataInspeksiJalurEvakuasiAPI(status: "", pesan: "", data: makeData);
  static List<String> columnExcel = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'X', 'Y', 'Z'];
  static List<String> DropDownName = <String>['Sudah Di Inspeksi', 'Belum Di Inspeksi'];
  String dropdownValue = DropDownName.first;
  
  static List<String> FilterKerusakan = <String>['Kerusakan : Tampilkan Semua', 'Kerusakan : Tidak', 'Kerusakan : Rusak'];
  String FilterKerusakanValue = FilterKerusakan.first; 
  String kerusakan = "semua";

  @override
  void initState() {
    super.initState();
    updateValue();
    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) => updateValue());
  }
  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }


  void updateValue() async {
    var url = Uri.parse("http://${globals.endpoint}/api_inspeksi_jalur_evakuasi.php?read&start_date=${selectedDate.year}-${selectedDate.month}-1 00:00:00&end_date=${selectedDate.year}-${selectedDate.month}-31 23:59:59&kerusakan=${kerusakan}");  
    try {
      final response = await http.get(url).timeout(
        const Duration(seconds: 1),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );
      if (response.statusCode == 200) {
        var respon = Json.tryDecode(response.body);
        if (this.mounted) {
          if(respon?.isNotEmpty ?? false){
          setState(() {
            currentData = DataInspeksiJalurEvakuasiAPI.fromJson(respon);
          });
          }
          // print(currentData.data[0]);
        }
      }
    } on Exception catch (_) {}

    setState(() {
      tsyleTitle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500
      );
      tsyleContent = TextStyle(
        fontSize: 18,
        // fontWeight: FontWeight.w700
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: Column(children: [
                SizedBox(height: 50),
                IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Do you want to Logout ?",
                        buttons: [
                          DialogButton(
                              child: Text(
                                "No",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          DialogButton(
                              child: Text(
                                "Yes",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.remove('user_id');
                                await prefs.remove('user_role');
                                await prefs.remove('user_name');
                                await prefs.remove('user_email');
                                await prefs.remove('user_password');
                                setState(() {
                                  globals.user_id = "";
                                  globals.user_role = "";
                                  globals.user_name = "";
                                  globals.user_email = "";
                                  globals.user_password = "";
                                  globals.isLoggedIn = false;
                                });
                                // Navigator.pop(context);
                                Phoenix.rebirth(context);
                              }),
                        ],
                      ).show();
                    }),
              ])),
          Align(
              alignment: Alignment.topLeft,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, right: 20.0, top: 40),
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
              alignment: Alignment.topLeft,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 135),
                  child: 
                      Text(
                        "Hasil Inspeksi Jalur Evakuasi",
                        style: TextStyle(
                          fontFamily: "SanFrancisco",
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Color.fromARGB(255, 255, 50, 50)
                        ),
                      ),
                ),
              ]
            )
          ),
          
          Align(
              alignment: Alignment.topRight,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, right: 10.0, top: 123),
                  child: ElevatedButton(
                    child: Text(
                      "Export Excel",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () async{
                       var status = await Permission.storage.status;
                        if (!status.isGranted) {
                          await Permission.storage.request();
                        }
                        if(currentData.data.isNotEmpty){
                          var excel = Excel.createExcel();
                          Sheet sheetObject = excel['Sheet1'];
                          // CellStyle cellStyle = CellStyle(fontFamily :getFontFamily(FontFamily.Calibri));
                          for(int a = 0; a< titleColumn.length; a++){
                            sheetObject.cell(CellIndex.indexByString('A${a+1}')).value = TextCellValue(titleColumn[a]);
                            sheetObject.cell(CellIndex.indexByString('B${a+1}')).value = TextCellValue(currentData.data[0][a]);
                          }          
                          var fileBytes = excel.save();

                          Directory appDocDirectory = await getApplicationDocumentsDirectory();
                          var dir = "/storage/emulated/0/ppns_inspect/export/inspeksi_rumah_pompa_${globals.monthName[selectedDate.month-1]}_${selectedDate.year}.xlsx";
                          // var dir = "${appDocDirectory.path}/export/${inspeksi}_inspeksi_apar_${monthName[selectedDate.month-1]}_${selectedDate.year}.xlsx";
                          File(join(dir))
                            ..createSync(recursive: true)
                            ..writeAsBytesSync(fileBytes!);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Export Complete\nDir : ${dir}"),
                          ));
                        } 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  )
                ),
            ])),
            
          Align(
              alignment: Alignment.topLeft,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 170),
                  child: ElevatedButton(
                    child: Text(
                      "${globals.monthName[selectedDate.month-1]} ${selectedDate.year}",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () async{
                        final selected = await showMonthYearPicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(DateTime.now().year-10),
                          lastDate: DateTime(DateTime.now().year+1),
                        );
                        setState(() {
                          if(selected != null) selectedDate = selected;
                        });
                        updateValue();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  )
                ),
            ])),
            Align(
              alignment: Alignment.topRight,
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-230,
                  margin: EdgeInsets.only(top: 230),
                  // decoration: BoxDecoration(color: const Color.fromARGB(49, 244, 67, 54)),
                  child: SingleChildScrollView(child:
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(currentData.data.isNotEmpty) for(int a=0; a<titleColumn.length; a++) Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(style: tsyleTitle, "${titleColumn[a]} : "),
                            Text(style: tsyleContent, "${currentData.data[0][a]}"),
                            SizedBox(height: 10),
                        ],)
                      ],
                    ),
                  ),
                  ),
                )
              ]
              )
          )
          
        ],
      ),
    ));
  }
}


class SimpleTablePage extends StatelessWidget {
  SimpleTablePage({
    required this.data,
    required this.titleColumn,
  });

  final List<List<String>> data;
  final List<String> titleColumn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StickyHeadersTable(
        columnsLength: titleColumn.length,
        rowsLength: data.length,
        columnsTitleBuilder: (i) => Text(titleColumn[i]),
        contentCellBuilder: (i, j) => Text((i > 1 ? data[j][i+1] : data[j][i])),
        // legendCell: Text('No Hydrant'),
        cellDimensions: CellDimensions.fixed(
          contentCellWidth: 120, 
          contentCellHeight: 50, 
          stickyLegendWidth: 85, 
          stickyLegendHeight: 50
        ),
        rowsTitleBuilder: (i) => Text(data[i][2]),
      ),
    );
  }
}