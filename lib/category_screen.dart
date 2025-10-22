import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _selectedCategory = 'Meats & Fishes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF2A438A),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, Halal',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Shop',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'By Category',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  onPressed: () {},
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildChip('Meats & Fishes'),
                  const SizedBox(width: 8),
                  _buildChip('Vegetables'),
                  const SizedBox(width: 8),
                  _buildChip('Fruits'),
                  const SizedBox(width: 8),
                  _buildChip('Others'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                _buildCategoryItem(
                  bgColor: const Color(0xFFFDE8BD),
                  title: 'Big & Small Fishes',
                  subtitle: 'Fresh from sea',
                  price: r'$36/KG',
                ),
                const SizedBox(height: 20),
                _buildCategoryItem(
                  bgColor: const Color(0xFFFBC8BD),
                  title: 'Halal Meats',
                  subtitle: 'Organics & Fresh',
                  price: r'$90/KG',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    final isSelected = _selectedCategory == label;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedCategory = label;
          });
        }
      },
      backgroundColor: Colors.grey[200],
      selectedColor: const Color(0xFFF5A623),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
      showCheckmark: false,
    );
  }

  Widget _buildCategoryItem({
    required Color bgColor,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent, // Set background to transparent
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: bgColor, // Apply color to the image container
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 60,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Starting from',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2A438A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
