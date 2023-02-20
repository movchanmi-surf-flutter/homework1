import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/generated/assets.dart';
import 'package:places/ui/screens/res/app_typography.dart';
import 'package:places/ui/screens/res/colors.dart';
import 'package:places/ui/screens/sight_details.dart';

class VisitCard extends StatelessWidget {
  const VisitCard({Key? key, required this.sight, this.planned})
      : super(key: key);
  final Sight sight;
  final bool? planned;
  @override

  @override
  Widget build(BuildContext context){
    final ThemeData theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (_) => SightDetails(
              sight: sight,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          constraints: const BoxConstraints.expand(height: 188),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Image.network(sight.url,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }),
              Stack(
                children: [
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sight.category.categoryName,
                          style: AppTypography.headline3.copyWith(
                            color: AppColors.white
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: planned==true ? _onCalendarPressed : _share,
                              child: SvgPicture.asset(
                                planned == true
                                    ? Assets.imagesCalendar
                                    : Assets.imagesShare,
                                width: 24,
                                height: 24,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: _onClearPressed,
                              child: SvgPicture.asset(
                                Assets.imagesClear,
                                width: 24,
                                height: 24,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      constraints: const BoxConstraints(
                          minHeight: 92, minWidth: double.infinity),
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width:
                                MediaQuery.of(context).size.width * 0.5),
                            child: RichText(
                              text: TextSpan(
                                text: sight.name,
                                style: TextStyle(
                                  color: theme.iconTheme.color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Text(
                              planned == true
                                  ? 'Запланировано на 12 окт.2023'
                                  : 'Цель достигнута на 12 окт.2023',
                              style: AppTypography.headline4.copyWith(
                                  color: Color(planned == true ? 0xFF4CAF50 : 0xFF7C7E92)
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Закрыто до 09:00',
                            style: AppTypography.headline4.copyWith(color: AppColors.lightGray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _share(){
    debugPrint('Нажата кнопка поделиться');
  }
  void _onCalendarPressed(){
    debugPrint('Нажат кнопка календаря');
  }
  void _onClearPressed(){
  debugPrint('Нажат крестик');
  }
}
