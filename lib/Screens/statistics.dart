import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsScreen extends StatelessWidget {
  final List<PieChartSectionData> _chartData = [
    PieChartSectionData(
      color: Colors.deepOrangeAccent,
      value: 40,
      title: 'Food',
      radius: 60,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Colors.pink[300],
      value: 20,
      title: 'Extra',
      radius: 60,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Colors.teal[300],
      value: 30,
      title: 'Savings',
      radius: 60,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Colors.purple[300],
      value: 10,
      title: 'Travel',
      radius: 60,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Container(
        color: Colors.blue[100],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Financial Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: _chartData,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 2,
                  centerSpaceRadius: 80,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Breakdown of total spendings',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
