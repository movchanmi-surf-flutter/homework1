import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/generated/assets.dart';
import 'package:places/ui/screens/res/app_typography.dart';
import 'package:places/ui/screens/res/colors.dart';
import 'package:places/ui/screens/sight_details.dart';

class SightCard extends StatelessWidget {
  const SightCard({Key? key, required this.sight}) : super(key: key);
  final Sight sight;

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
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
                          sight.type,
                          style: theme.textTheme.headline3?.copyWith(color: AppColors.white),
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            Assets.imagesHeart,
                            width: 24,
                            height: 24,
                            color: AppColors.white,
                          ),
                        ),
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
                                style: theme
                                    .textTheme
                                    .headline2
                                    ?.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              AppLocalizations.of(context)!.shortDesc,
                              style: AppTypography.headline4
                                  .copyWith(color: AppColors.lightGray),
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
      ),
    );
  }
}
