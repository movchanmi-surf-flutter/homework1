import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/generated/assets.dart';

class MySightCard extends StatelessWidget {
  const MySightCard({Key? key, required this.sight}) : super(key: key);
  final Sight sight;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          constraints: const BoxConstraints.expand(height: 188),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Image.network(sight.url, loadingBuilder: (context,
                  child, loadingProgress) {
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
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        Image.asset(
                          Assets.imagesHeart,
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      constraints: const BoxConstraints(
                          minHeight: 92, minWidth: double.infinity),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: MediaQuery.of(context).size.width * 0.5),
                            child: RichText(
                              text: TextSpan(
                                text: sight.name,
                                style: const TextStyle(
                                  color: Color(0xFF3B3E58),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'краткое описание',
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
              )
            ],
          ),
        ),
      );
}
