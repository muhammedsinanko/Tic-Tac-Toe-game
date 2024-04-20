// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

List<String> motivationalText = [
  '',
  'Superb',
  '',
  'Nice move',
  'd',
  'g',
  'h',
  't',
  'p',
];
int scoreofO = 0;
int scoreofX = 0;
int filledBoxes = 0;
int i = 0;
int selectedIndex = 0;
bool oTurn = true;
List<String> displayXO = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];
TextStyle cusotmFontWhite = GoogleFonts.coiny(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 28));
TextStyle textcustom = GoogleFonts.coiny(
  color: Colors.white,
  fontSize: 21,
);

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: -1,
                child: Column(
                  children: [
                    Text(
                      'Score Board',
                      style: GoogleFonts.coiny(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player O',
                          style: textcustom,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Player X',
                          style: textcustom,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          scoreofO.toString(),
                          style: textcustom,
                        ),
                        Text(
                          scoreofX.toString(),
                          style: textcustom,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                        checkWinner();
                      },
                      child: Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 5, color: primaryColor),
                            color: secondaryColor),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                                textStyle: TextStyle(
                                    fontSize: 64, color: primaryColor)),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 9,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _clearCanvasandscore();
                    },
                    icon: Icon(Icons.restart_alt),
                    label: Text(
                      'Restart',
                      style: GoogleFonts.coiny(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 7,
                      backgroundColor: primaryColor,
                      foregroundColor: accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _tapped(int index) {
    setState(() {
      selectedIndex = index;

      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes += 1;
        log(filledBoxes.toString());
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes += 1;
        log(filledBoxes.toString());
      }
      oTurn = !oTurn;
    });
  }

  checkWinner() {
    //first horizondal line check
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _declareWinner(displayXO[0]);
    } //first vertical line check
    else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _declareWinner(displayXO[0]);
    } //second horizondal line check
    else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _declareWinner(displayXO[3]);
    } //second vertical check
    else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _declareWinner(displayXO[1]);
    } //third horizondal line check
    else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _declareWinner(displayXO[6]);
    } //third vertical line check
    else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _declareWinner(displayXO[2]);
    } //cross right line check
    else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _declareWinner(displayXO[0]);
    } //cross left line check
    else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _declareWinner(displayXO[2]);
    } else if (filledBoxes == 9) {
      _declareDraw();
    }
  }

  _declareDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Draw',
                style: GoogleFonts.coiny(fontSize: 32),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      _clearCanvas();

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Play Again!',
                      style: GoogleFonts.coiny(fontSize: 24),
                    ))
              ],
            ));
  }

  _declareWinner(String winner) {
    if (winner == 'O') {
      scoreofO += 1;
    } else if (winner == 'X') {
      scoreofX += 1;
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Player $winner wins',
                style: GoogleFonts.coiny(fontSize: 32, color: primaryColor),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      _clearCanvas();

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Play Again!',
                      style: GoogleFonts.coiny(
                          fontSize: 24, color: secondaryColor),
                    ))
              ],
            ));
  }

  _clearCanvas() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          displayXO[i] = '';
        }
        oTurn = true;
        filledBoxes = 0;
      },
    );
  }

  _clearCanvasandscore() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          displayXO[i] = '';
        }
        oTurn = true;
        filledBoxes = 0;
        scoreofO = 0;
        scoreofX = 0;
      },
    );
  }
}
