import 'package:chart/histogram/histogram_model.dart';
import 'package:chart/histogram/histogram_painter.dart';
import 'package:flutter/material.dart';

const double _dotIndicatorMargin = 20;

class Histogram extends StatefulWidget {
  final List<HistogramModel> models;
  final double barWidth;
  final double barMargin;
  final Color? barColor;
  final TextStyle? labelStyle;
  final int itemsPerPage;

  final double _histogramWidth;
  final double _histogramHeight;

  const Histogram(
    this.models, {
    this.itemsPerPage = 5,
    super.key,
    this.barWidth = 50.0,
    this.barMargin = 10.0,
    this.barColor,
    this.labelStyle,
    double? height,
  })  : _histogramWidth =
            (itemsPerPage * barWidth) + (itemsPerPage - 1) * barMargin + 20.0,
        _histogramHeight = height ?? 200;

  @override
  State<Histogram> createState() => _PaginatedHistogramState();
}

class _PaginatedHistogramState extends State<Histogram> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int totalPages = (widget.models.length / widget.itemsPerPage).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(
            widget._histogramWidth,
            widget._histogramHeight,
          ),
          painter: HistogramPainter(
            models: widget.models.sublist(
              currentPage * widget.itemsPerPage,
              (currentPage + 1) * widget.itemsPerPage < widget.models.length
                  ? (currentPage + 1) * widget.itemsPerPage
                  : widget.models.length,
            ),
            barWidth: widget.barWidth,
            barMargin: widget.barMargin,
            barColor: widget.barColor,
            labelStyle: widget.labelStyle,
          ),
        ),
        // add the dot indicator only if the models size does not
        // match with the itemsforpage
        if (widget.itemsPerPage != widget.models.length)
          Padding(
            padding: const EdgeInsets.only(top: _dotIndicatorMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < totalPages; i++)
                  IconButton(
                    icon: Icon(i == currentPage
                        ? Icons.radio_button_on
                        : Icons.radio_button_off),
                    onPressed: () => setState(() => currentPage = i),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
