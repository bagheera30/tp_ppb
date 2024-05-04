import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Tp8 extends StatefulWidget {
  const Tp8({super.key});

  @override
  State<Tp8> createState() => _Tp8State();
}

class _Tp8State extends State<Tp8> {
  late Future<List<CameraDescription>> _cameras;
  @override
  @override
  void initState() {
    super.initState();
    _cameras = availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<List<CameraDescription>>(
        future: _cameras,
        builder: (BuildContext context,
            AsyncSnapshot<List<CameraDescription>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.camera),
                  title: Text('Camera ${index + 1}'),
                  subtitle: Text(
                      'Sensor Orientation: ${snapshot.data![index].sensorOrientation}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
