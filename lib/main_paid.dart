import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:story_app/data/api/api_auth.dart';
import 'package:story_app/data/api/api_story.dart';
import 'package:story_app/my_app.dart';
import 'package:story_app/provider/auth/auth_provider.dart';
import 'package:story_app/provider/detail/story_detail_provider.dart';
import 'package:story_app/provider/form/form_provider.dart';
import 'package:story_app/provider/form/upload_provider.dart';
import 'package:story_app/provider/home/story_list_provider.dart';
import 'package:story_app/provider/localizations_provider.dart';
import 'package:story_app/routes/page_manager.dart';
import 'package:story_app/static/flavor_config.dart';

void main() {
  final authRepository = ApiAuth();
  final authProvider = AuthProvider(authRepository);

  FlavorConfig(
    flavor: FlavorType.paid,
    values: const FlavorValues(titleApp: "Paid App"),
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiAuth()),
        Provider(create: (context) => ApiStory(Client())),
        ChangeNotifierProvider(create: (context) => PageManager<String>()),
        ChangeNotifierProvider(create: (context) => PageManager<LatLng>()),
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
        ChangeNotifierProvider(create: (context) => FormProvider()),
        ChangeNotifierProvider(
          create: (context) => UploadProvider(ApiStory(Client())),
        ),
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
