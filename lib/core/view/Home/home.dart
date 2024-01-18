import 'package:flutter/material.dart';
import 'package:happy_connect/core/view/sample_photo.dart';

import '../profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  // List of widgets for each tab/screen
  final List<Widget> _pages = [
    SamplePhoto(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'SamplePhoto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'ProfileScreen',
          ),
        ],
      ),
    );
  }
}



