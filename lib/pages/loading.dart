import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setup() async {
    WorldTime s1 = WorldTime(location: "Kolkata" , Continent: "Asia" , city: "Kolkata" , flags: "India" , d:"default",day: "default");
    await s1.getData();
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        'location': s1.location,
        'flag': s1.flags,
        'time': s1.time,
        'd': s1.d,
        'day': s1.day,
        'isDay': s1.isDay,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
        body: Center(child:
        SpinKitCubeGrid(
              color: Colors.white,
              size: 100.0,
            ),
    )
    );
  }
}
