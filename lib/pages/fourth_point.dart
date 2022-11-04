import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FourthPoint extends StatefulWidget {
  const FourthPoint({Key? key}) : super(key: key);

  @override
  State<FourthPoint> createState() => _FourthPointState();
}

class _FourthPointState extends State<FourthPoint> {
  var listViewChildren = <Widget>[
    const SizedBox(
      height: 50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    listViewChildren.add(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          keyboardType: TextInputType.name,
          onChanged: (value) async {
            var url = Uri.parse(
                'http://universities.hipolabs.com/search?country=$value');
            var response = await http.get(url);
            var object = json.decode(response.body);
            listViewChildren.clear();
            for (int i = 0; i < object.length; i++) {
              var college = object[i];
              listViewChildren.add(
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      '${college['name']}\n\n${college['domains'][0]}\n\n${college['web_pages'][0]}\n\n\n\n'),
                ),
              );
            }
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a search term',
          ),
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        children: listViewChildren,
      ),
    );
  }
}
