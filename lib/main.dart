import 'package:flutter/material.dart';
import 'package:futneet/add_news_page.dart';
import 'package:futneet/charging_page.dart';
import 'package:futneet/home_page.dart';
import 'package:futneet/login_page.dart';
import 'package:futneet/new_page.dart';
import 'package:futneet/register_page.dart';

void main() {
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
        '/home': (context) => NewsScreen(),
        '/addNews': (context) => CreateNewsScreen(),
        '/news': (context) => NewsPage(),
        '/login': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
