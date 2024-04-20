import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/screens/game.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: Center(
                child: Text(
                  'Tic Tac Toe'.toUpperCase(),
                  style: GoogleFonts.coiny(
                    fontSize: 40,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: AvatarGlow(
                endRadius: 200,
                duration: const Duration(seconds: 2),
                glowColor: secondaryColor,
                repeat: true,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 150,
                  child: Image.asset(
                    'asset/image/tic tac toe.png',
                    color: accentColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      '@CREATED BY SINAN',
                      style: GoogleFonts.coiny(
                          color: secondaryColor, fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const GameScreen())));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Play game'.toUpperCase(),
                              style: GoogleFonts.coiny(
                                  color: secondaryColor, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
