import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game/decorations/lamp.dart';
import 'package:game/demon.dart';
import 'package:game/hero.dart';
import 'package:game/interface/player_interface.dart';

void main() {
  runApp(const MyApp());
}

final double tileSize = 16;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        directional: JoystickDirectional(
          color: Colors.white12,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.white12,
            margin: const EdgeInsets.all(60)
          )
        ]
      ),
      map: WorldMapByTiled(
        'mapa.json',
        objectsBuilder: {
          'demon': (properties) => Demon(properties.position),
          'lamp': (properties) => Lamp(properties.position),
        }
      ),
      player: GameHero(
          Vector2(19 * tileSize, 19 * tileSize)
      ),
      // overlayBuilderMap: {
      //   PlayerInterface.overlayKey: (context, game) => PlayerInterface(
      //       game: game
      //   )
      // },
      // initialActiveOverlays: const [
      //   PlayerInterface.overlayKey,
      // ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 2.5,
        smoothCameraEnabled: true,
        smoothCameraSpeed: 3,
        sizeMovementWindow: Vector2(tileSize * 2, tileSize * 2)
      ),
      lightingColorGame: Colors.black.withOpacity(0.2),
    );
  }
}