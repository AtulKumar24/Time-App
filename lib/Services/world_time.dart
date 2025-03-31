import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flags;
  late String Continent;
  late String city;
  late String d;
  late String day;
  late bool isDay;

  WorldTime(
      {required this.location,
      required this.Continent,
      required this.city,
      required this.flags,
      required this.d,
      required this.day,
      });

  Future<void> getdata() async {
    try {
      Response response = await get(Uri.parse(
          "https://www.timeapi.io/api/time/current/zone?timeZone=$Continent%2F$city"));
      Map data = jsonDecode(response.body);
      String date = data['dateTime'];
      d = data['date'];
      day = data['dayOfWeek'];
      DateTime now = DateTime.parse(date);
      isDay = ((now.hour>6) && (now.hour<20)) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("CAUGHT ERROR : $e");
      time = "ERROR";
      d = "ERROR";
      day = "ERROR";
    }
  }
}
