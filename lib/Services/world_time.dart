import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:async';

class WorldTime {
  late String location;
  late String time;
  late String flags;
  late String Continent;
  late String city;
  late String d;
  late String day;
  late bool isDay;

  WorldTime({required this.location,
    required this.Continent,
    required this.city,
    required this.flags,
    required this.d,
    required this.day,
  });

  Future<void> getData() async {
    final url =
    Uri.parse(
        ("https://www.timeapi.io/api/time/current/zone?timeZone=$Continent%2F$city"));
    try {
      final response = await get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final String date = data['dateTime'];
        d = data['date'];
        day = data['dayOfWeek'];

        final DateTime now = DateTime.parse(date);
        isDay = now.hour >= 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      } else {
        throw Exception('Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching time: $e");
      time = "Could not fetch";
      d = "-";
      day = "-";
      isDay = false;
    }
  }
}