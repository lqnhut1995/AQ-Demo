import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

import 'home.dart';

enum NavigationType { Default, Option1 }

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Booking',
      style: optionStyle,
    ),
    Text(
      'Favorite',
      style: optionStyle,
    ),
    Text(
      'User',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('#414A5A'),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedItemColor: HexColor('#414A5A').withOpacity(0.4),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
