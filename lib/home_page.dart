import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
        backgroundColor: Color.fromARGB(255, 13, 0, 133),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Jonathan",
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 3, 3),
                ),
              ),
              accountEmail: Text(
                "jonathan@gmail.com",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/ferxxo.jpg'),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 2, 122),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
            const Divider(
              height: 15.0,
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text("Crear Noticia"),
              trailing: const Icon(Icons.book),
              onTap: () {
                Navigator.pushNamed(context, "/addNews");
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('List'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, "/list");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Salir'),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: const [
          NewsCard(
            title: 'Los mejores jugadores de la jornada 1 de Eurocopa',
            description: 'Ya ha concluido la jornada 1 de la fase de grupos de la Eurocopa y estos son los jugadores más destacados hasta el momento: Musiala, Fabián, Eriksen, Bellingham, Kanté y Arda Güler',
            imagePath: 'images/jugadores.jpg',
          ),
          NewsCard(
            title: '¿Cual será la selección DECEPCIÓN de esta Copa América?',
            description: 'La Copa América es un torneo que todas las selecciones quieren ganar, sin embargo solo uno se queda con el ansiado título. De cara al inicio del torneo hay varios equipos que se perfilan como favoritos para quedarse con el máximo premio, sin embargo algunos de esos conjuntos podrían convertirse en las principales decepciones de la justa internacional''En Futnnet te dejamos algunos equipos que podrían volverse la decepción del torneo.',
            imagePath: 'images/copa.jpg',
          ),
          NewsCard(
            title: 'N’Golo Kanté tras su MVP en la Eurocopa: “Es un honor volver a la Selección Francesa”',
            description: 'N’Golo Kanté volvió a la Selección Francesa tras dos años de ausencia con un increíble desempeño al jugar los 90 minutos. El volante se llevó el MVP en el debut ganador de Francia en la Eurocopa sobre Austria por 1-0.Tras el partido el jugador comentó: “Es un placer volver a la Selección de Francia”. También se mostró contento por retornar a disputar partidos del primer nivel.',
            imagePath: 'images/kantee.jpeg',
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const NewsCard({super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}