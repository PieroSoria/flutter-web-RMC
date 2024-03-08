import 'package:flutter/material.dart';

class ImagenSection extends StatefulWidget {
  final String imagenurl;
  final double width;
  final double height;
  const ImagenSection(
      {super.key,
      required this.imagenurl,
      required this.width,
      required this.height});

  @override
  State<ImagenSection> createState() => _ImagenSectionState();
}

class _ImagenSectionState extends State<ImagenSection> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        widget.imagenurl,
        fit: BoxFit.fill,
        width: widget.width,
        height: widget.height,
        repeat: ImageRepeat.noRepeat,
      ),
    );
  }
}
