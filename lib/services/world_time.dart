import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class worldtime {
  String location;
  String flag;
  String url;
  String time;
  bool isday;
  worldtime({this.location,this.flag,this.url});
  Future<void> getdata() async{
     try{
       Response response= await get('http://worldtimeapi.org/api/timezone/$url');
     Map data=jsonDecode(response.body);
     String datetime= data['datetime'].substring(0,26);
    //  String offsethour= data['utc_offset'].substring(1,3);
    //  String offsetmin= data['utc_offset'].substring(4,6);
     DateTime now= DateTime.parse(datetime);
     //now=now.add(Duration(hours: int.parse(offsethour),minutes: int.parse(offsetmin)));
     isday= (now.hour>6 && now.hour<20)?true:false;
     time=DateFormat.yMMMd().add_jm().format(now);
     }
     catch(e){
       print(e);
       time='could not get the time';
     }
  }
}