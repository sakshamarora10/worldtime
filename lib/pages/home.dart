import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  String bg;
  Color clr;
  @override
  Widget build(BuildContext context) {
   data= (data.isNotEmpty)?data:ModalRoute.of(context).settings.arguments;
   bg=data['isday']?'day.png':'night.png';
   clr=data['isday']?Colors.black87:Colors.white;
    return Scaffold(
      backgroundColor: clr,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg'),
              fit: BoxFit.cover)
          ),
              child: Column(
                children:<Widget>[
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'].toUpperCase(),
                      style: TextStyle(
                        fontSize: 50,
                        letterSpacing: 1,
                        color: clr,
                      ),
                    )
                    
                  ],
                ),
                SizedBox(height: 50,),
                Text(
                  data['time'].substring(0,12),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: clr,
                  ),
                ),
                SizedBox(height:10),
                 Text(
                  data['time'].substring(13),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: clr,
                  ),
                ),
                SizedBox(height: 300,),
                 FloatingActionButton(
                onPressed: () async{
                  dynamic result= await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time': result['time'],
                      'location': result['location'],
                      'isday':result['isday'],
                      'flag':result['flag']
                    };
                  });
                }, 
                child: Icon(Icons.location_on), 
                ),

            ]
          ),
        )
      )
      
      
    );
  }
}