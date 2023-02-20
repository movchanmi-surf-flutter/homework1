import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/generated/assets.dart';
import 'package:places/ui/screens/res/app_typography.dart';
import 'package:places/ui/screens/res/colors.dart';
import 'package:places/ui/screens/uikit/main_button.dart';

class SightDetails extends StatefulWidget {
  const SightDetails({Key? key, required this.sight}) : super(key: key);
  final Sight sight;

  @override
  State<SightDetails> createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations applocale = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(widget.sight.url, height: 360, fit: BoxFit.cover,
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
              Positioned(
                top: 36,
                left: 16,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
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
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                RichText(
                    text: TextSpan(
                        text: widget.sight.category.categoryName,
                        style: Theme.of(context).textTheme.displaySmall,
                        children: [
                      const WidgetSpan(
                        child: SizedBox(
                          width: 16,
                        ),
                      ),
                      TextSpan(
                          text: 'закрыто до 09:00',
                          style: Theme.of(context).textTheme.headlineMedium)
                    ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: RichText(
                    text: TextSpan(
                        text: widget.sight.details,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
                MainButton(
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.imagesRoute,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        applocale.buildRoute,
                        style: AppTypography.headline3.copyWith(
                            color: AppColors.white, letterSpacing: 0.03),
                      )
                    ],
                  ),
                  onPressed: _createRoute,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 8),
                  child: Divider(
                    color: Color(0x7C7E928F),
                  ),
                ),
                Row(
                  children: [
                    SightDetailsButton(
                      label: applocale.plain,
                      onTap: () => _onButtonTap(buttonName: applocale.plain),
                      imagePath: Assets.imagesCalendar,
                    ),
                    SightDetailsButton(
                      onTap: () => _onButtonTap(buttonName: applocale.toFav),
                      label: applocale.toFav,
                      imagePath: Assets.imagesHeart,
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

  void _onButtonTap({required String buttonName}) {
    debugPrint('Нажата кнопка "$buttonName"');
  }

  void _createRoute() {
    debugPrint('Нажата кнопка построения маршрута');
  }
}

class SightDetailsButton extends StatelessWidget {
  const SightDetailsButton({
    Key? key,
    this.onTap,
    required this.label,
    required this.imagePath,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String label;
  final String imagePath;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints.expand(width: 164, height: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                width: 24,
                height: 24,
                color: Theme.of(context).iconTheme.color,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      );
}
