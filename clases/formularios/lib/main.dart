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
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return /*fscaff*/Scaffold(
      appBar: AppBar(
        title: const Text('Registro de alumno',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre completo',

                  hintText: 'Maria Jose',

                  prefixIcon: Icon(Icons.person,),

                  border: OutlineInputBorder(),
                ),
                controller: _nombreController,

                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Ingresa tu nombre';
                  }

                  return null;
                },
              ),

              //fszbh
              SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: _correoController,

                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: 'Correo',
                  hintText: 'correo@ejemplo.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
