import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdPoint extends StatefulWidget {
  const ThirdPoint({Key? key}) : super(key: key);

  @override
  State<ThirdPoint> createState() => _ThirdPointState();
}

class _ThirdPointState extends State<ThirdPoint> {
  var ageBoxColor = Colors.lightGreen;
  var ageBoxText = 'Unknow';
  var ageImage = const Image(image: AssetImage('assets/images/young.jpeg'));

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
              var url = Uri.parse('https://api.agify.io/?name=$value');
              var response = await http.get(url);
              var object = json.decode(response.body);

              ageBoxText = '${object['age']}';

              if (object['age'] <= 25) {
                ageBoxText += ' joven';
                ageImage =
                    const Image(image: AssetImage('assets/images/young.jpeg'));
              } else if (object['age'] <= 60) {
                ageBoxText += ' adulto';
                ageImage =
                    const Image(image: AssetImage('assets/images/adult.jpg'));
              } else if (object['age'] > 60) {
                ageBoxText += ' anciano';
                ageImage =
                    const Image(image: AssetImage('assets/images/erderly.jpg'));
              }

              setState(() {});
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: ageBoxColor,
          child: Text(
            ageBoxText,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        ageImage,
      ]),
    );
  }
}
