import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tp/model/gempaBumi.dart';

Future<List<GempaBumiData>> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2022-03-05&endtime=2022-03-06&limit=10'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final features = data['features'];
    final List<GempaBumiData> tempList = [];
    for (var feature in features) {
      final properties = feature['properties'];
      final place = properties['place'];
      final magnitude = properties['mag'].toDouble();
      final type = properties['type'];
      final earthquakeData =
          GempaBumiData(type: type, place: place, magnitude: magnitude);
      tempList.add(earthquakeData);
    }
    return tempList;
  } else {
    throw Exception('Failed to fetch data');
  }
}
