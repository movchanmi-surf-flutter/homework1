import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/visit_card.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with TickerProviderStateMixin {
  late final AppLocalizations applocale;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    final ThemeData theme = Theme.of(context);
    final AppLocalizations applocale=AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            applocale.fav,
            style:
            theme.textTheme.headline1?.copyWith(fontSize: 18),
          ),
          bottom: TabBar(
            indicatorColor: theme.iconTheme.color,
            tabs: [
              Tab(
                text: applocale.seen,
              ),
              Tab(
                text: applocale.wannaSee,
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _WantToVisitPage(),
            _VisitedPage(),
          ],
        ),
      ),
    );
  }
}

///Страница мест, которые хотелось посетить
class _WantToVisitPage extends StatelessWidget {
  const _WantToVisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          VisitCard(
            sight: mocks.first,
            planned: true,
          )
        ],
      );
}

///Страница посещенных мест
class _VisitedPage extends StatelessWidget {
  const _VisitedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          VisitCard(sight: mocks.last),
        ],
      );
}
