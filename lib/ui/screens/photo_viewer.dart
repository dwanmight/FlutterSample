import 'package:flutter/material.dart';

class PhotoViewer extends StatefulWidget {
  final String path;

  PhotoViewer(this.path);

  @override
  State<StatefulWidget> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.network("${widget.path}_b.jpg"),
      ),
    );
  }
}