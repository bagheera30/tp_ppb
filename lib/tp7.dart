import 'package:flutter/material.dart';
import 'package:tp/detailPage.dart';

class Tp7 extends StatefulWidget {
  const Tp7({super.key});

  @override
  State<Tp7> createState() => _Tp7State();
}

class _Tp7State extends State<Tp7> {
  final List<Map> data = [
    {
      'judul': 'Boku no Hero Academia',
      'detail':
          'Boku no Hero Academia, yang juga dikenal sebagai My Hero Academia, adalah adaptasi anime TV dari manga yang terinspirasi oleh komik pahlawan super Amerika. Ceritanya mengikuti Izuku Midoriya, seorang anak yang awalnya tidak memiliki kekuatan super, yang dalam seri ini disebut sebagai "quirks". Namun, dia akhirnya mewarisi kekuatan dari pahlawan nomor satu, All Might, dan mendaftar di sekolah untuk para pahlawan. Serial ini mendapatkan pujian karena pendekatannya yang unik terhadap genre pahlawan super, dengan menggabungkan elemen-elemen dari cerita Barat dan Jepang.',
      'color': Colors.red,
    },
    {
      'judul': 'Jujutsu Kaisen',
      'detail':
          'Jujutsu Kaisen adalah sebuah seri manga Jepang yang ditulis dan diilustrasikan oleh Gege Akutami. Seri ini telah diserialkan dalam majalah manga shōnen Weekly Shōnen Jump yang diterbitkan oleh Shueisha sejak Maret 2018. Ceritanya mengikuti Yuji Itadori, seorang siswa sekolah menengah yang tanpa sengaja terlibat dalam dunia jujutsu, di mana dia harus melawan makhluk-makhluk jahat yang disebut curse menggunakan kekuatan jujutsu yang dimilikinya.',
      'color': const Color.fromARGB(255, 63, 63, 61),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: data[index]['color'],
                ),
                title: Text(
                  data[index]['judul'],
                  style: TextStyle(color: data[index]['color']),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(data: data[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
