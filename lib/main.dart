import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: SticksGame(),
    ));

class SticksGame extends StatefulWidget {
  const SticksGame({Key? key}) : super(key: key);

  @override
  State<SticksGame> createState() => _SticksGameState();
}

class _SticksGameState extends State<SticksGame> {
  int sticks = 21;
  int userChoice = 0;
  int userPicked = 0;
  int compChoice = 0;
  int compPicked = 0;
  int totalPicked = 0;
  String result = '';

  bool isEnabled = true;
  bool gameOver = false;

  void calUserSticks(int num) {
    setState(() {
      userChoice = num;
      userPicked = sticks - userChoice;
      isEnabled = false;
    });
  }

  void calCompSticks(int num) {
    // Timer(Duration(seconds: 5), () {
    //   print('Hello after 5 seconds');
    setState(() {
      compChoice = 5 - userChoice;
      totalPicked = userChoice + compChoice;
      sticks = sticks - totalPicked;
      compPicked = sticks;
      isEnabled = true;
      if (sticks == 1) {
        result = 'User Looses the game as only 1 Stick left';
        isEnabled = true;
        gameOver = true;
      }
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '21 Sticks Game',
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        // color: Colors.teal,
        color: Colors.green[100],
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              'Available Sticks: ' + sticks.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height * 0.08,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Stick 1',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Stick 2',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Comp.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.28,
                  // height: MediaQuery.of(context).size.height * 1.1,
                  // color: Colors.blueAccent[400],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            child: Text('1'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(35, 20),
                            ),
                            onPressed: gameOver == false
                                ? (isEnabled ? () => calUserSticks(1) : null)
                                : null,
                          ),
                          ElevatedButton(
                            child: Text('2'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(38, 20),
                            ),
                            onPressed: gameOver == false
                                ? (isEnabled ? () => calUserSticks(2) : null)
                                : null,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text('3'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(14),
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(40, 20),
                            ),
                            onPressed: gameOver == false
                                ? (isEnabled ? () => calUserSticks(3) : null)
                                : null,
                          ),
                          ElevatedButton(
                            child: Text('4'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              shadowColor: Colors.greenAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(44, 20),
                            ),
                            onPressed: gameOver == false
                                ? (isEnabled ? () => calUserSticks(4) : null)
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  // height: MediaQuery.of(context).size.height * 1,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('21'),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  // height: MediaQuery.of(context).size.height / 6,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.watch_later_outlined),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  // height: MediaQuery.of(context).size.height / 6,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        child: Text('Play'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(10, 20),
                        ),
                        onPressed: gameOver == false
                            ? (isEnabled == false
                                ? () => calCompSticks(userChoice)
                                : null)
                            : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height / 8,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(userChoice.toString()),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.height / 8,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(userPicked.toString()),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.height / 8,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(compPicked.toString()),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.height / 8,
                  // color: Colors.blueAccent[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(compChoice.toString()),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(10, 30),
              ),
              onPressed: () {
                setState(() {
                  userChoice = 0;
                  sticks = 21;
                  compChoice = 0;
                  result = '';
                  totalPicked = 0;
                  userPicked = 0;
                  compPicked = 0;
                  isEnabled = true;
                  gameOver = false;
                });
              },
            ),
            Container(
              // width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 8,
              // color: Colors.blueAccent[400],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
