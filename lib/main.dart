import 'package:flutter/material.dart';
import 'package:math_games_app/screens/choose_game_screen.dart';
import 'package:math_games_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games Math App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/home",
      routes: {
        '/home': (context) => HomeScreen(),
        '/choose_game_screen': (context) => ChooseGameScreen()
      },
      home: const HomeScreen(),
    );
  }
}