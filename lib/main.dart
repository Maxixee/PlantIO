import 'package:flutter/material.dart';

void main() {
  runApp(PlantIOApp());
}

class PlantIOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFAB8654), // Cor de fundo marrom
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'PlantIO',
                style: TextStyle(
                  fontFamily: 'Roboto', // Substitua pelo nome correto da fonte usada
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/plant_image.png', // Substitua pelo caminho da sua imagem
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Ação ao clicar no botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Cor do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Começar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
