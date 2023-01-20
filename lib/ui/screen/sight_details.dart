import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatefulWidget {
  const SightDetails({Key? key, required this.sight}) : super(key: key);
  final Sight sight;

  @override
  State<SightDetails> createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                widget.sight.url,
                height: 360,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 36,
                left: 16,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF252849),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: widget.sight.name,
                    style: const TextStyle(
                      color: Color(0xFF3B3E58),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                RichText(
                    text: TextSpan(
                        text: widget.sight.type,
                        style: const TextStyle(
                          color: Color(0xFF3B3E58),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        children: const [
                      WidgetSpan(
                        child: SizedBox(
                          width: 16,
                        ),
                      ),
                      TextSpan(
                          text: 'закрыто до 09:00',
                          style: TextStyle(
                            color: Color(0xFF7C7E92),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))
                    ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: RichText(
                    text: TextSpan(
                      text: widget.sight.details,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3B3E5B),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/route.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                              letterSpacing: 0.03),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 8),
                  child: Divider(
                    color: Color(0x7C7E928F),
                  ),
                ),
                Row(
                  children: const [
                    SightDetailsButton(
                      label: 'Запланировать',
                      imagePath: 'assets/images/calendar.png',
                    ),
                    SightDetailsButton(
                      label: 'В Избранное',
                      color: Color(0xFF3B3E5B),
                      imagePath: 'assets/images/heart.png',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SightDetailsButton extends StatelessWidget {
  const SightDetailsButton(
      {Key? key, this.onTap, required this.label, required this.imagePath, this.color})
      : super(key: key);
  final VoidCallback? onTap;
  final String label;
  final Color? color;
  final String imagePath;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints.expand(width: 164, height: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
                color: color,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                label,
                style: TextStyle(
                  color: color ?? const Color.fromRGBO(124, 126, 146, 0.56),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
}
