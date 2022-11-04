import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FifthPoint extends StatefulWidget {
  const FifthPoint({Key? key}) : super(key: key);

  @override
  State<FifthPoint> createState() => _FifthPointState();
}

class _FifthPointState extends State<FifthPoint> {
  var object;
  var text = 'null';

  @override
  void initState() {
    super.initState();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=18.47186&lon=-69.89232&appid=b62376995fe7c8500a85cb8f5986c2c6');
    http.get(url).then((value) => {
          setState(() {
            object = json.decode(value.body);
            text =
                '${object['sys']['country']}    ${object['name']}\n\n${object['weather'][0]['main']}    ${object['weather'][0]['description']}';
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text),
      ),
    );
  }
}
