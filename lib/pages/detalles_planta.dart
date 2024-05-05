// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:aprendiendo_flutter/colores/colores.dart';
import 'package:aprendiendo_flutter/pages/ordernar_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../compoments/botton_car.dart';
import '../models/plantas.dart';

class PaginaDetallesPlanta extends StatefulWidget {
  final Plantas plantas;
  const PaginaDetallesPlanta({super.key, required this.plantas});

  @override
  State<PaginaDetallesPlanta> createState() => _DetallesPlantaState();
}

class _DetallesPlantaState extends State<PaginaDetallesPlanta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color5,
      appBar: AppBar(
          backgroundColor: AppColors.color2,
          elevation: 0,
          foregroundColor: Colors.white,
          title: Center(
            child: Text("EcoFlorecer",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                )),
          )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ListView(
                children: [
                  //imagen
                  Image.asset(
                    widget.plantas.imagePath,
                    height: 340,
                  ),
                  const SizedBox(height: 40),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plantas.nombre,
                          style: GoogleFonts.dmSerifDisplay(fontSize: 48),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          widget.plantas.nombreCientifico,
                          style: GoogleFonts.dmSerifDisplay(fontSize: 38),
                        ),
                        const SizedBox(height: 10),
                        Text("Tipo: " + widget.plantas.tipo,
                            style: GoogleFonts.dmSerifDisplay(fontSize: 24)),
                        const SizedBox(height: 10),
                        Text("Codigo: " + widget.plantas.codigo,
                            style: GoogleFonts.dmSerifDisplay(fontSize: 24)),
                        const SizedBox(height: 10),
                        Text("Stock: " + widget.plantas.stock.toString(),
                            style: GoogleFonts.dmSerifDisplay(fontSize: 24)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: AppColors.color2,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                MyButtonCar(
                  text: "Ordenar",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrdernarPage(plantas: widget.plantas),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
