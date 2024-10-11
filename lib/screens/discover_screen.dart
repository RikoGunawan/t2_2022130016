import 'package:flutter/material.dart';

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
  String _selectedCategory = ''; // To track the selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230.0), // Mengatur tinggi AppBar
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: Stack(
            children: [
              Positioned(
                left: 20, // Jarak dari kiri
                top: 30, // Jarak dari atas
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        40, 255, 255, 255), // Warna background lingkaran
                    borderRadius: BorderRadius.circular(
                        30.0), // Membuat background dengan sudut membulat
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
                right: 20, // Jarak dari kanan
                top: 30, // Jarak dari atas
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(
                        40, 255, 255, 255), // Warna background lingkaran
                    shape: BoxShape.circle, // Bentuk lingkaran
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
                        // Search Bar Container
                        Expanded(
                          child: Container(
                            height: 35.0, // Mengatur tinggi container
                            // Membuat background bulat untuk seluruh search bar
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color
                              borderRadius:
                                  BorderRadius.circular(30.0), // Rounded edges
                            ),
                            child: Row(
                              children: [
                                // Ikon di sebelah kiri
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                // Expanded digunakan untuk membuat TextField fleksibel
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0, // Ukuran teks "Search"
                                      ),
                                      border: InputBorder
                                          .none, // Menghilangkan border
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            17.5, // Mengatur padding vertikal untuk teks di tengah
                                        horizontal:
                                            10.0, // Padding horizontal untuk teks
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.0, // Tinggi tombol lebih kecil
                                  margin: const EdgeInsets.only(
                                      right: 2.0), // Margin kanan
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.blue, // Warna biru untuk tombol
                                    borderRadius: BorderRadius.circular(
                                        30.0), // Rounded edges
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      // Aksi ketika tombol search ditekan
                                      print("Search button pressed");
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            8.0, // Padding horizontal untuk tombol lebih kecil
                                        vertical:
                                            0.0, // Padding vertikal minimum
                                      ),
                                      minimumSize: Size
                                          .zero, // Menghapus ukuran minimum tombol
                                    ),
                                    child: const Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Colors.white, // Warna teks putih
                                        fontSize:
                                            10.0, // Ukuran teks lebih kecil
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Space between search bar and button
                        // Icon Button di sebelah kanan search bar
                        IconButton(
                          icon: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // Warna background lingkaran
                            ),
                            padding: const EdgeInsets.all(
                                2.0), // Padding agar ikon di tengah lingkaran
                            child: const Icon(
                              Icons.tune_outlined,
                              color: Colors.blue,
                              size: 20, // Warna ikon
                            ),
                          ),
                          onPressed: () {
                            // Aksi ketika ikon button ditekan
                            print("Filter button pressed");
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
            // Title: Top Categories
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

            // Horizontal Scroll for Categories
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

            // Spacer
            const SizedBox(height: 20),

            // Display Cards when a category is selected
            if (_selectedCategory.isNotEmpty) _buildCategoryCards(),

            // Spacer
            const SizedBox(height: 20),

            // Title: Popular Destination
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

            // Other contents here
          ],
        ),
      ),
    );
  }

  // Method to build category buttons with icons
  Widget _buildCategoryButton({required IconData icon, required String label}) {
    bool isSelected = _selectedCategory == label; // Check if button is selected

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            _selectedCategory = label; // Update selected category
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

  // Method to build horizontal scrollable cards
  Widget _buildCategoryCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCardItem(
            image: 'assets/beach.jpg', // Replace with your image asset
            title: 'Beautiful Beach',
            rating: 5.0,
            location: 'Bali, Indonesia',
          ),
          _buildCardItem(
            image: 'assets/mountain.jpg', // Replace with your image asset
            title: 'Majestic Mountain',
            rating: 4.8,
            location: 'Alps, Switzerland',
          ),
          _buildCardItem(
            image: 'assets/snow.jpg', // Replace with your image asset
            title: 'Snowy Peaks',
            rating: 4.9,
            location: 'Himalayas, Nepal',
          ),
        ],
      ),
    );
  }

  // Method to build individual card items
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
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Title and Rating
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

              // Location
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
