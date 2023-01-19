import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  const SightCard({Key? key, required this.sight}) : super(key: key);
  final Sight sight;

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints.expand(height: 188),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(sight.url),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            )),
        child: Stack(
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
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  ///Временное решение
                  Icon(Icons.heart_broken_outlined,color: Colors.white,)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 92,
                  minWidth: double.infinity
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: sight.name,
                        style: const TextStyle(
                          color: Color(0xFF3B3E58),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2,),
                    InkWell(
                      onTap: () {},
                      child: const Text('краткое описание',
                          style: TextStyle(
                            color: Color(0xFF7C7E92),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
