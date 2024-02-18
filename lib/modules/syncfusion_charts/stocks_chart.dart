/// Package imports
import 'dart:developer';

import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

///Renders histogram chart sample
class StocksChartPage extends StatefulWidget {
  /// Creates waterfall chart
  const StocksChartPage({super.key});

  @override
  State<StocksChartPage> createState() => _StocksChartPageState();
}

class _StocksChartPageState extends State<StocksChartPage> {
  _StocksChartPageState();
  List<_ChartSampleData>? chartData;
  TooltipBehavior? _tooltipBehavior;
  CrosshairBehavior? _crosshairBehavior;
  ZoomPanBehavior? _zoomPanBehavior;
  GlobalKey chartKey = GlobalKey();

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: '');
    _crosshairBehavior = CrosshairBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        lineDashArray: List<double>.filled(10, 10),
        shouldAlwaysShow: false,
        hideDelay: 3000);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      enableSelectionZooming: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: size.height * 0.6,
            child: _buildDefaultWaterfallChart(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeZoomPostion,
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }

  /// Get the cartesian chart with histogram series
  SfCartesianChart _buildDefaultWaterfallChart() {
    return SfCartesianChart(
      key: chartKey,
      title: const ChartTitle(text: 'Company revenue and profit'),
      primaryXAxis: const DateTimeAxis(
        autoScrollingDelta: 5,
        autoScrollingMode: AutoScrollingMode.start,
        autoScrollingDeltaType: DateTimeIntervalType.years,
        interval: 01,
        intervalType: DateTimeIntervalType.years,
        enableAutoIntervalOnZooming: true,
      ),
      primaryYAxis: NumericAxis(
        name: 'Expenditure',
        minimum: 0,
        maximum: 5000,
        interval: 1000,
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel('${details.value ~/ 1000}B', null);
        },
      ),
      series: _getWaterFallSeries(),
      tooltipBehavior: _tooltipBehavior,
      zoomPanBehavior: _zoomPanBehavior,

      onZooming: (ZoomPanArgs args) {
        // print(args.axis);
        // print(args.currentZoomFactor);
        log("position ${args.currentZoomPosition} ");
        args.currentZoomPosition = 0.5;
      },
      onTooltipRender: (TooltipArgs args) {
        args.text =
            '${args.dataPoints![args.pointIndex!.toInt()].x} : ${args.dataPoints![args.pointIndex!.toInt()].y / 1000}B';
      },
      crosshairBehavior: _crosshairBehavior,
      onDataLabelRender: (DataLabelRenderArgs dataLabelArgs) {
        if (dataLabelArgs.pointIndex == 0) {
          dataLabelArgs.text = '4.7B';
        } else if (dataLabelArgs.pointIndex == 1) {
          dataLabelArgs.text = '-1.1B';
        } else if (dataLabelArgs.pointIndex == 2) {
          dataLabelArgs.text = '-0.7B';
        } else if (dataLabelArgs.pointIndex == 3) {
          dataLabelArgs.text = '1.2B';
        } else if (dataLabelArgs.pointIndex == 4) {
          dataLabelArgs.text = '4.1B';
        } else if (dataLabelArgs.pointIndex == 5) {
          dataLabelArgs.text = '-0.4B';
        } else if (dataLabelArgs.pointIndex == 6) {
          dataLabelArgs.text = '-0.8B';
        } else if (dataLabelArgs.pointIndex == 7) {
          dataLabelArgs.text = '2.9B';
        }
      },

      // onActualRangeChanged: (ActualRangeChangedArgs args) {
      //   log("actual min: ${args.actualMin}");
      //   log("actual max: ${args.actualMax}");
      //   log("actual interval: ${args.actualInterval}");
      // },
    );
  }

  ///Get the histogram series
  List<WaterfallSeries<_ChartSampleData, dynamic>> _getWaterFallSeries() {
    return <WaterfallSeries<_ChartSampleData, dynamic>>[
      WaterfallSeries<_ChartSampleData, dynamic>(
        dataSource: <_ChartSampleData>[
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 1)),
            y: 4700,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 2)),
            y: -1100,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 3)),
            y: -700,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 4)),
            y: 1200,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 5)),
            y: -400,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 6)),
            y: -800,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 7)),
            y: -700,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 8)),
            y: 1200,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 9)),
            y: -400,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 10)),
            y: -800,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 11)),
            y: -700,
          ),
          _ChartSampleData(
            x: DateTime.now().add(Duration(days: 12)),
            y: 1200,
          ),
        ],
        xValueMapper: (_ChartSampleData sales, _) => sales.x,
        yValueMapper: (_ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.middle,
        ),
        color: const Color.fromRGBO(0, 189, 174, 1),
        negativePointsColor: const Color.fromRGBO(229, 101, 144, 1),
      )
    ];
  }

  void changeZoomPostion() {
    setState(() {
      _zoomPanBehavior!.zoomToSingleAxis(
        const DateTimeAxis(),
        1,
        1,
      );
    });
  }
}

class _ChartSampleData {
  _ChartSampleData({
    this.x,
    this.y,
  });

  final DateTime? x;
  final num? y;
}
