import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Jonathan",
                style: TextStyle(
                  color: Colors.green, 
                ),
                ),
              accountEmail: Text(
                "jonathan@gmail.com",
                style: TextStyle(
                  color: Colors.green, 
                ),
                ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/ferxxo.jpg'), 
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 253, 218),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              trailing: Icon(Icons.arrow_forward),
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
        children: [
          NewsCard(
            title: 'Título de la noticia 1',
            description: 'Descripción de la noticia 1',
            imageUrl: 'https://via.placeholder.com/150',
          ),
          NewsCard(
            title: 'Título de la noticia 2',
            description: 'Descripción de la noticia 2',
            imageUrl: 'https://via.placeholder.com/150',
          ),
          NewsCard(
            title: 'Título de la noticia 3',
            description: 'Descripción de la noticia 3',
            imageUrl: 'https://via.placeholder.com/150',
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const NewsCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
