import 'package:balance/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        primaryColorDark: Colors.grey[800],
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      initialRoute: 'home',
      routes: {'home': (_) => const HomePage()},
    );
  }
}