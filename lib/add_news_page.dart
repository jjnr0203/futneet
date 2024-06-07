import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear Noticia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateNewsScreen(),
    );
  }
}

class CreateNewsScreen extends StatefulWidget {
  @override
  _CreateNewsScreenState createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final List<String> continents = ['Asia', 'Europa', 'América'];
  final List<String> states = ['Humo', 'Real', 'Rumor'];

  String? selectedContinent;
  String? selectedState;

  String? title;
  String? description;
  String? content;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _saveNews() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes implementar la lógica para guardar la noticia
      // Por ejemplo, puedes enviar los datos a una base de datos o a un servicio web
      print('Noticia guardada:');
      print('Título: $title');
      print('Descripción: $description');
      print('Contenido: $content');
      print('Continente: $selectedContinent');
      print('Estado: $selectedState');
      // Después de guardar la noticia, puedes redirigir al usuario al home
      Navigator.pop(context); // Regresa a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Noticia'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nueva Noticia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) => title = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el título';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Título',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) => description = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese la descripción';
                        }
                        return null;
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) => content = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el contenido';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Contenido',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      value: selectedContinent,
                      items: continents.map((String continent) {
                        return DropdownMenuItem<String>(
                          value: continent,
                          child: Text(continent),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedContinent = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor seleccione el continente';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Continente',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      value: selectedState,
                      items: states.map((String state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedState = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor seleccione el estado';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Estado',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _saveNews,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                         
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
