import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Tp8 extends StatefulWidget {
  const Tp8({Key? key}) : super(key: key);

  @override
  _Tp8State createState() => _Tp8State();
}

class _Tp8State extends State<Tp8> {
  late Future<List<CameraDescription>> _camerasFuture;

  @override
  void initState() {
    super.initState();
    _camerasFuture = availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<CameraDescription>>(
          future: _camerasFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return _buildCameraList(snapshot.data!);
              } else if (snapshot.hasError) {
                return _buildError(snapshot.error.toString());
              }
            }
            return _buildLoading();
          },
        ),
      ),
    );
  }

  Widget _buildCameraList(List<CameraDescription> cameras) {
    return ListView.builder(
      itemCount: cameras.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.camera),
          title: Text('Camera ${index + 1}'),
          subtitle:
              Text('Sensor Orientation: ${cameras[index].sensorOrientation}'),
        );
      },
    );
  }

  Widget _buildError(String error) {
    return Center(child: Text('Error: $error'));
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}
