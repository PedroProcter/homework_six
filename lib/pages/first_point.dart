import 'package:flutter/material.dart';
import 'fifth_point.dart';
import 'fourth_point.dart';
import 'second_point.dart';
import 'sixth_point.dart';
import 'third_point.dart';

class FirstPoint extends StatelessWidget {
  const FirstPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            crossAxisCount: 3,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SixthPoint(),
                      ),
                    );
                  },
                  customBorder: Border.all(color: Colors.black),
                  child: Column(
                    children: const [
                      Icon(Icons.question_mark),
                      SizedBox(
                        height: 20,
                      ),
                      Text('About Me'),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const FifthPoint(),
                      ),
                    );
                  },
                  customBorder: Border.all(color: Colors.black),
                  child: Column(
                    children: const [
                      Icon(Icons.cloud),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Weather'),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const FourthPoint(),
                      ),
                    );
                  },
                  customBorder: Border.all(color: Colors.black),
                  child: Column(
                    children: const [
                      Icon(Icons.school),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Google College'),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const ThirdPoint(),
                      ),
                    );
                  },
                  customBorder: Border.all(color: Colors.black),
                  child: Column(
                    children: const [
                      Icon(Icons.timer),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Age Genius'),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SecondPoint(),
                      ),
                    );
                  },
                  customBorder: Border.all(color: Colors.black),
                  child: Column(
                    children: const [
                      Icon(Icons.male),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Gender Genius'),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
