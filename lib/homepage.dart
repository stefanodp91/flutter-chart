import 'package:chart/histogram/histogram_model.dart';
import 'package:chart/histogram/histrogram.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // const Color barColor = Colors.red;
    const TextStyle labeStyle = TextStyle(color: Colors.black);
    const List<HistogramModel> models = [
      HistogramModel(1.5, label: 'nov'),
      HistogramModel(2.7, label: 'dec'),
      HistogramModel(0.4, label: 'jan'),
      HistogramModel(0.95, label: 'feb'),
      HistogramModel(12.2, label: 'mar'),
      HistogramModel(15.1, label: 'apr'),
      HistogramModel(9.2, label: 'may'),
      HistogramModel(2.12, label: 'jun'),
      HistogramModel(-12.2, label: 'jul'),
      HistogramModel(2.2, label: 'aug'),
      HistogramModel(6.74, label: 'sep'),
      HistogramModel(5.5, label: 'oct'),
    ];

    return const Center(
      child: Histogram(
        models,
        labelStyle: labeStyle,
      ),
    );
  }
}
