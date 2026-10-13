import 'package:flutter/material.dart';

class Telaacionamento extends StatefulWidget {
  const Telaacionamento({super.key});

  @override
  State<Telaacionamento> createState() => _TelaacionamentoState();
}

class _TelaacionamentoState extends State<Telaacionamento> {
  final bool status =false;
  Color status_cor = Colors.red;

  _ligarbomba(){
    setState(() {
      status_cor= Colors.green;
    });
  }
  _desligarbomba(){
    setState(() {
      status_cor= Colors.red;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Color(0xFFEAF5EE),
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: ()=> Navigator.pop(context),
         icon: Icon(Icons.arrow_back,color: Colors.brown,),
         ),
         title: Text('Acionamento',
         style: TextStyle(color: Colors.brown,
         fontWeight:FontWeight.bold ),

         
    ),
    centerTitle: true,
    
    ),
    // Widget novo Listview.builder
    body:Center(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 200,
            color: status_cor,
            child: Text("Bomba de irrigação",textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
      
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              ElevatedButton(onPressed: _ligarbomba, 
              child: Text('Ligar bomba')),
              ElevatedButton(onPressed: _desligarbomba, child: Text('Desligar bomba ')),
            ],
          ),
          
           
        ],
      ),
    ));
  }
}