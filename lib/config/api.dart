class Api {
  static const _host = "http://192.168.1.7/project_coffee";

  static String _pesanan = "$_host/pesanan";

  // pesanan
  static String getPesanan = "$_pesanan/view.php";
  static String addPesanan = "$_pesanan/add.php";
  static String updatePesanan = "$_pesanan/update.php";
  static String deletePesanan = "$_pesanan/delete.php";
}
