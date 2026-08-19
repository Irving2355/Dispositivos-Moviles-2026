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
          //child: Text('Centro',),
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
                  fontSize: 40,
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

