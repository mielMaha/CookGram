

import 'package:cookgram/features/recipes/persentation/views/community_view.dart';
import 'package:cookgram/features/search/persentation/widgets/home_body.dart';
import 'package:cookgram/features/search/persentation/views/search_view.dart';
import 'package:cookgram/features/recipes/persentation/views/add_recipe_view.dart';
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
   CommunityView(),
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
