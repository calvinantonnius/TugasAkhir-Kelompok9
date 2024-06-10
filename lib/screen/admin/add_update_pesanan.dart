import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_if22a/ListPesanan.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/pesanan.dart';
import 'package:project_if22a/widget/info.dart';

class AddUpdatePesanan extends StatefulWidget {
  final Pesanan? pesanan;
  AddUpdatePesanan({this.pesanan});

  @override
  State<AddUpdatePesanan> createState() => _AddUpdatePesananState();
}

class _AddUpdatePesananState extends State<AddUpdatePesanan> {
  var _formKey = GlobalKey<FormState>();
  var _controllerNomor = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerUkuran = TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    if (widget.pesanan != null) {
      _controllerNomor.text = widget.pesanan!.nomor!;
      _controllerNama.text = widget.pesanan!.nama!;
      _controllerUkuran.text = widget.pesanan!.ukuran!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.pesanan != null
            ? Text('Update Pesanan')
            : Text('Tambah Pesanan'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.pesanan == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNomor,
                  decoration: InputDecoration(
                      labelText: "Jumlah Pesanan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama Menu",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerUkuran,
                  decoration: InputDecoration(
                      labelText: "Ukuran",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.pesanan == null) {
                        String message = await EventDb.AddPesanan(
                          _controllerNomor.text,
                          _controllerNama.text,
                          _controllerUkuran.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNomor.clear();
                          _controllerNama.clear();
                          _controllerUkuran.clear();
                          Get.off(
                            ListPesanan(),
                          );
                        }
                      } else {
                        EventDb.UpdatePesanan(
                          _controllerNomor.text,
                          _controllerNama.text,
                          _controllerUkuran.text,
                        );
                        Get.off(
                          ListPesanan(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.pesanan == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
