import 'package:flutter/material.dart';
import 'package:story_app/static/common.dart';
import 'package:story_app/data/model/story.dart';
import 'package:story_app/screen/components/maps_widget.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: widget.story.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24), 
                child: Image.network(
                  widget.story.photoUrl,
                  fit: BoxFit.cover,
                  height: 250, 
                  width: double.infinity, 
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.story.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Text(
            widget.story.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                  height: 1.5,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.locationTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
                  Text(
                    'Lat: ${widget.story.lat}, Lng: ${widget.story.lon}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
          const SizedBox(height: 8),
          if (widget.story.lat != null && widget.story.lon != null)
            MapsWidget(lat: widget.story.lat!, lon: widget.story.lon!)
          else
            Center(child: Text(AppLocalizations.of(context)!.locationNotFound, style: TextStyle(fontStyle: FontStyle.italic))),
        ],
      ),
    );
  }
}
