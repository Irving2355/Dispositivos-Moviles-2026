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
  final _correoController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _carrera;
  bool _aceptaTerminos = false;
  
  @override
  Widget build(BuildContext context) {
    return /*fscaff*/  Scaffold(
      appBar: AppBar(
        title: const Text('Registro alumno'),
      ),
      body: SingleChildScrollView(
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

              SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock,),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Ingrese contraseña';
                  }
                  if(value.length < 6){
                    return 'Ingresa 6 caracteres';
                  }
                  return null;
                },
              ),

              DropdownButtonFormField<String>(
                initialValue: _carrera,
                decoration: InputDecoration(
                  labelText: 'Carrera',
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(
                    value: 'ISC',
                    child: Text('Ing en sistemas',),
                    ),
                    DropdownMenuItem(
                    value: 'IE',
                    child: Text('Ing en electronica',),
                    ),
                ], 

                onChanged:(value) {
                  setState(() {
                    _carrera = value;
                  });
                },

                validator: (value) {
                  if(value == null){
                    return 'Selecciona una carrer';
                  }
                  return null;
                },
                ),

                CheckboxListTile(
                  title: Text('Acepto terminos',),
                  value: _aceptaTerminos, 
                  onChanged:(value) {
                    setState(() {
                      _aceptaTerminos = value ?? false;
                    });
                  },
                ),

                //frow -> fex
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          _registrar();
                        }, 
                        child: Text('Registrar',),
                      ),
                    ),

                    SizedBox(
                      width: 12,
                    ),

                    ElevatedButton(
                      onPressed: _limpiar, 
                      child: Text('Limpiar')
                    ),
                  ],
                ),
                
            ],
          ),
        ),
      ),
    );
  }


  void _limpiar(){
    _nombreController.clear();
    _correoController.clear();
    _passwordController.clear();

    setState(() {
      _carrera = null;
      _aceptaTerminos = false;
    });
  }

  void _registrar(){
    final formularioValido = _formKey.currentState!.validate();
    
    if(!formularioValido){
      return;
    }

    if(!_aceptaTerminos){
      ScaffoldMessenger
          .of(context)
          .showSnackBar(
            const SnackBar(
              content: Text('Debes de aceptar teminos',),
              ),
          );
      return;
    }
  }
}
