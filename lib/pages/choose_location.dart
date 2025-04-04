import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(city: 'London',  location: 'London', flags: 'uk.png',d: "",day: "",Continent:"Europe"),
    WorldTime(city: 'Germany',  location: 'Germany', flags: 'germany.png',d: "",day: "",Continent:"Europe"),
    WorldTime(city: 'Greece',  location: 'Greece', flags: 'greece.png',d: "",day: "",Continent:"Europe"),
    WorldTime(city: 'Indonesia',  location: 'Indonesia', flags: 'indonesia.png',d: "",day: "",Continent:"Asia"),
    WorldTime(city: 'Kenya',  location: 'Kenya', flags: 'kenya.png',d: "",day: "",Continent:"Africa"),
    WorldTime(city: 'South Korea',  location: 'South Korea', flags: 'south_korea.png',d: "",day: "",Continent:"Asia"),
    WorldTime(city: 'Egypt',  location: 'Egypt', flags: 'egypt.png',d: "",day: "",Continent:"Africa"),
    WorldTime(city: 'USA',  location: 'USA', flags: 'usa.png',d: "",day: "",Continent:"America"),
  ];
  void gettime(index) async{
    WorldTime s = locations[index];
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    await s.getData();
    if (mounted) Navigator.pop(context);
    Navigator.pop(context,{
      'location': s.location,
      'flag': s.flags,
      'time':s.time,
      'd': s.d,
      'day':s.day,
      'isDay' : s.isDay,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text('Choose Location',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 3.6, 0, 0),
        itemCount: locations.length,
        itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1 , horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    gettime(index);
                  },
                  minTileHeight: 90,
                  tileColor: Colors.deepPurpleAccent[100],
                  splashColor: Colors.blue,
                  hoverColor: Colors.purple,
                  style: ListTileStyle.drawer,
                  title: Text(locations[index].location,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25
                      ),),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("lib/Images/${locations[index].flags}"),
                  ),
                  ),
              ),
            );
        },
      ),
    );
  }
}
