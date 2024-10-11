import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/newcomer_screen.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          UserProvider()..loadUserStatus(), // Muat status pengguna
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riko',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 69, 163, 240),
        primaryColorLight: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(33, 150, 243, 1),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(), // Set Inter as default font
      ),
      home: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Cek apakah pengguna baru atau lama
          return userProvider.isNewUser
              ? const NewcomerScreen()
              : const MainScreen();
        },
      ),
    );
  }
}
