import 'package:flutter/material.dart';
import 'package:movie_flutter/ui/screens/home/home_screen.dart';
import 'package:movie_flutter/ui/screens/language/language_screen.dart';
import 'package:movie_flutter/ui/screens/profile/profile_screen.dart';
import 'package:movie_flutter/ui/screens/settings/settings_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesHomeScreen(),
      routes: {
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/language': (context) => const LanguageScreen(),
      },
    );
  }
}
