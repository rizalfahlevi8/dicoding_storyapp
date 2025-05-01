import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/data/api/api_auth.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/provider/auth/auth_provider.dart';
import 'package:story_app/provider/home/story_list_provider.dart';
import 'package:story_app/routes/router_delegate.dart';

void main() {
  final authRepository = ApiAuth();
  final authProvider = AuthProvider(authRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiAuth()),
        Provider(create: (context) => ApiStory()),
        ChangeNotifierProvider(
          create: (context) => StoryListProvider(context.read<ApiStory>()),
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
    return MaterialApp.router(
      title: 'History App',
      routerDelegate: myRouterDelegate,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
