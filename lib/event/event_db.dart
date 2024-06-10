import 'dart:convert';
import 'package:project_if22a/config/api.dart';
import 'package:project_if22a/model/pesanan.dart';
import 'package:http/http.dart' as http;
import 'package:project_if22a/widget/info.dart';

class EventDb {
  static Future<List<Pesanan>> getPesanan() async {
    List<Pesanan> listPesanan = [];

    try {
      var response = await http.get(Uri.parse(Api.getPesanan));
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var pesanan = responBody['pesanan'];

          pesanan.forEach((pesanan) {
            listPesanan.add(Pesanan.fromJson(pesanan));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listPesanan;
  }

  static Future<String> AddPesanan(
      String nomor, String nama, String ukuran) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addPesanan), body: {
        'text_nomor': nomor,
        'text_nama': nama,
        'text_ukuran': ukuran
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Pesanan Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  static Future<void> UpdatePesanan(
      String nomor, String nama, String ukuran) async {
    try {
      var response = await http.post(Uri.parse(Api.updatePesanan), body: {
        'text_nomor': nomor,
        'text_nama': nama,
        'text_ukuran': ukuran,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Pesanan');
        } else {
          Info.snackbar('Gagal Update Pesanan');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deletePesanan(String nomor) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deletePesanan), body: {'text_nomor': nomor});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Pesanan');
        } else {
          Info.snackbar('Gagal Delete Pesanan');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
