import 'package:flutter/material.dart';
import 'package:story_app/data/model/story.dart';

class BodyOfDetailScreen extends StatefulWidget {
  final Story story;
  const BodyOfDetailScreen({super.key, required this.story});

  @override
  State<BodyOfDetailScreen> createState() => _BodyOfDetailScreenState();
}

class _BodyOfDetailScreenState extends State<BodyOfDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: widget.story.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // Sudut membulat
                child: Image.network(
                  widget.story.photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox.square(dimension: 16),
          Text(
            widget.story.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox.square(dimension: 16),
          Text(
            widget.story.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
