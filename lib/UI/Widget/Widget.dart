
import 'package:flutter/material.dart';

class SingleTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;

  SingleTextWidget({
    required this.text,
    required this.textColor,
    required this.textSize,
    required this.textWeight,
  });

  @override
  Widget build(BuildContext context) {
    // Kiểm tra giá trị null cho các tham số required
    assert(text != null);
    assert(textColor != null);
    assert(textSize != null);
    assert(textWeight != null);

    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: textSize, fontWeight: textWeight),
    );
  }
}