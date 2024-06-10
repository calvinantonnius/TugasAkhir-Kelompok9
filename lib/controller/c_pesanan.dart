import 'package:get/get.dart';
import 'package:project_if22a/model/pesanan.dart';

class CPesanan extends GetxController {
  Rx<Pesanan> _pesanan = Pesanan().obs;

  Pesanan get pesanan => _pesanan.value;

  void setpesanan(Pesanan dataPesanan) => _pesanan.value = dataPesanan;
}
