import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPoint extends StatefulWidget {
  const SecondPoint({Key? key}) : super(key: key);

  @override
  State<SecondPoint> createState() => _SecondPointState();
}

class _SecondPointState extends State<SecondPoint> {
  var genderBoxColor = Colors.lightGreen;
  var genderBoxText = 'Unknow';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            keyboardType: TextInputType.name,
            onChanged: (value) async {
              var url = Uri.parse('https://api.genderize.io/?name=$value');
              var response = await http.get(url);
              var object = json.decode(response.body);
              genderBoxText = '${object['gender']}';
              setState(() {
                if (genderBoxText == 'male') {
                  genderBoxColor = Colors.lightBlue;
                } else if (genderBoxText == 'female') {
                  genderBoxColor = Colors.pink;
                } else if (genderBoxText == 'null') {
                  genderBoxColor = Colors.lightGreen;
                }
              });
            },
            decoration: const InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: genderBoxColor,
          child: Text(
            genderBoxText,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ]),
    );
  }
}
