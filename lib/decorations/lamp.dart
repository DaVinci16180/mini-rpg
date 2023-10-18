import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game/main.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position) : super(
    position: position,
    size: Vector2(16, 16),
  ) {
    setupLighting(
      LightingConfig(
        radius: tileSize * 1.5,
        color: Colors.orange.withOpacity(0.3),
      )
    );
  }
}