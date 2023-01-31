import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/generated/assets.dart';
import 'package:places/ui/screens/res/colors.dart';
import 'package:places/ui/screens/sight_details.dart';

class VisitCard extends StatelessWidget {
  const VisitCard({Key? key, required this.sight, this.planned})
      : super(key: key);
  final Sight sight;
  final bool? planned;

  @override
  Widget build(BuildContext context) => AspectRatio(
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
                            sight.type,
                            style: const TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                planned == true
                                    ? Assets.imagesCalendar
                                    : Assets.imagesShare,
                                width: 24,
                                height: 24,
                                color: AppColors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                Assets.imagesClear,
                                width: 12,
                                height: 12,
                                color: AppColors.white,
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
                          color: Theme.of(context).backgroundColor,
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
                                    color: Theme.of(context).iconTheme.color,
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
                              style: TextStyle(
                                color: Color(
                                    planned == true ? 0xFF4CAF50 : 0xFF7C7E92),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Закрыто до 09:00',
                              style: TextStyle(
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
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
