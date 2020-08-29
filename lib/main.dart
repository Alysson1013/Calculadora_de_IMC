import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  //O Espaço acima do @override é muito bom para desenvolver funções de interatividade
  //Pra implementar calculos utilizando TextField é necessário controladores
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controladores
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //Usado pelo formulário para validação
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String infoText = "Informe os dados!!!";

  //Função de resetar
  void _resetFields(){
    setState(() {
      weightController.text = "";
      heightController.text = "";

      infoText = "Valores Resetados";
      //Atribui o valor padrão para sumir os dados no reset
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcular(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / pow(height, 2);

      if(imc < 18.6){
        infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 18.6 && imc < 24.9){
       infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 24.9 && imc < 29.9){
       infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 29.9 && imc < 34.9){
       infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 34.9 && imc < 39.9){
       infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 40){
       infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }

    });
  }

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
            onPressed: _resetFields,
          )
        ],
      ),
      //Corpo
      backgroundColor: Colors.white,
      //Declaração do corpo
      body: SingleChildScrollView(
        //Espaçamento interno dos filhos
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            //Define um eixo principal
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //Filhos da coluna
            children: [
              Icon(Icons.person_outline, size: 120.0, color: Colors.green),
              //Input do Texto, junto com a declaração
              TextFormField(
                keyboardType: TextInputType.number,
                //Decoração
                decoration: InputDecoration(
                    labelText: 'Peso(kg)',
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira seu peso!!!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                //Decoração
                decoration: InputDecoration(
                    labelText: 'Altura(cm)',
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira sua Altura!!!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){
                      //Testa se os valores são validos
                      if(_formKey.currentState.validate()){
                        _calcular();
                      }
                    },
                    child: Text('Calcular',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
