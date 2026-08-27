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
  final _correoController = TextEditingController();
  final _passworController = TextEditingController();
  String? _carrera;
  bool _aceptaTerminos = false;

  @override
  Widget build(BuildContext context) {
    return /*fscaff*/Scaffold(
      appBar: AppBar(
        title: const Text('Registro de alumno',),
      ),
      body: SingleChildScrollView(
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

              SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: _passworController,
                obscureText: true,

                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock,),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(
                height: 16,
              ),


              DropdownButtonFormField(
                initialValue: _carrera,
                decoration: const InputDecoration(
                  labelText: 'Carrera',
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(
                    value: 'ISC',
                    child: Text('Ingeneria en sistemas',),
                  ),
                  DropdownMenuItem(
                    value: 'IE',
                    child: Text('Ingeneria en electronica',),
                  ),
                ], 
                onChanged: (value){
                  setState(() {
                    _carrera = value;
                  });
                },

                validator: (value){
                  if(value == null){
                    return 'Selecciona una carrera';
                  }
                  return null;
                },
                ),

                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Acepto terminos',),
                  value: _aceptaTerminos, 
                  onChanged: (value){
                    setState(() {
                      _aceptaTerminos = value ?? false;
                    });
                  }
                ),

                //frow -> fex
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _registrar, 
                        child: Text('Registrar',),
                      ),
                    ),

                    SizedBox(
                      width: 12,
                    ),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: limpiar, 
                        child: Text('Limpiar',),
                      ),
                    )
                  ],
                ),
                
            ],
          ),
        ),
        ),
    );
  }

  void _registrar(){
    final formularioValido = _formKey
                            .currentState!.validate();

    if(!formularioValido){
      return;
    }

    if(!_aceptaTerminos){
      ScaffoldMessenger
        .of(context)
        .showSnackBar(
          SnackBar(
            content: Text('Debes aceptar los terminos',),
          ),
        );
      return;
    }

    final nombre = _nombreController
                      .text.trim();
    
    final correo = _correoController
                      .text.trim();
    
    print('Nombre: $nombre');
    print('Correo: $correo');
    print('Carrera: $_carrera');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Alumno registrado',),
      ),
    );
  }

  void limpiar(){
    _nombreController.clear();
    _correoController.clear();
    _passworController.clear();

    setState(() {
      _carrera = null;
      _aceptaTerminos = false;
    });
  }
}
