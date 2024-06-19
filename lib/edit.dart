import 'package:app1/firebase_service.dart';
import 'package:flutter/material.dart';

class Editar extends StatefulWidget {
  const Editar({super.key});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  final TextEditingController _titleController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _titleController.text = arguments['title'];

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromRGBO(13, 71, 161, 1), 
      ),
      backgroundColor: Color.fromARGB(255, 199, 199, 199),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación'
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await updateFutneet(arguments['uid'], _titleController.text).then((value){
                  Navigator.pop(context);
                });
              },
              child: const Text('Actualizar')
              ),
          ],
        ),
      ),
    );
  }
}