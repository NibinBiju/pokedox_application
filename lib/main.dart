import 'package:flutter/material.dart';
import 'package:pokedox_application/controller/pokemon_controller.dart';
import 'package:pokedox_application/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PokemonController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
