import 'package:flutter/material.dart';

void main() {
  runApp(
    /*const MaterialApp(
      home: Text('Hola Flutter',),
    ),*/
    //const Text('Hola Flutter',),
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dispositivos moviles',),
        ),
        body: Center(
          //child: Text('Hola pero centrado',),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_android,
                size: 200,
              ),
              SizedBox(height: 20,),
              Text(
                'Texto 1',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Text('Texto 2',),
              SizedBox(height: 20,),
              Text('Texto 3',),
            ],
          ),
        ),
      ),
    ),
  );
}

