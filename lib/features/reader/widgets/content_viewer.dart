import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/models/content.dart';

class ContentViewer extends StatelessWidget {
  final Content content;
  final double fontSize;
  final double lineHeight;
  final double letterSpacing;
  final double padding;
  final bool nightMode;
  final bool loadImages;

  const ContentViewer({
    super.key,
    required this.content,
    this.fontSize = 18.0,
    this.lineHeight = 28.0,
    this.letterSpacing = 0.0,
    this.padding = 16.0,
    this.nightMode = false,
    this.loadImages = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (content.type) {
      case ContentType.text:
        return _buildText();
      case ContentType.image:
        return _buildImage();
    }
  }

  Widget _buildText() {
    final textColor = nightMode ? Colors.grey[300]! : Colors.black87;

    final text = Text(
      content.data,
      style: TextStyle(
        fontSize: fontSize,
        height: lineHeight / fontSize,
        letterSpacing: letterSpacing,
        color: textColor,
      ),
    );

    if (content.isChapterTitle) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: 16,
        ),
        child: Text(
          content.data,
          style: TextStyle(
            fontSize: fontSize + 4,
            fontWeight: FontWeight.bold,
            height: lineHeight / fontSize,
            letterSpacing: letterSpacing,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: 4,
      ),
      child: text,
    );
  }

  Widget _buildImage() {
    if (!loadImages) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: content.data,
          placeholder: (context, url) => const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.grey),
            ),
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
