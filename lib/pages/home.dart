import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map out = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {
    parameters = ModalRoute.of(context)?.settings.arguments ?? {}; // Handle null case
    out = parameters as Map; // Direct cast

    String bg = out['isDay'] ? 'day.jpg' : 'night.jpg'; // Dynamic background

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/Images/$bg'), // Dynamically switch between day/night
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose_location');
                },
                label: Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20,
                      fontFamily: 'Quicksand'
                  ),
                ),
                icon: Icon(Icons.edit_location, color: Colors.white, size: 35),
              ),
              SizedBox(height: 180),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    out['location'],
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  out['day'],
                  style: TextStyle(
                    color: Colors.orange[300],
                    fontFamily: 'Quicksand',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  out["d"],
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand'
                  ),
                ),
              ),
              Center(
                child: Text(
                  out["time"],
                  style: TextStyle(
                    color: Colors.yellow[800],
                    fontSize: 68,
                    fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
