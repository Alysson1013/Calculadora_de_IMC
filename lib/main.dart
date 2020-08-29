import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra Superion
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      //Corpo
      backgroundColor: Colors.white,
      //Declaração do corpo
      body: Column(
        //Define um eixo principal
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //Filhos da coluna
        children: [
          Icon(Icons.person_outline, size: 120.0, color: Colors.green),
          //Input do Texto, junto com a declaração
          TextField(
            keyboardType: TextInputType.number,
            //Decoração
            decoration: InputDecoration(
                labelText: 'Peso(kg)',
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            //Decoração
            decoration: InputDecoration(
                labelText: 'Altura(cm)',
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
