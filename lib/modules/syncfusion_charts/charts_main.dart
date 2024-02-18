import 'package:flutter/material.dart';
import 'stocks_chart.dart';
import 'line_chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stocks Chart App',
      // home: Scaffold()
      home: StocksChartPage(),
      // home: LineChart(),
    );
  }
}
