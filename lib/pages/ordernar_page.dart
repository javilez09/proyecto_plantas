// ignore_for_file: prefer_const_constructors

import 'package:aprendiendo_flutter/colores/colores.dart';
import 'package:aprendiendo_flutter/compoments/botton_car.dart';
import 'package:aprendiendo_flutter/models/plantas.dart';
import 'package:aprendiendo_flutter/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdernarPage extends StatefulWidget {
  final Plantas plantas;
  const OrdernarPage({super.key, required this.plantas});

  @override
  State<OrdernarPage> createState() => _OrdernarPageState();
}

class _OrdernarPageState extends State<OrdernarPage> {
  DateTime fechaSolicitud = DateTime.now();
  DateTime fechaEntrega = DateTime.now();
  DateTime fechaAprobacion = DateTime.now();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void _mostrarFecha() {
    showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        fechaEntrega = value!;
      });
    });
  }

  void guardarPedido() {
    FirebaseFirestore.instance.collection('Pedido').add({
      'Planta': widget.plantas.codigo,
      'fechaAprobacion': Timestamp.fromDate(fechaAprobacion),
      'fechaEntrega': Timestamp.fromDate(fechaEntrega),
      'fechaSolicitud': Timestamp.fromDate(fechaSolicitud),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: AppColors.color5,
        appBar: AppBar(
            backgroundColor: AppColors.color2,
            elevation: 0,
            foregroundColor: Colors.white,
            title: Center(
              child: Text("Resumen del pedido",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28,
                    color: Colors.white,
                  )),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                _buildText("Detalles de la compra:", 42),
                const SizedBox(height: 20),
                _buildText(
                    'Fecha de compra:\n ${DateFormat('dd/MM/yyyy').format(fechaSolicitud)}',
                    34),
                const SizedBox(height: 20),
                _buildText(
                    'Nombre planta: \n ${widget.plantas.nombre} \n ${widget.plantas.codigo}',
                    34),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: _mostrarFecha,
                  color: Colors.white,
                  padding: const EdgeInsets.all(25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Selecciona fecha de entrega',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                _buildText(
                    'Fecha de entrega:\n ${DateFormat('dd/MM/yyyy').format(fechaEntrega)}',
                    34),
              ],
            ),
            Container(
              color: AppColors.color2,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  MyButtonCar(
                    text: "Confirmar Orden",
                    onTap: () {
                      guardarPedido();
                      _scaffoldMessengerKey.currentState?.showSnackBar(
                        SnackBar(
                          content: Text('Orden confirmada con éxito'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuPage(),
                          ),
                        );
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildText(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
