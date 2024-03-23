import 'dart:math';

import 'package:chart/histogram/histogram_bar.dart';
import 'package:chart/histogram/histogram_model.dart';
import 'package:flutter/material.dart';

class HistogramPainter extends CustomPainter {
  final List<HistogramModel> models;
  final double barWidth;
  final double barMargin;
  final Color? barColor;
  final TextStyle? labelStyle;

  const HistogramPainter({
    required this.models,
    required this.barWidth,
    required this.barMargin,
    this.barColor,
    this.labelStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    List<double> data = models.map((e) => e.value).toList();
    List<String?> labels = models.map((e) => e.label).toList();

    double maxData = data.reduce(max);

    for (int i = 0; i < data.length; i++) {
      double barHeight = data[i] / maxData * size.height;

      // calculate bar starting position considering margins
      double startingPosition = (i * (barWidth + barMargin)) + 10.0;

      HistogramBar histogramBar = HistogramBar(
        barSize: Size(barWidth, barHeight),
        barX: startingPosition,
        label: labels[i],
        barColor: barColor,
        labelStyle: labelStyle,
      );

      histogramBar.paint(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
