import 'package:dsgreader/utils/constants/colors.dart';
import 'package:dsgreader/utils/theme/theme.dart';
import 'package:dsgreader/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'HistoryPage.dart';
import 'FavoritesPage.dart';
import 'SettingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      title: 'DSG Reader',
      debugShowCheckedModeBanner: false,
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
    const HomePage(),
    const HistoryPage(),
    const FavoritesPage(),
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      // For title bar at top, works like HStack
      appBar: AppBar(
        backgroundColor: HAppTheme.darkTheme.primaryColor,
        title: _widgetOptions[_currentIndex],
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          )
        ],
      ),

      // For everything in middle, works like its own Z/H/VStack
      body: _children[_currentIndex],

      // For configuring what is show on bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HColors.primary,
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
        selectedItemColor: Colors.amber[800],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).pop(); // Close the Drawer
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const SettingsPage(),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Connections'),
              onTap: () {
                // Add functionality
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Add functionality
              },
            ),
          ],
        ),
      )
    );
  }
}
