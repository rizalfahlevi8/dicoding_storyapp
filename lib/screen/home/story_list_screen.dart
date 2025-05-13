import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/static/common.dart';
import 'package:story_app/provider/auth/auth_provider.dart';
import 'package:story_app/provider/home/story_list_provider.dart';
import 'package:story_app/routes/page_manager.dart';
import 'package:story_app/screen/components/flag_icon_widget.dart';
import 'package:story_app/screen/components/loader_widget.dart';
import 'package:story_app/screen/components/story_card_widget.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final apiProvider = context.read<StoryListProvider>();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (apiProvider.pageItems != null) {
          apiProvider.fetchStoryList();
        }
      }
    });

    Future.microtask(() async => apiProvider.fetchStoryList());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final authWatch = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeTitle),
        actions: [
          FlagIconWidget(),
          IconButton(
            onPressed: () async {
              final scaffoldMessengerState = ScaffoldMessenger.of(context);
              widget.toFormScreen();
              final dataString =
                  await context.read<PageManager<String>>().waitForResult();
              context.read<StoryListProvider>().fetchStoryList(reset: true);
              scaffoldMessengerState.showSnackBar(
                SnackBar(
                  content: Text("$dataString"),
                  backgroundColor: Colors.green,
                ),
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
                    child: LoaderWidget(),
                  ),
                  StoryListResultLoadedState(data: var storyList) =>
                    ListView.builder(
                      controller: scrollController,
                      itemCount:
                          storyList.length + (value.pageItems != null ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == storyList.length &&
                            value.pageItems != null) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
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
                            AppLocalizations.of(context)!.retryButton,
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
        child:
            authWatch.isLoadingLogout
                ? const CircularProgressIndicator(color: Colors.white)
                : const Icon(Icons.logout),
      ),
    );
  }
}
