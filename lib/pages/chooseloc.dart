import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  List<worldtime> loc=[
    worldtime(location: 'India', flag: 'india.jpg', url: 'Asia/Kolkata'),
    worldtime(location: 'Pakistan', flag: 'pakistan.png', url: 'Asia/Karachi'),
    worldtime(location: 'Egypt', flag: 'egypt.jpg', url: 'Africa/Cairo'),
    worldtime(location: 'Kenya', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    worldtime(location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago'),
    worldtime(location: 'Iraq', flag: 'iraq.jpg', url: 'Asia/Baghdad'),
    worldtime(location: 'Thailand', flag: 'thailand.jpg', url: 'Asia/Bangkok'),
    worldtime(location: 'Sri lanka', flag: 'srilanka.jpg', url: 'Asia/Colombo'),
    worldtime(location: 'Bangladesh', flag: 'bangladesh.jpg', url: 'Asia/Dhaka'),
    worldtime(location: 'Dubai', flag: 'uae.jpg', url: 'Asia/Dubai'),
    worldtime(location: 'Hong kong', flag: 'hongkong.jpg', url: 'Asia/Hong_Kong'),
    worldtime(location: 'Malaysia', flag: 'malaysia.jpg', url: 'Asia/Kuala_Lumpur'),
    worldtime(location: 'South korea', flag: 'southkorea.jpg', url: 'Asia/Seoul'),
  ];
  void gettime(index) async{
    worldtime instance= loc[index];
    await instance.getdata();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday':instance.isday,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlueAccent,
        title: Text("Locations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: loc.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/${loc[index].flag}'),
                  fit: BoxFit.fill,
                  ),
                border: Border.all(
                  color: Colors.black,
                )
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: Card(
                  color: Colors.black.withOpacity(0.55),
                  child:ListTile(
                  onTap: (){
                    gettime(index);
                  },
                  title: Text(
                    loc[index].location,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold ,
                      color: Colors.white,
                    ),
                    ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${loc[index].flag}'),
                  ),
                )
                ),
              ),
            ),
          );
        }
        )
      
    );
  }
}