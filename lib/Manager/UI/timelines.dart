import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';
import '../../exports/export_manager.dart';

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderNetworkDetails>(
      context,
    );

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Expanded(
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              connectorTheme: ConnectorThemeData(
                space: 20.0,
                thickness: 5.0,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemExtentBuilder: (_, __) => 25.w,
              // MediaQuery.of(context).size.width / processes.length,
              oppositeContentsBuilder: (context, index) {
                return MyPadding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Image.asset(
                    'assets/process_timeline/status${index + 1}.png',
                    width: 50.0,
                    color: getColor(index, provider),
                  ),
                );
              },

              contentsBuilder: (context, index) {
                return MyPadding(
                  padding: EdgeInsets.only(
                    top: 12.0.sp,
                  ),
                  child: ts(
                    processes[index],
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      color: getColor(index, provider),
                    ),
                  ),
                );
              },
              indicatorBuilder: (_, index) {
                var color;
                var child;
                if (index == provider.processIndex) {
                  color = inProgressColor;
                  child = MyPadding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: StyleWidget.white,
                        ),
                      ));
                } else if (index < provider.processIndex) {
                  color = completeColor;
                  child = Icon(
                    Icons.check,
                    color: StyleWidget.white,
                    size: 15.0,
                  );
                } else {
                  color = todoColor;
                }

                if (index <= provider.processIndex) {
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(30.0, 30.0),
                        painter: _BezierPainter(
                          color: color,
                          drawStart: index > 0,
                          drawEnd: index < provider.processIndex,
                        ),
                      ),
                      DotIndicator(
                        size: 30.0,
                        color: color,
                        child: child,
                      ),
                    ],
                  );
                } else {
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(15.0, 15.0),
                        painter: _BezierPainter(
                          color: color,
                          drawEnd: index < processes.length - 1,
                        ),
                      ),
                      OutlinedDotIndicator(
                        borderWidth: 4.0,
                        color: color,
                      ),
                    ],
                  );
                }
              },
              connectorBuilder: (_, index, type) {
                if (index > 0) {
                  if (index == provider.processIndex) {
                    final prevColor = getColor(index - 1, provider);
                    final color = getColor(index, provider);
                    List<Color> gradientColors;
                    if (type == ConnectorType.start) {
                      gradientColors = [
                        Color.lerp(prevColor, color, 0.5)!,
                        color
                      ];
                    } else {
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)!
                      ];
                    }
                    return DecoratedLineConnector(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                      ),
                    );
                  } else {
                    return SolidLineConnector(
                      color: getColor(index, provider),
                    );
                  }
                } else {
                  return null;
                }
              },
              itemCount: processes.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final processes = [
  'موقع الشبكة',
  'مناطق التغطية',
  'تفاصيل الباقات',
  'العمولات',
  // 'Prospect',
  // 'Tour',
  // 'Offer',
  // 'Contract',
  // 'Settled',
];
const kTileHeight = 50.0;
// int processIndex = 0;
const completeColor = Color(0xFF318AFF);
const inProgressColor = Color(0xFF04A030);
const todoColor = Color(0xFF7F818D);
// final inProgressColor = HexColor('#41bb92');
Color getColor(
  int index,
  provider,
) {
  if (index == provider.processIndex) {
    return inProgressColor;
  } else if (index < provider.processIndex) {
    return completeColor;
  } else {
    return todoColor;
  }
}
