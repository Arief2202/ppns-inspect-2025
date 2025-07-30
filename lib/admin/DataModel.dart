
// ignore_for_file: camel_case_types, unnecessary_null_comparison, file_names, non_constant_identifier_names
import 'dart:convert';

class dataCheckInspect {
  dataCheckInspect({
    required this.link,
    required this.text_belum_inspect,
    required this.text_sudah_inspect,
  });
  
  String link;
  String text_belum_inspect;
  String text_sudah_inspect;
}

class DataAPIApar {
  DataAPIApar({
    required this.status,
    required this.pesan,
    required this.data,
  });
  
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataAPIApar.fromJson(Map<String, dynamic> json) => DataAPIApar(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayApar(json["data"]),
  );
}

class DataAPIP3K {
  DataAPIP3K({
    required this.status,
    required this.pesan,
    required this.data,
  });
  
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataAPIP3K.fromJson(Map<String, dynamic> json) => DataAPIP3K(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayP3K(json["data"]),
  );
}

class DataAPIHydrant {
  DataAPIHydrant({
    required this.status,
    required this.pesan,
    required this.data,
  });
  
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataAPIHydrant.fromJson(Map<String, dynamic> json) => DataAPIHydrant(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayHydrant(json["data"]),
  );
}

class DataUserAPI {
  DataUserAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataUserAPI.fromJson(Map<String, dynamic> json) => DataUserAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayUser(json["data"]),
  );
}
class DataInspeksiAparAPI {
  DataInspeksiAparAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataInspeksiAparAPI.fromJson(Map<String, dynamic> json) => DataInspeksiAparAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayInspeksiApar(json["data"]),
  );
}
class DataInspeksiOHBAPI {
  DataInspeksiOHBAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataInspeksiOHBAPI.fromJson(Map<String, dynamic> json) => DataInspeksiOHBAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayInspeksiOHB(json["data"]),
  );
}
class DataInspeksiIHBAPI {
  DataInspeksiIHBAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataInspeksiIHBAPI.fromJson(Map<String, dynamic> json) => DataInspeksiIHBAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayInspeksiIHB(json["data"]),
  );
}
class DataInspeksiP3KAPI {
  DataInspeksiP3KAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataInspeksiP3KAPI.fromJson(Map<String, dynamic> json) => DataInspeksiP3KAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayInspeksiP3K(json["data"]),
  );
}
class DataInspeksiJalurEvakuasiAPI {
  DataInspeksiJalurEvakuasiAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataInspeksiJalurEvakuasiAPI.fromJson(Map<String, dynamic> json) => DataInspeksiJalurEvakuasiAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayInspeksiJalurEvakuasi(json["data"]),
  );
}
class DataInspeksiRumahPompaAPI {
  DataInspeksiRumahPompaAPI({
    required this.status,
    required this.pesan,
    required this.data,
  });
  String status;
  String pesan;
  List<List<String>> data;
  
  factory DataInspeksiRumahPompaAPI.fromJson(Map<String, dynamic> json) => DataInspeksiRumahPompaAPI(
    status: json["status"],
    pesan: json["pesan"],
    data: objectToArrayInspeksiRumahPompa(json["data"]),
  );
}

List<List<String>> objectToArrayApar(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['jenis_pemadam']);
    row.add(data[a]['nomor']);
    row.add(data[a]['lokasi']);
    row.add(data[a]['berat']);
    row.add(data[a]['rating']);
    row.add(data[a]['tanggal_kadaluarsa']);
    row.add(data[a]['timestamp']);
    output.add(row);
  }
  return output;
}

List<List<String>> objectToArrayP3K(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['nomor']);
    row.add(data[a]['lokasi']);
    row.add(data[a]['timestamp']);
    output.add(row);
  }
  return output;
}

List<List<String>> objectToArrayHydrant(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['nomor']);
    row.add(data[a]['lokasi']);
    row.add(data[a]['timestamp']);
    output.add(row);
  }
  return output;
}

List<List<String>> objectToArrayInspeksiApar(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['user']['email']);
    row.add(data[a]['apar']['nomor']);
    row.add(data[a]['apar']['jenis_pemadam']);
    row.add(data[a]['apar']['lokasi']);
    row.add(data[a]['apar']['berat']);
    row.add(data[a]['apar']['rating']);
    row.add(data[a]['apar']['tanggal_kadaluarsa']);
    row.add(data[a]['tersedia']);
    row.add(data[a]['kondisi_tabung']);
    row.add(data[a]['segel_pin']);
    row.add(data[a]['tuas_pegangan']);
    row.add(data[a]['label_segitiga']);
    row.add(data[a]['label_instruksi']);
    row.add(data[a]['kondisi_selang']);
    row.add(data[a]['tekanan_tabung']);
    row.add(data[a]['posisi']);
    row.add(data[a]['kondisi_roda']);
    row.add(data[a]['durasi_inspeksi']);
    row.add(data[a]['created_at']);
    output.add(row);
  }
  return output;
}

