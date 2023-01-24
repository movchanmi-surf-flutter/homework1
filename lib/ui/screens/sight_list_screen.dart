import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: const MyAppBar(),
        body: SafeArea(
          bottom: false,
          minimum: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView.separated(
            itemCount: mocks.length,
            itemBuilder: (_, index) => SightCard(sight: mocks[index]),
            separatorBuilder: (_, index) => const SizedBox(
              height: 16,
            ),
          ),
        ),
      );
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints.tightFor(height: preferredSize.height),
        padding: const EdgeInsets.only(left: 16, top: 40),
        child: Text(
          'Список\nинтересных мест',
          style: Theme.of(context).textTheme.headline1
        ),
      );

  @override
  Size get preferredSize => const Size(double.infinity, 136);
}
