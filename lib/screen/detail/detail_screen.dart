import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/provider/detail/story_detail_provider.dart';
import 'package:story_app/screen/detail/body_of_detail_screen.dart';
import 'package:story_app/static/story_detail_result_state.dart';


class DetailScreen extends StatefulWidget {
  final String storyId;
  const DetailScreen({super.key, required this.storyId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StoryDetailProvider>().fetchStoryDetail(widget.storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Story Detail")),
      body: Consumer<StoryDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            StoryDetailLoadingState() => Center(child: CircularProgressIndicator(),),
            StoryDetailLoadedState(data: var story) => BodyOfDetailScreen(story: story),
            StoryDetailErrorState(error: var message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      context
                          .read<StoryDetailProvider>()
                          .fetchStoryDetail(widget.storyId);
                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Coba Lagi', style: TextStyle(fontWeight: FontWeight.w600),),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
            _ => SizedBox(),
          };
        },
      ),
    );
  }
}
