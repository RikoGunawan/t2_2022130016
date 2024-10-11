import 'package:flutter/material.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'newcomer_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({
    super.key,
    required this.welcomeMessage,
  });

  final String welcomeMessage;

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String _selectedCategory = 'Beach';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230.0),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: Stack(
            children: [
              Positioned(
                left: 20,
                top: 30,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(40, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Morning, Hasan Faris",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 30,
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(40, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(18, 90, 18, 10),
                    child: Text(
                      widget.welcomeMessage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 17.5,
                                        horizontal: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  margin: const EdgeInsets.only(right: 2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      print("Search button pressed");
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 0.0,
                                      ),
                                      minimumSize: Size.zero,
                                    ),
                                    child: const Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(2.0),
                            child: const Icon(
                              Icons.tune_outlined,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          onPressed: () {
                            // Reset status pengguna agar dianggap pengguna baru
                            context.read<UserProvider>().resetUserStatus();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewcomerScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'Top Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton(
                    icon: Icons.beach_access,
                    label: 'Beach',
                  ),
                  _buildCategoryButton(
                    icon: Icons.terrain,
                    label: 'Mountain',
                  ),
                  _buildCategoryButton(
                    icon: Icons.ac_unit,
                    label: 'Snow',
                  ),
                  _buildCategoryButton(
                    icon: Icons.local_florist,
                    label: 'Campsite',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedCategory.isNotEmpty) _buildCategoryCards(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                "Popular Destination",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton({required IconData icon, required String label}) {
    bool isSelected = _selectedCategory == label;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            _selectedCategory = label;
          });
        },
        icon: Icon(icon, color: isSelected ? Colors.white : Colors.blue),
        label: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCardItem(
            image: 'beach_umbrella.jpg',
            title: 'Pangandaran Beach',
            rating: 4.8,
            location: 'Pangandaran, Indonesia',
          ),
          _buildCardItem(
            image: 'beach_umbrella.jpg',
            title: 'Teluk Penyu Beach',
            rating: 4.8,
            location: 'Alps, Switzerland',
          ),
          _buildCardItem(
            image: 'beach_umbrella.jpg',
            title: 'Snowy Peaks',
            rating: 4.9,
            location: 'Himalayas, Nepal',
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem({
    required String image,
    required String title,
    required double rating,
    required String location,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Text(
                          rating.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 16,
                    ),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
