import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/static/common.dart';
import 'package:story_app/data/api/api_auth.dart';
import 'package:story_app/provider/localizations_provider.dart';
import 'package:story_app/routes/router_delegate.dart';
import 'package:story_app/static/flavor_config.dart';

class MainApp extends StatefulWidget {
  final ApiAuth authRepository;
  const MainApp({super.key, required this.authRepository});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late MyRouterDelegate myRouterDelegate;

  @override
  void initState() {
    super.initState();
    myRouterDelegate = MyRouterDelegate(widget.authRepository);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalizationProvider>(context);

    return MaterialApp.router(
      title: FlavorConfig.instance.values.titleApp,
      routerDelegate: myRouterDelegate,
      backButtonDispatcher: RootBackButtonDispatcher(),
      debugShowCheckedModeBanner: false,

      locale: provider.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
