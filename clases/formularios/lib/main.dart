import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//fstless
class MyApp extends StatelessWidget {
const MyApp({
  super.key,
});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro Alumno',
      home: RegristoPage(),
    );
  }
}

//fstful
class RegristoPage extends StatefulWidget {
  const RegristoPage({
    super.key,
  });

  @override
  State<RegristoPage> createState() => _RegristoPageState();
}

class _RegristoPageState extends State<RegristoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
