
import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {
  final String text;
  const ContentText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = text;
    final paragraphs = content.split("\n");
    const style = TextStyle(
      fontSize: 16,
      height: 1.5,
      decoration: TextDecoration.none,
    );
    final indentedParagraphs = paragraphs.map((p) => "        " + p + "\n").join("\n");
    return Text(indentedParagraphs, style: style);
  }
}


