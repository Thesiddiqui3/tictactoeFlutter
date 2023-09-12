import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true;
  List disp = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _tapped(index);
                },
                child: Container(
                  // margin: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Text(
                      disp[index],
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn) {
        disp[index] = "o";
      } else {
        disp[index] = 'x';
      }
      ohTurn = !ohTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    if (disp[0] == disp[1] && disp[0] == disp[2] && disp[0] != "") {
      print("r1");
      showWinDialog(disp[0]);
    }
    if (disp[3] == disp[4] && disp[3] == disp[5] && disp[3] != "") {
      print("r2");
      showWinDialog(disp[3]);
    } else if (disp[6] == disp[7] && disp[6] == disp[8] && disp[6] != "") {
      print("r3");
      showWinDialog(disp[6]);
    } else if (disp[0] == disp[3] && disp[0] == disp[6] && disp[0] != "") {
      print("c1");
      showWinDialog(disp[0]);
    } else if (disp[1] == disp[4] && disp[1] == disp[7] && disp[1] != "") {
      print("c2");
      showWinDialog(disp[1]);
    } else if (disp[2] == disp[5] && disp[2] == disp[8] && disp[2] != "") {
      print("c3");
      showWinDialog(disp[2]);
    } else if (disp[0] == disp[4] && disp[0] == disp[8] && disp[0] != "") {
      print("d1");
      showWinDialog(disp[0]);
    } else if (disp[2] == disp[4] && disp[2] == disp[6] && disp[2] != "") {
      print("d2");
      showWinDialog(disp[2]);
    } else if (disp[0] != '' &&
        disp[1] != '' &&
        disp[2] != '' &&
        disp[3] != '' &&
        disp[4] != '' &&
        disp[5] != '' &&
        disp[6] != '' &&
        disp[7] != '' &&
        disp[8] != '') {
      matchDraw();
    }
  }

  void showWinDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("WINNER IS :  ${winner.toUpperCase()}"),
            content: ElevatedButton(
                onPressed: () {
                  setState(() {
                    disp = ["", "", "", "", "", "", "", "", ""];
                    Navigator.of(context).pop(false);
                  });
                },
                child: Icon(Icons.restore)),
          );
        });
  }

  void matchDraw() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("MATCH DARW"),
            content: ElevatedButton(
                onPressed: () {
                  setState(() {
                    disp = ["", "", "", "", "", "", "", "", ""];
                    Navigator.of(context).pop(false);
                  });
                },
                child: Icon(Icons.restore)),
          );
        });
  }
}
