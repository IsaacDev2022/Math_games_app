import 'package:flutter/material.dart';
import 'package:math_games_app/screens/games_by_points/choose_game_points_screen.dart';
import 'package:math_games_app/screens/games_by_timed/choose_game_timed_screen.dart';
import 'package:math_games_app/screens/home_screen.dart';
import 'package:math_games_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/game_progress_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameProgressController(),
      child: const MyApp(),
    )
  );
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
      initialRoute: "/splashScreen",
      routes: {
        '/home': (context) => HomeScreen(),
        '/splashScreen': (context) => SplashScreen(),
        '/choose_game_points_screen': (context) => ChooseGamePointsScreen(),
        '/choose_game_timed_screen': (context) => ChooseGameTimedScreen()
      },
      home: const SplashScreen(),
    );
  }
}