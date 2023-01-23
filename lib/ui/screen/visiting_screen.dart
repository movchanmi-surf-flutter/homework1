import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Избранное',
          style: TextStyle(
            color: Color(0xFF252849),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        bottom: const TabBar(
          indicatorColor: Color(0xFF3B3E5B),
          labelColor: Color(0xFF3B3E5B),
          unselectedLabelColor: Color(0xFF7C7E92),
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          tabs: [
            Tab(
              text: 'Хочу посетить',
            ),
            Tab(
              text: 'Посетил',
            )
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          WantToVisitPage(),
          VisitedPage(),
        ],
      ),
    ),
  );
}

///Страница мест, которые хотелось посетить
class WantToVisitPage extends StatelessWidget {
  const WantToVisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>ListView(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
    children: [
      VisitCard(sight: mocks.first,planned: true,)
    ],
  );
}

///Страница посещенных мест
class VisitedPage extends StatelessWidget {
  const VisitedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>ListView(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
    children: [
      VisitCard(sight: mocks.last)
    ],
  );
}
