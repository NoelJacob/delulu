// TODO: remove
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:delulu/src/rust/frb_generated.dart';
import 'package:delulu/chat.dart';

import 'package:share_plus/share_plus.dart';

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
          elevation: 0,
          centerTitle: true,
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
            fontSize: 46,
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

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delulu',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.share),
          //   onPressed: () {
          //     Share.share('Check out this cool app!');
          //   },
          // ),
          // SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
            iconSize: 34,
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 46),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        minLines: 2,
                        maxLines: 8,
                        autocorrect: false,
                        cursorColor: Colors.white70,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Ask anything...',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                            color: Colors.white24,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                        child: Row(
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding:
                                    MaterialStatePropertyAll(EdgeInsets.zero),
                                iconSize: MaterialStatePropertyAll(20),
                                overlayColor: MaterialStatePropertyAll(
                                  Colors.transparent,
                                ),
                              ),
                              icon: Icon(Icons.filter_center_focus_rounded),
                              label: Text("Topic"),
                            ),
                            SizedBox(
                              width: 28,
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding:
                                    MaterialStatePropertyAll(EdgeInsets.zero),
                                iconSize: MaterialStatePropertyAll(20),
                                overlayColor: MaterialStatePropertyAll(
                                  Colors.transparent,
                                ),
                              ),
                              icon: Icon(Icons.add_circle_outline_rounded),
                              label: Text("Attach"),
                            ),
                          ],
                        ),
                      ), // Button
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
