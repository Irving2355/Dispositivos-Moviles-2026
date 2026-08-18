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
      const MiApp(),
    // MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text(
    //         'Dispositivos moviles',
    //       ),
    //     ),

    //     body: Center( 
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
            
    //         children: [
    //           Icon(Icons.phone_android,size: 80,),
    //           SizedBox(height: 10,),
    //           Text(
    //             'Parte 1',
    //             style: TextStyle(
    //               fontSize: 26,
    //               fontWeight: FontWeight.bold,
    //             ),
    //             ),
    //           SizedBox(height: 10,),
    //           Text('Parte 2',),
    //           SizedBox(height: 30,),
    //           ElevatedButton(
    //             onPressed: (){
    //               print('El usario presiono el boton');
    //             }, 
    //             child: const Text('Comenzar',),
    //             ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  );
}

class MiApp extends StatelessWidget{
  const MiApp({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    //return Text('Mi aplicacion',);
    return const MaterialApp(
      home: Text( 
        'Hola Flutter',
      ),
    );
  }
}

