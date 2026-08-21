import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

//fstless
class Main extends StatelessWidget {
  const Main({
    super.key,
    });

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Alumno',
      home: RegistroPage(),
    );
  }
}

//fstful
class RegistroPage extends StatefulWidget {
  const RegistroPage({
    super.key,
  });

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
