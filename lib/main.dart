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
    return const MaterialApp(
      title: 'DSG Reader',
      debugShowCheckedModeBanner: false,
      //theme: dsgrThemes.lightTheme,
      //darkTheme: dsgrThemes.darkTheme,
      //themeMode: ThemeMode.system,
      home: BottomNavigation(),
    );
  }
}
/**
class dsgrColors {
  static final lightModeColor = Color(0xFF37474f);
  static final darkModeColor = Color(0xFF01111);
}

class dsgrThemes {
  static final lightTheme = ThemeData(
    primaryColor: dsgrColors.lightModeColor,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: dsgrColors.darkModeColor,
    brightness: Brightness.dark,
  );
}**/

//final appThemeProvider = StateProvider<bool>((ref) => false);

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
    textTheme: Theme.of(context)
      .textTheme
      .copyWith(
      titleSmall:
        Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
      )
      .apply(
        bodyColor: isDarkTheme ? Colors.white : Colors.black,
        displayColor: Colors.grey,
      ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(isDarkTheme ? Colors.orange : Colors.purple),
    ),
    listTileTheme: ListTileThemeData(iconColor: isDarkTheme ? Colors.orange : Colors.purple),
    appBarTheme: AppBarTheme(
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      iconTheme: IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)
    ),
  );
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
        backgroundColor: Colors.blueGrey,
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
        backgroundColor: Colors.blueGrey,
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
                  builder: (context) => SettingsPage(),
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
