import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_if22a/event/event_db.dart';
import 'package:project_if22a/model/pesanan.dart';
import 'package:project_if22a/screen/admin/add_update_pesanan.dart';

class ListPesanan extends StatefulWidget {
  const ListPesanan({super.key});

  @override
  State<ListPesanan> createState() => _ListPesananState();
}

class _ListPesananState extends State<ListPesanan> {
  List<Pesanan> _listpesanan = [];

  void getPesanan() async {
    _listpesanan = await EventDb.getPesanan();
    setState(() {});
  }

  @override
  void initState() {
    getPesanan();
    super.initState();
  }

  void showOption(Pesanan? pesanan) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () => Get.back(result: 'update'),
            title: Text('Update'),
          ),
          ListTile(
            onTap: () => Get.back(result: 'delete'),
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          )
        ],
      ),
      barrierDismissible: false,
    );
    switch (result) {
      case 'update':
        Get.to(AddUpdatePesanan(
          pesanan: pesanan,
        ))?.then((value) => getPesanan());
        break;

      case 'delete':
        EventDb.deletePesanan(pesanan!.nomor!).then((value) => getPesanan());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Pesanan",
          style: GoogleFonts.poppins(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _listpesanan.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: _listpesanan.length,
                  itemBuilder: (context, index) {
                    Pesanan pesanan = _listpesanan[index];
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                        ),
                        title: Text(
                          pesanan.nama ?? '',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pesanan.nomor ?? ''),
                            SizedBox(height: 4),
                            Text(pesanan.ukuran ?? ''),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showOption(pesanan);
                          },
                          icon: Icon(Icons.more_vert),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Pesanan Kosong",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () =>
                  Get.to(AddUpdatePesanan())?.then((value) => getPesanan()),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.brown,
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }
}
