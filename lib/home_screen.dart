import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import './category_screen.dart';
import './theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePage(),
      const CategoryScreen(),
      const Center(child: Text('Favourite Page')),
      const Center(child: Text('More Page')),
    ];

    return Scaffold(
      appBar: _selectedIndex == 0 ? _buildHomeAppBar() : null,
      body: pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildHomeAppBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hey, Halal',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    badges.Badge(
                      badgeContent: const Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      position: badges.BadgePosition.topEnd(top: -12, end: -12),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Theme.of(context).colorScheme.secondary,
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search Products or store',
                    hintStyle: TextStyle(color: Colors.white.withAlpha(128)),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: darkBlue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DELIVERY TO',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.white.withAlpha(178),
                              ),
                        ),
                        DropdownButton<String>(
                          value: 'Green Way 3000, Sylhet',
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                          dropdownColor: darkBlue,
                          underline: Container(),
                          onChanged: (String? newValue) {},
                          items: <String>['Green Way 3000, Sylhet', 'Some Other Place']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WITHIN',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.white.withAlpha(178),
                              ),
                        ),
                        DropdownButton<String>(
                          value: '1 Hour',
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                          dropdownColor: darkBlue,
                          underline: Container(),
                          onChanged: (String? newValue) {},
                          items: <String>['1 Hour', '30 Minutes', '2 Hours']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildOfferCard(context, primaryYellow, 'Get', '50% OFF', 'On first 03 order'),
                  const SizedBox(width: 20),
                  _buildOfferCard(context, black20, 'Get', '20% OFF', 'On first order'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Recommended',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard(context, 'Fresh Lemon', 'Organic', '\$12'),
                  const SizedBox(width: 20),
                  _buildProductCard(context, 'Green Tea', 'Organic', '\$06'),
                  const SizedBox(width: 20),
                  _buildProductCard(context, 'Fresh Lemon', 'Organic', '\$12'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCard(BuildContext context, Color color, String text1, String text2, String text3) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.image, size: 70, color: Colors.white),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text1, style: const TextStyle(color: Colors.white, fontSize: 20)),
              Text(text2, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              Text(text3, style: const TextStyle(color: Colors.white, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String name, String type, String price) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: black1,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(25),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, size: 60, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: Theme.of(context).textTheme.bodyLarge),
          Text(type, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Unit $price', style: Theme.of(context).textTheme.bodyLarge),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primaryBlue,
      unselectedItemColor: black60,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
           activeIcon: Icon(Icons.grid_view),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
        ),
      ],
    );
  }
}
