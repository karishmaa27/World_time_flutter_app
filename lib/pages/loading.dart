import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async {
    WorldTime instance =WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Home(
        arguments: {
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
          'isDaytime': instance.isDaytime,
        }
    )),);

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 70.0,
        ),
      )
    );
  }
}
