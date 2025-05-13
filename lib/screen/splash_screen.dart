import 'package:flutter/material.dart';
import 'package:story_app/static/common.dart';
import 'package:story_app/screen/components/loader_widget.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoaderWidget(), 
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.loadingSplash,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
