import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/generated/assets.dart';
import 'package:places/ui/screens/res/themes.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MainScreen();
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      locale: const Locale('ru'),
      supportedLocales: AppLocalizations.supportedLocales,
      home: const _EntryScreen(),
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? AppThemes.darkTheme : AppThemes.lightTheme,
      title: 'Places',
    );
  }
}

class _EntryScreen extends StatefulWidget {
  const _EntryScreen();

  @override
  State<StatefulWidget> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<_EntryScreen> {
  _EntryScreenState();

  static const List<Widget> screens = [
    SightListScreen(),
    Text(''),
    VisitingScreen(),
    Text(''),
  ];
  int currind = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currind,
        onTap: (newInd) =>
            newInd != currind ? setState(() => currind = newInd) : null,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesList,
                color: theme.bottomNavigationBarTheme.unselectedItemColor),
            activeIcon: SvgPicture.asset(Assets.imagesList,
                color: theme.bottomNavigationBarTheme.selectedItemColor),
            label: 'list',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'map',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesHeartFilled,
                color: theme.bottomNavigationBarTheme.unselectedItemColor),
            activeIcon: SvgPicture.asset(Assets.imagesHeartFilled,
                color: theme.bottomNavigationBarTheme.selectedItemColor),
            label: 'favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesSettings,
                color: theme.bottomNavigationBarTheme.unselectedItemColor),
            activeIcon: SvgPicture.asset(Assets.imagesSettings,
                color: theme.bottomNavigationBarTheme.selectedItemColor),
            label: 'settings',
          ),
        ],
      ),
      body: screens[currind],
    );
  }
}
