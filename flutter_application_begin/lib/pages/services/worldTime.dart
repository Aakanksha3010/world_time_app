import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime{
  String location; // location of flag 
  String flag; //flag appear on screen
  String url; // location url
  String time; //utc pffset time
  bool isDayTime; // true for daytime else false 

  //creating constructor 
  worldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    print('here');
    //make a request
    try {
      final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      // get data properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      //print(offset);
      String offoff = offset.substring(1, 3);
      //print(offoff);
      // converting datetime string into datetime object using parse method
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offoff)));
    
      // get time property into string
      isDayTime = now.hour > 6 && now.hour< 20 ? true : false;
      time = DateFormat.jm().format(now);  
    } 
    catch (e) {
      print('caught error $e');
      time = ("couldn't update time" );
    }
  }

  
  
}



