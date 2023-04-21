import 'package:flutter/material.dart';

class AutoFontSizer extends StatefulWidget {
  final String text;
  final double maxWidth;

  const AutoFontSizer({required this.text, required this.maxWidth});

  @override
  _AutoFontSizerState createState() => _AutoFontSizerState();
}

class _AutoFontSizerState extends State<AutoFontSizer> {
  late double _fontSize;

  @override
  void initState() {
    super.initState();

    // Calculate the font size that would fit the text within the maxWidth
    _fontSize = calculateFontSize();
  }

  double calculateFontSize() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: const TextStyle(fontSize: 100), // Start with a large font size
      ),
      textDirection: TextDirection.ltr,
    )..layout(); // Required before accessing textPainter.width

    var fontSize = 100.0;
    while (textPainter.width > widget.maxWidth) {
      fontSize -= 1.0;
      textPainter.text = TextSpan(
        text: widget.text,
        style: TextStyle(fontSize: fontSize),
      );
      textPainter.layout(); // Required before accessing textPainter.width
    }

    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(fontSize: _fontSize),
    );
  }
}