List<List<String>> objectToArrayInspeksiOHB(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['user']['email']);
    row.add(data[a]['hydrant']['nomor']);
    row.add(data[a]['hydrant']['lokasi']);
    row.add(data[a]['kondisi_kotak']);
    row.add(data[a]['posisi_kotak']);
    row.add(data[a]['kondisi_nozzle']);
    row.add(data[a]['kondisi_selang']);
    row.add(data[a]['jenis_selang']);
    row.add(data[a]['kondisi_coupling']);
    row.add(data[a]['tuas_pembuka']);
    row.add(data[a]['kondisi_outlet']);
    row.add(data[a]['penutup_cop']);
    row.add(data[a]['flushing_hydrant']);
    row.add(data[a]['tekanan_hydrant']);
    row.add(data[a]['durasi_inspeksi']);
    row.add(data[a]['created_at']);
    output.add(row);
  }
  return output;
}
List<List<String>> objectToArrayInspeksiIHB(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['user']['email']);
    row.add(data[a]['hydrant']['nomor']);
    row.add(data[a]['hydrant']['lokasi']);
    row.add(data[a]['kondisi_kotak']);
    row.add(data[a]['posisi_kotak']);
    row.add(data[a]['kondisi_nozzle']);
    row.add(data[a]['kondisi_selang']);
    row.add(data[a]['jenis_selang']);
    row.add(data[a]['kondisi_coupling']);
    row.add(data[a]['kondisi_landing_valve']);
    row.add(data[a]['kondisi_tray']);
    row.add(data[a]['durasi_inspeksi']);
    row.add(data[a]['created_at']);
    output.add(row);
  }
  return output;
}
List<List<String>> objectToArrayInspeksiP3K(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['user']['email']);
    row.add(data[a]['p3k']['nomor']);
    row.add(data[a]['p3k']['lokasi']);
    row.add(data[a]['kasa_steril_bungkus']);
    row.add(data[a]['perban5']);
    row.add(data[a]['perban10']);
    row.add(data[a]['plester125']);
    row.add(data[a]['plester_cepat']);
    row.add(data[a]['kapas']);
    row.add(data[a]['mitella']);
    row.add(data[a]['gunting']);
    row.add(data[a]['peniti']);
    row.add(data[a]['sarung_tangan']);
    row.add(data[a]['masker']);
    row.add(data[a]['pinset']);
    row.add(data[a]['lampu_senter']);
    row.add(data[a]['gelas_cuci_mata']);
    row.add(data[a]['kantong_plastik']);
    row.add(data[a]['aquades']);
    row.add(data[a]['oxygen']);
    row.add(data[a]['obat_luka_bakar']);
    row.add(data[a]['buku_catatan']);
    row.add(data[a]['daftar_isi']);
    row.add(data[a]['durasi_inspeksi']);
    row.add(data[a]['created_at']);
    output.add(row);
  }
  return output;
}
List<List<String>> objectToArrayInspeksiJalurEvakuasi(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['user']['email']);
    row.add(data[a]['lokasi']);
    row.add(data[a]['pintu_terkunci']);
    row.add(data[a]['pintu_berfungsi']);
    row.add(data[a]['ganjal']);
    row.add(data[a]['ganjal_tangga']);
    row.add(data[a]['kebersihan_tangga']);
    row.add(data[a]['hambatan_eksit']);
    row.add(data[a]['eksit_terkunci']);
    row.add(data[a]['visibilitas_eksit']);
    row.add(data[a]['pencahayaan_eksit']);
    row.add(data[a]['durasi_inspeksi']);
    row.add(data[a]['created_at']);
    output.add(row);
  }
  return output;
}
List<List<String>> objectToArrayInspeksiRumahPompa(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['user']['email']);
    row.add(data[a]['lokasi']);
    row.add(data[a]['kondisi']);
    row.add(data[a]['ventilasi']);
    row.add(data[a]['katup_hisap']);
    row.add(data[a]['perpipaan']);
    row.add(data[a]['pengukur_hisap']);
    row.add(data[a]['pengukur_sistem']);
    row.add(data[a]['tangki_hisap']);
    row.add(data[a]['saringan_hisap']);
    row.add(data[a]['katup_uji']);
    row.add(data[a]['lampu_pengontrol']);
    row.add(data[a]['lampu_saklar']);
    row.add(data[a]['saklar_isolasi']);
    row.add(data[a]['lampu_rotasi']);
    row.add(data[a]['level_oli_motor']);
    row.add(data[a]['pompa_pemeliharaan']);
    row.add(data[a]['tangki_bahan_bakar']);
    row.add(data[a]['saklar_pemilih']);
    row.add(data[a]['pembacaan_tegangan']);
    row.add(data[a]['pembacaan_arus']);
    row.add(data[a]['lampu_baterai']);
    row.add(data[a]['semua_lampu_alarm']);
    row.add(data[a]['pengukur_waktu']);
    row.add(data[a]['ketinggian_oli']);
    row.add(data[a]['level_oli_mesin']);
    row.add(data[a]['ketinggian_air']);
    row.add(data[a]['tingkat_elektrolit']);
    row.add(data[a]['terminal_baterai']);
    row.add(data[a]['pemanas_jaket']);
    row.add(data[a]['kondisi_uap']);
    row.add(data[a]['timestamp']);
    output.add(row);
  }
  return output;
}

List<List<String>> objectToArrayUser(List<dynamic> data) {
  final List<List<String>> output = [];
  for(int a=0; a< data.length; a++){
    final List<String> row = [];
    row.add(data[a]['id']);
    row.add(data[a]['role']);
    row.add(data[a]['name']);
    row.add(data[a]['email']);
    row.add(data[a]['password']);
    row.add(data[a]['created_at']);
    output.add(row);
  }
  return output;
}

class Json {
  static String? tryEncode(data) {
    try {
      return jsonEncode(data);
    } catch (e) {
      return null;
    }
  }

  static dynamic tryDecode(data) {
    try {
      return jsonDecode(data);
    } catch (e) {
      return null;
    }
  }

}