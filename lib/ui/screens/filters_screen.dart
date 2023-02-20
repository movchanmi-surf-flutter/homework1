import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:places/domain/geo/geo_service.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/res/app_typography.dart';
import 'package:places/ui/screens/res/colors.dart';
import 'package:places/ui/screens/uikit/main_button.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues distanceRange = const RangeValues(100, 10000);
  List<String> selectedCategories = [];
  List<Sight> currPlaces = mocks;
  int places = mocks.length;
  late final Position currPosition;
  @override
  void initState() {
    GeoService.determinePosition()
        .then((value) => currPosition = value)
        .then((value) => places = _checkPlaces(values: distanceRange));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final applocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.textTheme.displayLarge?.color,
          ),
          onPressed: _onBackPressed,
        ),
        actions: [
          TextButton(
            onPressed: _onClearPressed,
            child: Text(
              applocale.clear,
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 8,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              applocale.categories,
              style: AppTypography.headline4.copyWith(fontSize: 12),
            ),
            Center(
                child: Wrap(
              alignment: WrapAlignment.spaceAround,
              runSpacing: 40,
              children: [
                for (final category in categories)
                  _CategoryWidget(
                    category: category.categoryName,
                    assetName: category.assetName,
                    isSelected:
                        selectedCategories.contains(category.categoryName) ==
                            true,
                    onTap: () async {
                      setState(() {
                        selectedCategories.contains(category.categoryName) ==
                                true
                            ? selectedCategories.remove(category.categoryName)
                            : selectedCategories.add(category.categoryName);
                        places = _checkPlaces(values: distanceRange);
                      });
                    },
                  ),
              ],
            )),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      applocale.distance,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      '${applocale.from} ${distanceRange.start.toInt()} ${applocale.to} ${distanceRange.end.toInt()} ${applocale.metres}',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ],
                ),
                RangeSlider(
                  values: distanceRange,
                  max: 10000,
                  min: 100,
                  onChanged: (values) {
                    setState(() {
                      distanceRange = values;
                      places = _checkPlaces(values: values);
                    });
                  },
                ),
              ],
            ),
            MainButton(
              body: Center(
                child: Text(
                  '${applocale.show} ($places)',
                  style: AppTypography.headline3.copyWith(
                    color: AppColors.white,
                    letterSpacing: 0.03,
                  ),
                ),
              ),
              onPressed: _onShowPressed,
            ),
          ],
        ),
      ),
    );
  }

  void _onShowPressed() {
    debugPrint('show pressed');
  }

  void _onBackPressed() {
    Navigator.pop(context);
  }

  void _onClearPressed() {
    distanceRange = const RangeValues(100, 10000);
    setState(() {
      selectedCategories.clear();
      _checkPlaces(values: distanceRange);
    });
    debugPrint('Нажата кнопка "Очистить"');
  }

  int _checkPlaces({required RangeValues values}) {
    int places = 0;
    List<Sight> sights = [];
    for (final mock in mocks) {
      if (GeoService.isPositionInArea(
          latitude: mock.latitude,
          currPosition: currPosition,
          longtitude: mock.longtitude,
          minRadius: values.start,
          maxRadius: values.end)) {
        sights.add(mock);
      }
      this.places = places;
    }
    if (selectedCategories.isNotEmpty == true) {
      currPlaces = sights
          .where((element) =>
              selectedCategories.contains(element.category.categoryName))
          .toList();
    } else {
      currPlaces = sights;
    }
    places = currPlaces.length;
    return places;
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
    Key? key,
    required this.category,
    this.isSelected,
    this.assetName,
    required this.onTap,
  }) : super(key: key);
  final String category;
  final VoidCallback onTap;
  final String? assetName;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          width: 96,
          height: 92,
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints.expand(width: 64, height: 64),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.green.withOpacity(0.16),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                            'assets/images/filter/${assetName ?? 'specialplace'}.svg'),
                      ),
                    ),
                    if (isSelected == true)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          constraints: const BoxConstraints.expand(
                              width: 16, height: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).iconTheme.color,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).backgroundColor,
                              size: 12,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                category,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
              )
            ],
          ),
        ),
      );
}
