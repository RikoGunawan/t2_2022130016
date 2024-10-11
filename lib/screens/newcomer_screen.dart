import 'package:flutter/material.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'main_screen.dart';

class NewcomerScreen extends StatelessWidget {
  const NewcomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Gambar Background
          Positioned.fill(
            child: Image.asset(
              'Beach.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 350,
            left: 20,
            right: 20,
            child: Text(
              'Discover  Amazing world with Gotravel',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Text(
              'Experience the thrill of navigating the ever-evolving real estate market, where each transaction',
              style: TextStyle(color: Colors.grey, fontSize: 9),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Set status pengguna lama dan navigasi ke MainScreen
                  context.read<UserProvider>().setOldUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.3 + 15, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
