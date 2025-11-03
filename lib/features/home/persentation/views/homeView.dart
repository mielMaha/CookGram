

import 'package:cookgram/features/home/persentation/widgets/homeBody.dart';
import 'package:cookgram/features/home/persentation/views/searchView.dart';
import 'package:cookgram/features/recipesMaker/persentation/views/addRecipeView.dart';
import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final List<Widget> pages = [
    Homebody(),
    Searchview(),
    AddRecipeScreen(),
    Icon(Icons.favorite),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'add'),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: 'community',
            ),
          ],
        ),
      ),
    );
  }
}
