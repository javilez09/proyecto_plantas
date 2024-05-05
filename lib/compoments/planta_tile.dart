import 'package:aprendiendo_flutter/models/plantas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantaTile extends StatelessWidget {
  final Plantas planta;
  final void Function()? onTap;
  const PlantaTile({super.key, required this.planta, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(14),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            // imagen
            Image.asset(
              planta.imagePath,
              height: 120,
            ),

            const SizedBox(width: 20),

            //Nombre Planta
            Expanded(
              child: Column(
                children: [
                  Text(
                    planta.nombre,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  //Nombre Cientifico
                  Text(
                    planta.nombreCientifico,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                  ),
                ],
              ),
            ),

            //Tipo
          ],
        ),
      ),
    );
  }
}
