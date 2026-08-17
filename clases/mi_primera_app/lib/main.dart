import 'package:flutter/material.dart';

void main() {
  /*runApp(
    const Text('Hola Flutter'),
  );*/

  /*runApp(
    const MaterialApp(
      home: Text( 
        'Hola Flutter',
      ),
    ),
  );*/


  /*runApp(
    const MaterialApp(
      home: Scaffold(
        body: Text(
          'Hola con Scaffold',
        ),
      ),
    ),
  );*/

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dispositivos moviles',
          ),
        ),

        body: Center( 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: const[
              Text('Parte 1',),
              Text('Parte 2',),
            ],
          ),
        ),
      ),
    ),
  );
}

