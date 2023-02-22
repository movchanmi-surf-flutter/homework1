import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/colors.dart';

///Основная кнопка проекта
class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.body, required this.onPressed})
      : super(key: key);
  final Widget body;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: body,
        ),
      );
}
