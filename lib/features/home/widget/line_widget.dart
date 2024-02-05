import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  final List<double> points;

  const LineWidget({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 40),
      painter: LinePainter(points),
    );
  }
}

class LinePainter extends CustomPainter {
  final List<double> points;

  LinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    // Нормализуем значения точек для максимальной высоты 50
    List<double> normalizedPoints = normalizePoints(points, size.height);

    // Начальная точка
    Offset startPoint = Offset(0, normalizedPoints[0]);

    // Рисуем линии от каждой точки к следующей
    for (int i = 1; i < normalizedPoints.length; i++) {
      Offset endPoint = Offset((size.width / (normalizedPoints.length - 1)) * i,
          normalizedPoints[i]);
      canvas.drawLine(startPoint, endPoint, paint);
      startPoint = endPoint;
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.points != points;
  }

  // Функция для нормализации значений точек к диапазону от 0 до maxHeight
  List<double> normalizePoints(List<double> points, double maxHeight) {
    double maxPoint = points.reduce((curr, next) => curr > next ? curr : next);
    return points.map((point) => (point / maxPoint) * maxHeight).toList();
  }
}
