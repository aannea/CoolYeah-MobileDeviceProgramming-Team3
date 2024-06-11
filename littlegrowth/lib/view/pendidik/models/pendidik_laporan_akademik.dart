class LaporanAkademiksAnak {
  final String id;
  final String? emosiDeskripsi;
  final String? emosiRekomendasi;
  final String? kognitifDeskripsi;
  final String? kognitifRekomendasi;
  final String? motorikDeskripsi;
  final String? motorikRekomendasi;
  final String? sosialDeskripsi;
  final String? sosialRekomendasi;

  LaporanAkademiksAnak({
    required this.id,
    this.emosiDeskripsi,
    this.emosiRekomendasi,
    this.kognitifDeskripsi,
    this.kognitifRekomendasi,
    this.motorikDeskripsi,
    this.motorikRekomendasi,
    this.sosialDeskripsi,
    this.sosialRekomendasi,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emosi_deskripsi': emosiDeskripsi,
      'emosi_rekomendasi': emosiRekomendasi,
      'kognitif_deskripsi': kognitifDeskripsi,
      'kognitif_rekomendasi': kognitifRekomendasi,
      'motorik_deskripsi': motorikDeskripsi,
      'motorik_rekomendasi': motorikRekomendasi,
      'sosial_deskripsi': sosialDeskripsi,
      'sosial_rekomendasi': sosialRekomendasi,
    };
  }

  factory LaporanAkademiksAnak.fromJson(Map<String, dynamic> json) {
    return LaporanAkademiksAnak(
      id: json['id'] as String,
      emosiDeskripsi: json['emosi_deskripsi'] as String?,
      emosiRekomendasi: json['emosi_rekomendasi'] as String?,
      kognitifDeskripsi: json['kognitif_deskripsi'] as String?,
      kognitifRekomendasi: json['kognitif_rekomendasi'] as String?,
      motorikDeskripsi: json['motorik_deskripsi'] as String?,
      motorikRekomendasi: json['motorik_rekomendasi'] as String?,
      sosialDeskripsi: json['sosial_deskripsi'] as String?,
      sosialRekomendasi: json['sosial_rekomendasi'] as String?,
    );
  }
}
