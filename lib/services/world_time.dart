// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:async';

class WorldTime {

  late String location;
  late String time;
  late String flag; // url to an asset flag eg. Asia/Jakarta
  late String url; // location url for API endpoint
  bool isDaytime = true; // daytime checker

  WorldTime({required this.location, required this.flag, required this.url});

  
  Future<void> getTime() async{

    try{

    // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      await Future.delayed(const Duration(seconds: 3));
      Map data = jsonDecode(response.body);
      
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(offset);
      
      //create dateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      
      // set the time property
      isDaytime = now.hour> 6 && now.hour < 18 ? true : false; 
      time = DateFormat.jm().format(now);
      }
      catch(e){
        print('caught error: $e');
        time = 'could not get time data';
    }


  }


}