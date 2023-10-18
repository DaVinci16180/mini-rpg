import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:game/demon_sprite_sheet.dart';
import 'package:game/main.dart';

class Demon extends SimpleEnemy with ObjectCollision {
  Demon(Vector2 position) : super(
    position: position,
    size: Vector2(tileSize, tileSize),
    animation: SimpleDirectionAnimation(
      idleRight: DemonSpriteSheet.idleRight,
      idleLeft: DemonSpriteSheet.idleLeft,
      runRight: DemonSpriteSheet.runRight,
      runLeft: DemonSpriteSheet.runLeft,
    ),
    speed: tileSize * 2
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
  }

  bool canMove = true;
  
  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeAttack();
        },
        radiusVision: tileSize * 5,
        margin: 4
      );
    }
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

  void _executeAttack() {
    simpleAttackMelee(
      damage: 25,
      size: Vector2(tileSize, tileSize),
      sizePush: tileSize / 2,
      animationRight: DemonSpriteSheet.attackRight,
      interval: 500,
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        DemonSpriteSheet.damageLeft,
        runToTheEnd: true,
        onFinish: () {
            canMove = true;
        }
      );
    } else {
      animation?.playOnce(
        DemonSpriteSheet.damageRight,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        }
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
          DemonSpriteSheet.dieLeft,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }
      );
    } else {
      animation?.playOnce(
          DemonSpriteSheet.dieRight,
          runToTheEnd: true,
          onFinish: () {
            removeFromParent();
          }
      );
    }
    super.die();
  }
}