import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'timer_game.dart';

class HourGlass extends StatefulWidget {
  const HourGlass({super.key});

  @override
  State<HourGlass> createState() => _HourGlassState();
}

class _HourGlassState extends State<HourGlass>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final TimerGame _game;

  @override
  void initState() {
    super.initState();
    _game = TimerGame();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          foregroundPainter: HourGlassPainter(
            game: _game,
            parts: (_game.world as TimerWorld).parts,
          ),
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.0,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: GameWidget(game: _game),
                  ),
                ),
                for (final sand in (_game.world as TimerWorld).sands)
                  Positioned(
                    left: _game.worldToScreen(sand.position).x,
                    top: _game.worldToScreen(sand.position).y,
                    child: InkWell(
                      onTap: () => sand.down(),
                      child: Container(
                        width: sandRadius * 15,
                        height: sandRadius * 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: sand.color,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HourGlassPainter extends CustomPainter {
  final List<Part> parts;
  final TimerGame game;

  HourGlassPainter({
    required this.game,
    required this.parts,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black38
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (final part in parts) {
      final path = Path();

      final point1 = game.worldToScreen(part.vertices.first);
      path.moveTo(point1.x, point1.y);

      for (final point in part.vertices) {
        final vertex = game.worldToScreen(point);
        path.lineTo(vertex.x, vertex.y);
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
