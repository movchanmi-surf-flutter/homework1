import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  TextStyle _textStyle({required Color textColor}) => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textColor,
      );
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          centerTitle: false,
          toolbarHeight: 72,
          title: Text(
            'Список\nинтересных мест',
            style: _textStyle(
              textColor: const Color(0xFF252849),
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          minimum: const EdgeInsets.only(left: 16,right: 16,top: 16),
          child: ListView.separated(
              itemCount: mocks.length,
              itemBuilder:(_,index)=>SightCard(sight: mocks[index]),
            separatorBuilder: (_,index)=>const SizedBox(height: 16,),),
        ),
      );
}
