import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'HistoryPage.dart';
import 'FavoritesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSG Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

// Class that initializes the main app runtime
class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  // Stores an instance of HomePage, HistoryPage, and FavoritesPage()
  final List<Widget> _children = [
    HomePage(),
    HistoryPage(),
    FavoritesPage(),
  ];

  // Used by following method for text styling.
  static const TextStyle optionStyle = TextStyle(fontSize: 30,
      fontWeight: FontWeight.bold);

  // Used for storing the names of the different pages for AppBar
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      "Home",
      style: optionStyle,
    ),
    Text(
      "Favorites",
      style: optionStyle,
    ),
    Text(
      "History",
      style: optionStyle,
    ),
  ];

  // Entered when one of the navigation bar buttons is tapped.
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Similar to Swift VStack
    return Scaffold(
      // For title bar at top, works like HStack
      appBar: AppBar(
        title: _widgetOptions[_currentIndex],
      ),

      // For everything in middle, works like its own Z/H/VStack
      body: _children[_currentIndex],

      // For configuring what is show on bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // Calls void method above to update index state.
        currentIndex: _currentIndex, // Stores currently browsed-to index.
        items: const [ // One entry per item in bar.
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}