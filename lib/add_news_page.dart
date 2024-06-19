// ignore_for_file: avoid_print, duplicate_ignore, use_build_context_synchronously, sort_child_properties_last, unused_element

import 'package:app1/firebase_service.dart';
import 'package:flutter/material.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromRGBO(13, 71, 161, 1), 
      ),
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Formulario de Noticias",
                      style: TextStyle(
                        fontFamily: "PoetsenOne-Regular",
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _titleController,
                              labelText: 'Titulo',
                              icon: Icons.account_circle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese el nombre del sneaker';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _descriptionController,
                              labelText: 'Descripción',
                              icon: Icons.straighten,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _descriptionController,
                              labelText: 'Continente',
                              icon: Icons.wrong_location_rounded,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _contentController,
                              labelText: 'Contenido',
                              icon: Icons.whatshot,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese el modelo del sneaker';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _contentController,
                              labelText: 'Estado de la noticia',
                              icon: Icons.start_outlined,
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () async{
                                await addFutneet(_titleController.text);
                                 // ignore: avoid_print
                                 print('$_titleController');
                                 print('$_descriptionController');
                                 print('$_contentController');
                                 
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Datos Enviados')),
                                  );
                                   Navigator.pushNamed(context, "/home");
                                }
                              },
                              child: const Text('Enviar'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 44, 0, 167),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }

  Widget _buildDropdownButtonFormField({
    required String? value,
    required String labelText,
    required IconData icon,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      items: items.map((label) => DropdownMenuItem(
        child: Text(label),
        value: label,
      )).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
