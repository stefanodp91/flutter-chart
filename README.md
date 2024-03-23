# flutter-charts

Sample app to demostrate how to create charts with Flutter without using external plugins.

## Histogram

<img src="https://raw.githubusercontent.com/stefanodp91/flutter-chart/master/raw/sample.gif" alt="Record screen of how to use a histogram char" width="200" height="400">


Create a list of HistogramModel 

```
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
```

Create an Histogram widget 

```
 @override
  Widget build(BuildContext context) { 
    return const Center(
      child: Histogram(models),
    );
  }
```

### Customizations Started

| customization  | type  | default  | note  |
|---|---|---|---|
| barWidth  | double  | 50.0  | Width of histogram's bar |
| barMargin | double  | 10.0  | Space between histogram's bars  |
| barColor  | Color?  | Colors.blue | Color of histogram's bar  |
| labelStyle | TextStyle?  | null | Style for the label below histogram's bars  |
| itemsPerPage | int  | 5 | Number of histogram's bar per page; If the itemsPerPage is different from models count, a dot indicator appears. |

Usage:

```
 @override
  Widget build(BuildContext context) { 
    return const Center(
      child: Histogram(
        models,
        barWidth: 100,
        barMargin: 20,
        barColor: Colors.red,
        labelStyle: TextStyle(color: Colors.black),
        itemsPerPage: 2,
      ),
    );
  }
```
