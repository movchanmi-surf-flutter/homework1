import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class ModelTheme extends ChangeNotifier {
  bool isDark = Hive.box<bool>('darkTheme').values.first;

  Future<void> switchTheme() async {
    isDark = !isDark;
    await Hive.box<bool>('darkTheme').put('darkTheme', isDark);
    notifyListeners();
  }
}
