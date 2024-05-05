// ignore_for_file: prefer_const_constructors

import 'package:aprendiendo_flutter/colores/colores.dart';
import 'package:aprendiendo_flutter/compoments/botton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25),
            Text(
              "EcoFlorecer",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/planta-intro.png'),
            ),
            Text(
              "Donde la vida florece y la naturaleza cobra vida",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Únete a nosotros en nuestro viaje hacia un mundo más floreciente y lleno de vida. ¡Ven y deja que tu ecoflorecer interior cobre vida con nosotros!",
              style: TextStyle(
                color: Colors.white,
                height: 2,
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "Iniciar",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
