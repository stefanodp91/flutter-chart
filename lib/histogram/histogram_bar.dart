import 'package:flutter/material.dart';

const double _defaultBarX = 10;
const double _labelXFactor = 0.33;
const Color _defaultBarColor = Colors.blue;

class HistogramBar {
  HistogramBar({
    required this.barSize,
    this.barX,
    this.label,
    this.barColor,
    this.labelStyle,
  });

  final Size barSize;
  final double? barX;
  final String? label;
  final Color? barColor;
  final TextStyle? labelStyle;

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = barColor ?? _defaultBarColor;

    Rect barRect = Rect.fromLTWH(
      barX ?? _defaultBarX,
      size.height - barSize.height,
      barSize.width,
      barSize.height,
    );
    canvas.drawRect(barRect, paint);

    // draw labels below bars
    if (label?.isNotEmpty == true) {
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: labelStyle,
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: barSize.width);

      // centering label
      double startingPoint = barX ?? _defaultBarX;
      double offset = startingPoint + (barSize.width * _labelXFactor);
      textPainter.paint(canvas, Offset(offset, size.height));
    }
  }
}
