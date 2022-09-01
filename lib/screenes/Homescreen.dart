import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessthewords/game.dart';
import 'package:guessthewords/main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String word = 'Flutter';
  List<String> alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'V',
    'Z',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 70, 69),
      appBar: AppBar(
        title: Text('guessthewords'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 57, 57, 58),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/1.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: word
                  .split('')
                  .map((e) => result(e.toUpperCase(),
                      !Game.selectedchar.contains(e.toUpperCase())))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: GridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                padding: EdgeInsets.all(8),
                children: alphabets.map((e) {
                  return RawMaterialButton(
                    onPressed: Game.selectedchar.contains(e)
                        ? null
                        : () {
                            setState(() {
                              Game.selectedchar.add(e);
                              print(Game.selectedchar);
                            });
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    fillColor: Game.selectedchar.contains(e)
                        ? Color.fromARGB(255, 158, 160, 161)
                        : Color.fromARGB(255, 235, 97, 97),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget result(String char, bool hidden) {
    return Container(
      height: 65,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 237, 102),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Visibility(
        visible: !hidden,
        child: Text(
          char,
          style: TextStyle(
            color: Color.fromARGB(255, 53, 146, 153),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
