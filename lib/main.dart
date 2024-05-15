import 'package:flutter/material.dart';
import 'package:delulu/src/rust/frb_generated.dart';
import 'package:delulu/pages/search.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      // TODO: remove
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            // elevation: 0,
            ),
        navigationBarTheme: NavigationBarThemeData(
          height: 70,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return TextStyle(
                  color: Colors.white,
                  // fontSize: 12,
                  fontWeight: FontWeight.w400,
                );
              } else {
                return TextStyle(
                  color: Colors.white54,
                  // fontSize: 12,
                  fontWeight: FontWeight.w400,
                );
              }
            },
          ),
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(color: Colors.white);
              } else {
                return IconThemeData(color: Colors.white54);
              }
            },
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 44,
            fontFamily: 'PixelifySans',
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Placeholder(),
        Search(),
        Placeholder(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.turned_in_not_outlined),
            selectedIcon: Icon(Icons.turned_in_outlined),
            label: 'Convos',
          ),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            selectedIcon: Icon(Icons.panorama_photosphere_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome_rounded),
            label: 'Models',
          ),
        ],
      ),
    );
  }
}
