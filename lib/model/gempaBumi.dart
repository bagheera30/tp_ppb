class GempaBumiData {
  final String place;
  final double magnitude;

  String? type;

  GempaBumiData({
    required this.type,
    required this.place,
    required this.magnitude,
  });

  // Jika Anda ingin menghitung jarak, Anda bisa menambahkan method atau getter di sini
}
