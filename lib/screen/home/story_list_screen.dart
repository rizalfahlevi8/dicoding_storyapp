import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/provider/auth/auth_provider.dart';
import 'package:story_app/provider/home/story_list_provider.dart';
import 'package:story_app/routes/page_manager.dart';
import 'package:story_app/screen/home/story_card_widget.dart';
import 'package:story_app/static/story_list_result_state.dart';

class StoryListScreen extends StatefulWidget {
  final Function(String) onTapped;
  final Function() toFormScreen;
  final Function() onLogout;

  const StoryListScreen({
    super.key,
    required this.onTapped,
    required this.toFormScreen,
    required this.onLogout,
  });

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StoryListProvider>().fetchStoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authWatch = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Story App"),
        actions: [
          IconButton(
            onPressed: () async {
              final scaffoldMessengerState = ScaffoldMessenger.of(context);
              widget.toFormScreen();
              final dataString =
                  await context.read<PageManager<String>>().waitForResult();
              scaffoldMessengerState.showSnackBar(
                SnackBar(content: Text("$dataString"), backgroundColor: Colors.green,),
              );

              context.read<StoryListProvider>().fetchStoryList();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<StoryListProvider>(
              builder: (context, value, child) {
                return switch (value.resultState) {
                  StoryListLoadingState() => Center(
                    child: CircularProgressIndicator(),
                  ),
                  StoryListResultLoadedState(data: var storyList) =>
                    ListView.builder(
                      itemCount: storyList.length,
                      itemBuilder: (context, index) {
                        final story = storyList[index];

                        return StoryCardWidget(
                          story: story,
                          onTap: () => widget.onTapped(story.id),
                        );
                      },
                    ),
                  StoryListErrorState(error: var message) => Center(
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
                            context.read<StoryListProvider>().fetchStoryList();
                          },
                          icon: Icon(Icons.refresh),
                          label: Text(
                            'Coba Lagi',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _ => SizedBox(),
                };
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final authRead = context.read<AuthProvider>();
          final result = await authRead.logout();
          if (result) widget.onLogout();
        },
        tooltip: "Logout",
        child:
            authWatch.isLoadingLogout
                ? const CircularProgressIndicator(color: Colors.white)
                : const Icon(Icons.logout),
      ),
    );
  }
}
