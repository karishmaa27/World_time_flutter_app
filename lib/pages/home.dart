import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  final Map<dynamic,dynamic> arguments;
  const Home({super.key, required this.arguments});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  @override
  Widget build(BuildContext context) {

    final bool? isDaytime = widget.arguments['isDaytime'];
    final String backgroundImage = isDaytime == true ? 'day.png' : 'night.png';
    final Color bgColor = isDaytime == true ? Colors.blue : Colors.indigo[700] ?? Colors.blue;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage( 'assets/$backgroundImage'),
                fit: BoxFit.cover,

              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        widget.arguments['time']= result['time'];
                        widget.arguments['location'] = result['location'];
                        widget.arguments['flag'] = result['flag'];
                        widget.arguments['isDaytime'] = result['isDaytime'];
                      });
                    },
                    icon: Icon(Icons.edit_location,
                    color: Colors.grey[300],),
                    label: Text('Edit Location',
                    style:TextStyle(
                      color: Colors.grey[300]
                    ),),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.arguments['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(widget.arguments['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white
                  ),),
                ],
              ),
            ),
          )
      ),
    );
  }
}
