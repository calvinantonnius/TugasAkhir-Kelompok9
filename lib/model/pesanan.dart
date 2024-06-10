class Pesanan {
  String? nomor;
  String? nama;
  String? ukuran;

  Pesanan({
    this.nomor,
    this.nama,
    this.ukuran,
  });

  factory Pesanan.fromJson(Map<String, dynamic> json) => Pesanan(
        nomor: json['nomor'],
        nama: json['nama'],
        ukuran: json['ukuran'],
      );

  Map<String, dynamic> tolJson() => {
        'nomor': this.nomor,
        'nama': this.nama,
        'ukuran': this.ukuran,
      };
}
