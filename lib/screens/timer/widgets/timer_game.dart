import 'package:bezier/bezier.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:my_daily_exercise/utils/random_utils.dart';
import "package:vector_math/vector_math.dart" as vecMath;

const sandRadius = 0.25;

class TimerGame extends Forge2DGame {
  TimerGame()
      : super(
          gravity: Vector2(0, 5.0),
          world: TimerWorld(),
        );
}

class TimerWorld extends Forge2DWorld with HasGameReference<TimerGame> {
  final sands = <Sand>[];
  final parts = <Part>[];

  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugMode = true;

    final boundaries = createBoundaries();
    addAll(boundaries);

    final worldSize = game.screenToWorld(game.size);

    const gap = sandRadius * 1.5;
    final topLeftCurve = CubicBezier([
      vecMath.Vector2(-worldSize.x, -worldSize.y),
      vecMath.Vector2(-worldSize.x * 0.2, -worldSize.y),
      vecMath.Vector2(-worldSize.x * 0.8, -worldSize.y * 0.2),
      vecMath.Vector2(0 - gap, 0),
    ]);
    final topRightCurve = CubicBezier([
      vecMath.Vector2(worldSize.x, -worldSize.y),
      vecMath.Vector2(worldSize.x * 0.2, -worldSize.y),
      vecMath.Vector2(worldSize.x * 0.8, -worldSize.y * 0.2),
      vecMath.Vector2(0 + gap, 0),
    ]);
    final bottomLeftCurve = CubicBezier([
      vecMath.Vector2(-worldSize.x, worldSize.y),
      vecMath.Vector2(-worldSize.x * 0.2, worldSize.y),
      vecMath.Vector2(-worldSize.x * 0.8, worldSize.y * 0.2),
      vecMath.Vector2(0 - gap, 0),
    ]);
    final bottomRightCurve = CubicBezier([
      vecMath.Vector2(worldSize.x, worldSize.y),
      vecMath.Vector2(worldSize.x * 0.2, worldSize.y),
      vecMath.Vector2(worldSize.x * 0.8, worldSize.y * 0.2),
      vecMath.Vector2(0 + gap, 0),
    ]);

    final curves = <CubicBezier>[
      topLeftCurve,
      topRightCurve,
      bottomLeftCurve,
      bottomRightCurve,
    ];
    final verticesGroup = <List<vecMath.Vector2>>[];
    for (final curve in curves) {
      final vertices = <vecMath.Vector2>[];

      for (var t = 0.0; t <= 1; t += 0.01) {
        final point = curve.pointAt(t);
        vertices.add(point);

        if (vertices.length >= maxPolygonVertices) {
          verticesGroup.add([...vertices]);
          vertices.clear();
          vertices.add(point);
        }
      }

      if (vertices.isNotEmpty) {
        var t = 1 - 0.015;
        while (vertices.length <= 3) {
          final point = curve.pointAt(t);
          vertices.add(point);
          t -= 0.015;
        }
        verticesGroup.add([...vertices]);
      }
    }

    for (var i = 0; i < verticesGroup.length; i++) {
      final group = verticesGroup[i];
      final vertices = group.map((e) => Vector2(e.x, e.y)).toList();

      final part = Part(vertices: vertices);
      add(part);
      parts.add(part);
    }

    for (var i = 0; i < 300; i++) {
      final position = Vector2(
        randomDouble(-0.25, 0.25) * worldSize.x,
        randomDouble(-1, -0.5) * worldSize.y,
      );
      final sand = Sand(position);
      add(sand);
      sands.add(sand);
    }
  }

  List<Wall> createBoundaries() {
    final walls = <Wall>[];
    final worldSize = game.screenToWorld(game.size);

    final w = worldSize.x * 2;
    final h = worldSize.y * 2;

    final top = Wall(
      Vector2(-w / 2, -h / 2),
      Vector2(w / 2, -h / 2),
    );
    final bottom = Wall(
      Vector2(-w / 2, h / 2),
      Vector2(w / 2, h / 2),
    );
    final left = Wall(
      Vector2(-w / 2, -h / 2),
      Vector2(-w / 2, h / 2),
    );
    final right = Wall(
      Vector2(w / 2, -h / 2),
      Vector2(w / 2, h / 2),
    );

    walls.addAll([top, bottom, left, right]);
    return walls;
  }
}

class Wall extends BodyComponent {
  final Vector2 start;
  final Vector2 end;

  Wall(
    this.start,
    this.end,
  );

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsEdge(start, end);
    final fixtureDef = FixtureDef(shape);

    final bodyDef = BodyDef();
    final body = world.createBody(bodyDef);

    return body..createFixture(fixtureDef);
  }
}

class Part extends BodyComponent {
  Part({
    required this.vertices,
  });

  final List<Vector2> vertices;

  @override
  Body createBody() {
    final shape = PolygonShape()..set(vertices);
    final fixtureDef = FixtureDef(shape);

    final bodyDef = BodyDef();
    final body = world.createBody(bodyDef);

    return body..createFixture(fixtureDef);
  }
}

class Sand extends BodyComponent {
  Sand(
    this._position, {
    this.color,
  });

  Color? color;

  final Vector2 _position;

  @override
  Body createBody() {
    color ??= Colors.primaries[randomInt(0, Colors.primaries.length)];

    final shape = CircleShape()..radius = sandRadius;
    final fixtureDef = FixtureDef(
      shape,
      density: 25.0,
      restitution: 0.5,
      friction: 0,
    );

    final bodyDef = BodyDef(type: BodyType.dynamic, position: _position);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  void down() {
    final force = Vector2(randomDouble(-100, 100), randomDouble(-100, 100));
    body.applyLinearImpulse(force);
  }
}
