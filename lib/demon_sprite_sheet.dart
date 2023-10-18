import 'package:bonfire/bonfire.dart';

class DemonSpriteSheet {

  // Idle ==============================================================

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(96, 0),
    ),
  );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 0),
    ),
  );

  // Run ===============================================================

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(96, 48),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 48),
    ),
  );

  // Damage ============================================================

  static Future<SpriteAnimation> get damageLeft => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.08,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(96, 96),
    ),
  );

  static Future<SpriteAnimation> get damageRight => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.08,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 96),
    ),
  );

  // Attack ============================================================

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
    'attack_effect_right.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2(16, 16),
    ),
  );

  // Die ===============================================================

  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.25,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 120),
    ),
  );

  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
    'demon_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.25,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(96, 120),
    ),
  );
}