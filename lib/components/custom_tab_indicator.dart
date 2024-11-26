// lib/components/custom_tab_indicator.dart
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final Color color;
  final double radius;
  final double horizontalPadding;

  const CustomTabIndicator({
    required this.color,
    this.radius = 30.0,
    this.horizontalPadding = 10.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(color, radius, horizontalPadding);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final Color color;
  final double radius;
  final double horizontalPadding;

  _CustomTabIndicatorPainter(this.color, this.radius, this.horizontalPadding);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double tabWidth = cfg.size!.width;
    final double tabHeight = cfg.size!.height;

    final double indicatorWidth = tabWidth + (2 * horizontalPadding);
    final double indicatorHeight = tabHeight * 0.65;

    final Offset indicatorOffset = Offset(
      offset.dx - horizontalPadding,
      (tabHeight - indicatorHeight) / 2,
    );

    final Rect rect = indicatorOffset & Size(indicatorWidth, indicatorHeight);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rRect, paint);
  }
}
