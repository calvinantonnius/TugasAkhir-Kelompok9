import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Coffee';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Find the best",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "coffee for you",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search for coffee...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          // Header Section
          Header(img: '../asset/images/matcha.jpg'),
          // Category Section
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(
                  title: 'All',
                  isSelected: selectedCategory == 'Coffee',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Coffee';
                    });
                  },
                ),
                CategoryButton(
                  title: 'Coffee',
                  isSelected: selectedCategory == 'Latte',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Latte';
                    });
                  },
                ),
                CategoryButton(
                  title: 'Non-Coffee',
                  isSelected: selectedCategory == 'Non-Coffee',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Non-Coffee';
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Special for you",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 220, // Adjust height as needed
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      KatalogItem(
                        img: '../asset/images/cofpow.jpg',
                        nama: 'Espresso',
                        deskripsi: 'Kopi hitam pekat yang kuat dan kaya rasa.',
                        harga: 'Rp 25.000',
                      ),
                      KatalogItem(
                        img: '../asset/images/matpow.jpg',
                        nama: 'Latte',
                        deskripsi: 'Kopi susu dengan foam yang lembut.',
                        harga: 'Rp 30.000',
                      ),
                      KatalogItem(
                        img: '../asset/images/matcha.jpg',
                        nama: 'Cappuccino',
                        deskripsi:
                            'Kombinasi espresso, susu, dan foam yang seimbang.',
                        harga: 'Rp 28.000',
                      ),
                      KatalogItem(
                        img: '../asset/images/cofpow.jpg',
                        nama: 'Americano',
                        deskripsi: 'Espresso yang diencerkan dengan air panas.',
                        harga: 'Rp 22.000',
                      ),
                      KatalogItem(
                        img: '../asset/images/matpow.jpg',
                        nama: 'Mocha',
                        deskripsi: 'Perpaduan kopi, coklat, dan susu.',
                        harga: 'Rp 32.000',
                      ),
                      KatalogItem(
                        img: '../asset/images/matcha.jpg',
                        nama: 'Matcha Latte',
                        deskripsi: 'Kombinasi teh hijau matcha dan susu.',
                        harga: 'Rp 35.000',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListView(
                  shrinkWrap:
                      true, // Important to prevent ListView from taking infinite height
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: KatalogItemVertikal(
                        img: '../asset/images/matcha.jpg',
                        nama: 'Espresso',
                        deskripsi: 'Kopi hitam pekat yang kuat dan kaya rasa.',
                        harga: 'Rp 25.000',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: KatalogItemVertikal(
                        img: '../asset/images/cofpow.jpg',
                        nama: 'Latte',
                        deskripsi: 'Kopi susu dengan foam yang lembut.',
                        harga: 'Rp 30.000',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: KatalogItemVertikal(
                        img: '../asset/images/cofpow.jpg',
                        nama: 'Cappuccino',
                        deskripsi:
                            'Kombinasi espresso, susu, dan foam yang seimbang.',
                        harga: 'Rp 28.000',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// New Header Widget
class Header extends StatelessWidget {
  final String img;

  Header({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 10), // Added horizontal margin
      height: 150, // Adjusted height to match KatalogItemVertikal
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Category Button Widget
class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  CategoryButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.brown),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class KatalogItem extends StatelessWidget {
  final String img;
  final String nama;
  final String deskripsi;
  final String harga;

  KatalogItem({
    required this.img,
    required this.nama,
    required this.deskripsi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Adjust width as needed
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deskripsi,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                harga,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KatalogItemVertikal extends StatelessWidget {
  final String img;
  final String nama;
  final String deskripsi;
  final String harga;

  KatalogItemVertikal({
    required this.img,
    required this.nama,
    required this.deskripsi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 1), // Added horizontal margin
      height: 150, // Increased height for larger size
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  fontSize: 18, // Increased font size for name
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deskripsi,
                style: TextStyle(
                  fontSize: 14, // Increased font size for description
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                harga,
                style: TextStyle(
                  fontSize: 16, // Increased font size for price
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
