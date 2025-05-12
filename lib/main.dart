import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:story_app/common.dart';
import 'package:story_app/data/api/api_auth.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/provider/auth/auth_provider.dart';
import 'package:story_app/provider/detail/story_detail_provider.dart';
import 'package:story_app/provider/form/form_provider.dart';
import 'package:story_app/provider/form/upload_provider.dart';
import 'package:story_app/provider/home/story_list_provider.dart';
import 'package:story_app/provider/localizations_provider.dart';
import 'package:story_app/routes/page_manager.dart';
import 'package:story_app/routes/router_delegate.dart';

void main() {
  final authRepository = ApiAuth();
  final authProvider = AuthProvider(authRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiAuth()),
        Provider(create: (context) => ApiStory(Client())),
        ChangeNotifierProvider(create: (context) => PageManager<String>()),
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
        ChangeNotifierProvider(create: (context) => FormProvider()),
        ChangeNotifierProvider(create: (context) => UploadProvider(ApiStory(Client()))),
        ChangeNotifierProvider(
          create: (context) => StoryListProvider(context.read<ApiStory>()),
        ),
        ChangeNotifierProvider(
          create: (context) => StoryDetailProvider(context.read<ApiStory>()),
        ),
        ChangeNotifierProvider(create: (context) => authProvider),
      ],
      child: MainApp(authRepository: authRepository),
    ),
  );
}

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
      title: 'Story App',
      routerDelegate: myRouterDelegate,
      backButtonDispatcher: RootBackButtonDispatcher(),
      debugShowCheckedModeBanner: false,

      locale: provider.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
