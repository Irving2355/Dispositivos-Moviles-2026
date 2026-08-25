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
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return /*fscaff*/ Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro Alumno'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',

                  prefixIcon: Icon(Icons.person,),

                  border: OutlineInputBorder(),
                ),
                controller: _nombreController,

                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Ingrese su nombre';
                  }

                  return null;
                },
              ),
            
            SizedBox(
              height: 16,
            ),

            TextFormField(
              controller: _correoController,

              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                labelText: 'Correo',

                hintText: 'correo@ejemplo.com',

                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),

              validator: (value){
                if(value == null || value.trim().isEmpty){
                  return 'Ingrese su correo';
                }

                if(!value.contains('@')){
                  return 'Correo no valido';
                }

                return null;
              },
            ),
            
            SizedBox(
              height: 16,
            ),

            TextFormField(
              controller:
                  _passwordController,

              obscureText: true,

              decoration:
                  const InputDecoration(

                labelText:
                    'Contraseña',

                prefixIcon:
                    Icon(
                  Icons.lock,
                ),

                border:
                    OutlineInputBorder(),

              ),

              validator: (value) {

                if (value == null ||
                    value.isEmpty) {

                  return
                      'Ingrese una contraseña';

                }

                if (value.length < 6) {

                  return
                      'Use al menos 6 caracteres';

                }

                return null;

              },

            ),
            ],
          ),
        ),
      ),
    );
  }
}
