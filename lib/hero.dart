import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/player_sprite_sheet.dart';
import 'package:game/main.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting {
  GameHero(Vector2 position) : super(
    size: Vector2(tileSize, tileSize),
    position: position,
    animation: SimpleDirectionAnimation(
      idleRight: PlayerSpriteSheet.idleRight,
      idleLeft: PlayerSpriteSheet.idleLeft,
      runRight: PlayerSpriteSheet.runRight,
      runLeft: PlayerSpriteSheet.runLeft,
    ),
    speed: tileSize * 4
  ) {
    setupCollision(
      CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
                size: Vector2(tileSize/2, tileSize/2 - 2),
                align: Vector2(tileSize/4, tileSize/2 + 2)
            )
          ],
      )
    );

    setupLighting(
        LightingConfig(
          radius: tileSize * 2,
          color: Colors.transparent,
          withPulse: true,
        )
    );
  }

  bool canMove = true;

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      align: Offset(0, -0.5 * tileSize),
      height: 2
    );
    super.render(canvas);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && (event.id == 1 || event.id == LogicalKeyboardKey.space)) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 25,
      size: Vector2(tileSize, tileSize),
      sizePush: tileSize / 2,
      animationRight: PlayerSpriteSheet.attackRight
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
          PlayerSpriteSheet.damageLeft,
          runToTheEnd: true,
          onFinish: () {
          }
      );
    } else {
      animation?.playOnce(
          PlayerSpriteSheet.damageRight,
          runToTheEnd: true,
          onFinish: () {
          }
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
          PlayerSpriteSheet.dieLeft,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }
      );
    } else {
      animation?.playOnce(
          PlayerSpriteSheet.dieRight,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }
      );
    }
    super.die();
  }
}