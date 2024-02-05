// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({
    Key? key,
    required this.data,
    required this.maxValue,
  }) : super(key: key);
  final List<double> data;
  final double maxValue;
  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    const Color.fromARGB(161, 27, 202, 94),
    const Color.fromARGB(161, 27, 202, 94),
  ];

  bool showAvg = false;
  late final double maxY;
  @override
  void initState() {
    final sorted = widget.data
      ..sort(
        (a, b) => a.compareTo(b),
      );
    maxY = sorted.last * 1.1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        5,
                        (index) => Text(
                              index == 4
                                  ? "0"
                                  : "${(100000 ~/ (index + 1)).toInt()}",
                              style: const TextStyle(color: Colors.white),
                            )),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "No Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Text(
            "Theres currently no data available, once you\nstart receiving notifications they will appear\n here.",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.3,
              color: AppColors.darkBlue,
            ),
          ).paddingOnly(t: 6),
          const Spacer(),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: widget.data.length * 1,
      minY: 0,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(widget.data.length, (index) {
            final info = widget.data[index];
            return FlSpot(index * 1, info);
          }),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
