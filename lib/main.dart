import 'package:flutter/material.dart';
import 'package:places/generated/assets.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
    ),
    home: const MainScreen(),
    title: 'Places',
  );
}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> screens = [
    SightListScreen(),
    Text(''),
    VisitingScreen(),
    Text(''),

  ];
  int currind=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currind,
        onTap: (newInd)=>newInd!=currind ? setState(()=>currind=newInd) : null,
        selectedItemColor: const Color(0xFF252849),
        unselectedItemColor: const Color(0xFF3B3E5B),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'list',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'map',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imagesHeartFilled,width: 22,),
            label: 'favorites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'settings',
          ),
        ],
      ),
      body: screens[currind],
    );
  }
}


