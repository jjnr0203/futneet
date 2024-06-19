import 'package:app1/add_news_page.dart';
import 'package:app1/charging_page.dart';
import 'package:app1/edit.dart';
import 'package:app1/home_page.dart';
import 'package:app1/list.dart';
import 'package:app1/login_page.dart';
import 'package:app1/new_page.dart';
import 'package:app1/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sugerencias de Noticias Deportivas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ChargingPage(),
        '/home': (context) => const NewsScreen(),
        '/addNews': (context) => const CreateNewsScreen(),
        '/news': (context) => const NewsPage(),
        '/login': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
        '/list': (context) => const ListPage(),
        '/edit': (context) => const Editar(),
      },
    );
  }
}
