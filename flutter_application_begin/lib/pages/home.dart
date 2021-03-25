import 'package:flutter/material.dart';
import 'package:flutter_application_begin/pages/choose_location.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   // create a Map containing those arguments recieved from loading
  Map data = {};

  @override
  Widget build(BuildContext context) {
   
    // recieving args and updating value of data
    data = data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    print("data here $data");

    // set background img
    String bgImg = data['isDayTime'] ? 'day1.png': 'night1.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[800];




    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assests/$bgImg'),
              fit: BoxFit.cover,
            ),

          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                // ignore: deprecated_member_use
                FlatButton.icon(
                  onPressed: () async{
                  dynamic result = await Navigator.push(context,MaterialPageRoute(builder: (context) => ChooseLocation()));
                  if (result!= null){
                    setState(() {
                                      data = {
                                        'time': result['time'],
                                        'location':result['location'],
                                        'isDayTime':result['isDayTime'],
                                        'flag':result['flag'],
                                      };
                                    });
                  }
                  
                  },
              
                
                  icon:Icon(Icons.edit_location),
                  label: Text('change location'),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style:TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                      ),
                    ),
              ],

            ),
          ),
        ),
        ),
      
    );
  }
}