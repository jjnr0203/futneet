import 'package:flutter/material.dart';

class ChargingPage extends StatefulWidget {
  const ChargingPage({super.key});

  @override
  State<ChargingPage> createState() => _ChargingPageState();
}

class _ChargingPageState extends State<ChargingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.blue[900], // Cambio de color a azul marino
      ),
      backgroundColor:  const Color.fromARGB(255, 13, 71, 161), // Cambio de color a azul marino
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "El mundo de la noticias que desees conocer lo haces tu!",
              style: TextStyle(
                fontFamily: "Georgia",
                fontSize: 18.0,
                color: Colors.white, // Cambio de color a blanco
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("images/logo_futneet.jpeg"), // Mantengo la imagen centrada
                ),
                Transform.rotate(
                  angle: -0.1,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Container(),
                  ),
                ),
                Transform.rotate(
                  angle: 0.1,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    child: Container(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Bienvenidos a We Got Kicks",
              style: TextStyle(
                fontFamily: "PoetsenOne-Regular",
                fontSize: 40.0,
                color: Colors.white, // Cambio de color a blanco
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Los sneakers no son solo zapatos, son una declaración.- Michael Jordan",
              style: TextStyle(
                fontFamily: "Georgia",
                fontSize: 18.0,
                color: Colors.white, // Cambio de color a blanco
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16.0), // Añadir un poco de espacio desde la parte superior
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          icon: const Icon(Icons.arrow_forward), // Añadir el ícono como trailing
          label: const Text('Avanzar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF14A34D), // Mantengo el color original del botón
            foregroundColor: Colors.white, // Cambio de color a blanco
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop, // Ubicar el botón en la esquina superior derecha
    );
  }
}
