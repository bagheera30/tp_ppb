import 'package:flutter/material.dart';
import 'package:tp/api/getApiGempa.dart';
import 'package:tp/model/gempaBumi.dart';

class Tp13 extends StatefulWidget {
  const Tp13({super.key});

  @override
  State<Tp13> createState() => _Tp13State();
}

class _Tp13State extends State<Tp13> {
  List<GempaBumiData> earthquakeDataList = [];

  Future<void> getData() async {
    try {
      final List<GempaBumiData> data = await fetchData();
      setState(() {
        earthquakeDataList = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData(); // Mengganti pemanggilan fetchData() menjadi getData()
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('tp'),
              backgroundColor: Colors.black45,
            ),
            body: ListView.builder(
              itemCount: earthquakeDataList.length,
              itemBuilder: (context, index) {
                final earthquakeData = earthquakeDataList[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      'M ${earthquakeData.magnitude} - ${earthquakeData.place}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      maxLines: 1, // Atur jumlah baris maksimum menjadi 1
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      earthquakeData.type ?? 'Tidak diketahui',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
