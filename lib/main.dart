import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/themes.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>const MainScreen();
}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDarkTheme = false;
  static const List<Widget> screens = [
    SightListScreen(),
    Text(''),
    VisitingScreen(),
    Text(''),
  ];
  int currind=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currind,
          onTap: (newInd)=>newInd!=currind ? setState(()=>currind=newInd) : null,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken),
              label: 'favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'settings',
            ),
          ],
        ),
        body: screens[currind],
      ),
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? AppThemes.darkTheme : AppThemes.lightTheme,
      title: 'Places',
    );
  }
}


