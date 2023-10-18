import 'dart:async';

import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async' as async;

import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {

  static const overlayKey = 'playerInterface';

  final BonfireGame game;
  const PlayerInterface({ Key? key, required this.game }) : super(key: key);

  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {

  double life = 0;

  final double widthMax = 100;
  double widthCurrent = 100;

  late async.Timer _lifetime;
  @override
  void initState() {
    _lifetime = async.Timer.periodic(const Duration(milliseconds: 100), _verifyLife);
    super.initState();
  }

  @override
  void dispose() {
    _lifetime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
        child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Stack(
            children: [
              Container(
                width: widthCurrent,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
              ),
              Container(
                width: widthMax,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
              )
            ]
        )
      ]
    ));
  }

  void _verifyLife(async.Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = widget.game.player?.life ?? 0;

        final percent = life / (widget.game.player?.life ?? 0);
        widthCurrent = widthMax * percent;
      });
    }
  }
}

