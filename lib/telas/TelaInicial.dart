import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaInicialState();
  }

}

class TelaInicialState extends State<TelaInicial>{
  String _textoResultado = 'Resultado: ';
  TextEditingController _controlerValor1 = new TextEditingController();
  TextEditingController _controlerValor2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora'),),
      body: Column(
        children: <Widget>[
          criarCampoText('Valor1:', _controlerValor1), 
          criarCampoText('Valor2:', _controlerValor2),
          Text(
            _textoResultado,
            style: TextStyle(
              fontSize: 20.0
              ),
          ),
          Container(
            height: 50.0,
            width: 200.0,
            child: ElevatedButton(
              onPressed: (){
                double? valor1 = double.tryParse(_controlerValor1.text);
                double? valor2 = double.tryParse(_controlerValor2.text);
                if(valor1 != null && valor2 != null){
                  double result = (valor1 + valor2);
                  setState(() {
                    _textoResultado = 'resultado: $result';
                  });
                }else{
                  setState(() {
                    _textoResultado = 'Por favor, preencha todos os campos';
                  });
                }
              }, child: null,
            ),
          ),
        ],
      ),
    );
  }

  TextField criarCampoText(String texto, TextEditingController controller){
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: texto,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.blue
        )
      ),
    );
  }

}