import 'package:flutter/material.dart';
import 'package:happy_connect/core/view/Home/sample_photo.dart';

import '../../../main.dart';
import '../../components/camera.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  // List of widgets for each tab/screen
  final List<Widget> _pages = [const SamplePhoto(),  Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.image,),
              label: 'Ảnh mẫu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
          ],
          selectedItemColor: Colors.red, // Màu của item được chọn
          unselectedItemColor: Color.fromARGB(100, 0, 0, 0), // Màu của item không được chọn
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(camera: cameras.first),
              ),
            );
          },
          child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 45,),
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
