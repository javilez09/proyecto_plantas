// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aprendiendo_flutter/colores/colores.dart';
import 'package:aprendiendo_flutter/compoments/planta_tile.dart';
import 'package:aprendiendo_flutter/models/plantas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detalles_planta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Plantas> listaPlantas = [];

  @override
  void initState() {
    super.initState();
    cargarDatosDesdeFirestore();
  }

  void cargarDatosDesdeFirestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('Planta').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listaPlantas.add(Plantas(
            nombreCientifico: doc['nombre_cientifico'],
            nombre: doc['nombre'],
            tipo: doc['tipo'],
            imagePath: doc['imagen'],
            codigo: doc['codigo'],
            stock: doc['stock']));
      });
      setState(() {});
    }).catchError((error) {
      print("Error al obtener datos de Firestore: $error");
    });
  }

  void navegarDetallesPlanta(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaginaDetallesPlanta(
          plantas: listaPlantas[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color5,
      appBar: AppBar(
        backgroundColor: AppColors.color2,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Center(
          child: Text("EcoFlorecer",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Buscar aqui...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Productos",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 25),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: listaPlantas.length,
              itemBuilder: (context, index) {
                return PlantaTile(
                  planta: listaPlantas[index],
                  onTap: () {
                    navegarDetallesPlanta(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
