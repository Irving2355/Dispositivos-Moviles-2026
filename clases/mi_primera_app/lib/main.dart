import 'package:flutter/material.dart';

void main() {
  runApp(
    /*const MaterialApp(
      home: Text('Hola Flutter',),
    ),*/
    //const Text('Hola Flutter'),

    /*const MaterialApp(
      home: Scaffold(
        //body: Text('Hola con Scaffold',),
        body: Center(
          child: Text('Hola ISC 7B',),
        ),
      ),
    ),*/

    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dispositivos',),
        ),

        body: const Center(
          child: Text('Centro',),
        ),
      ),
    ),
  );
}

