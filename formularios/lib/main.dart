import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Alumno',
      home: const RegistroPage(),
    );
  }
}

class RegistroPage extends StatefulWidget{
  const RegistroPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() =>
    _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
