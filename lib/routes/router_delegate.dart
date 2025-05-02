import 'package:flutter/material.dart';
import 'package:story_app/data/api/api_auth.dart';
import 'package:story_app/data/model/page_configuration.dart';
import 'package:story_app/screen/auth/login_screen.dart';
import 'package:story_app/screen/auth/register_screen.dart';
import 'package:story_app/screen/detail/detail_screen.dart';
import 'package:story_app/screen/form/form_screen.dart';
import 'package:story_app/screen/splash_screen.dart';
import 'package:story_app/screen/home/story_list_screen.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final ApiAuth authApi;

  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool isRegister = false;

  MyRouterDelegate(this.authApi) : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    isLoggedIn = await authApi.isLoggedIn();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  String? selectedStory;
  bool isForm = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onDidRemovePage: (page) {
        if (page.key == ValueKey(selectedStory)) {
          selectedStory = null;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            notifyListeners();
          });
        }
        if (page.key == const ValueKey("FormScreen")) {
          isForm = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            notifyListeners();
          });
        }
        if (page.key == const ValueKey("RegisterPage")) {
          isRegister = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            notifyListeners();
          });
        }
      },
    );
  }

  List<Page> get _splashStack => const [
    MaterialPage(key: ValueKey("SplashPage"), child: SplashScreen()),
  ];

  List<Page> get _loggedOutStack => [
    MaterialPage(
      key: const ValueKey("LoginPage"),
      child: LoginScreen(
        onLogin: () {
          isLoggedIn = true;
          notifyListeners();
        },
        onRegister: () {
          isRegister = true;
          notifyListeners();
        },
      ),
    ),
    if (isRegister == true)
      MaterialPage(
        key: const ValueKey("RegisterPage"),
        child: RegisterScreen(
          onRegister: () {
            isRegister = false;
            notifyListeners();
          },
          onLogin: () {
            isRegister = false;
            notifyListeners();
          },
        ),
      ),
  ];

  List<Page> get _loggedInStack => [
    MaterialPage(
      key: const ValueKey("QuotesListPage"),
      child: StoryListScreen(
        onTapped: (String storyId) {
          selectedStory = storyId;
          notifyListeners();
        },
        toFormScreen: () {
          isForm = true;
          notifyListeners();
        },
        onLogout: () {
          isLoggedIn = false;
          notifyListeners();
        },
      ),
    ),
    if (selectedStory != null)
      MaterialPage(
        key: ValueKey(selectedStory),
        child: DetailScreen(storyId: selectedStory!),
      ),
      if (isForm)
      MaterialPage(
        key: ValueKey("FormScreen"),
        child: FormScreen(
          onSend: () {
            isForm = false;
            notifyListeners();
          },
        ),
      ),
  ];

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
