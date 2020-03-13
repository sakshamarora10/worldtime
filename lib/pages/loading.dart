import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void setuptime() async{
    worldtime instance= worldtime(flag: 'india.jpg',location: 'India',url:'Asia/Kolkata' );
    await instance.getdata();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isday':instance.isday
    } );
  }
 
  @override
  void initState() {
    super.initState();
    setuptime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
         child:SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,

        )
      ),
      
    );
  }
}