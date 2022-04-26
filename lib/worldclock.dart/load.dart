import 'package:flutter/material.dart';
import 'package:tourguide/worldclock.dart/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Color? bgColor=Colors.black;
  void setupWorldTime() async {
    WorldTime instance = 
        WorldTime(flag: 'kathmandu.png', location: 'Kathmandu', url: 'Asia/Kathmandu');
    await instance.getTime();
    bgColor = instance.isDayTime! ? Colors.blueGrey : Colors.indigo[700];

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime':instance.isDayTime,
      }
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          size: 30.0,
          color: Colors.black,
          duration: const Duration(seconds: 1),
        ), 
        ),
    );
  }
}
