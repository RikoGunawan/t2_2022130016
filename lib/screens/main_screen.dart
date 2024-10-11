import 'package:flutter/material.dart';
import 'discover_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DiscoverScreen(welcomeMessage: 'Discover Your Next Trip Destination'),
    const Center(child: Text('Ini halaman Category')),
    const Center(child: Text('Ini halaman Saved')),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Membuat tempat untuk FAB
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildBottomNavigationItem(Icons.home, 'Discover', 0),
            _buildBottomNavigationItem(Icons.category, 'Category', 1),
            GestureDetector(
              // Tombol lingkaran di tengah
              onTap: () {
                // print("Search Pressed");
              },
              child: Container(
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ),
            _buildBottomNavigationItem(Icons.bookmark, 'Saved', 2),
            _buildBottomNavigationItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.black),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
