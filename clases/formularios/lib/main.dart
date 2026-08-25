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
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return /*fscaff*/  Scaffold(
      appBar: AppBar(
        title: const Text('Registro alumno'),
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
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                controller: _nombreController,

                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Dame un nombre';
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
