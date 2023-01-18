import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>const MaterialApp(
    home: SightListScreen(),
    title: 'Places',
  );
}



