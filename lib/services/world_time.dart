import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  late String location;
  late String time;
  late String flag; // url to an asset flag eg. Asia/Jakarta
  late String url; // location url for API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  
  Future<void> getTime() async{

    try{

    // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(offset);
      
      //create dateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      
      // set the time property
      time = now.toString();
      }
      catch(e){
        print('caught error: $e');
        time = 'could not get time data';
    }


  }


}