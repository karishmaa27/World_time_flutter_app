import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;  //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  late bool isDaytime;  //true or false if daytime or not

  WorldTime({required this.location,this.time='12:00' ,required this.flag,required this.url});

  Future<void> getTime() async {

    try{
      //make the request
      Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response= await get(uri);
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime=  data['datetime'];
      String offset= data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour >6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e) {
      print('caught error: $e');
      time='could not get time data';
    }




  }


}

