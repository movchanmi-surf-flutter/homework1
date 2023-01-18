import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  TextStyle _textStyle({required Color textColor})=>TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: textColor,
  );
  @override
  Widget build(BuildContext context)=>Scaffold(
    backgroundColor: Colors.white,
    // resizeToAvoidBottomInset: false,
    appBar: AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      centerTitle: false,
      toolbarHeight: 72,
      title: RichText(text: TextSpan(
        text: 'C',
        style: _textStyle(textColor: const Color(0xFF4CAF50)),
        children: [
          TextSpan(text: 'писок\n',style: _textStyle(textColor: const Color(0xFF252849),),),
          TextSpan(text: 'и',style: _textStyle(textColor: const Color(0xFFFBC02D),),),
          TextSpan(text: 'нтересных мест',style: _textStyle(textColor: const Color(0xFF252849),),),
        ]
      ),maxLines: 2,),
    ),
    body: Center(
      child: Text('Hello!'),
    ),
  );
}
