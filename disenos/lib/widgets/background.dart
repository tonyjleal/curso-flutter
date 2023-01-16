import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
        .2,
        .8
      ],
          colors: [
        Color(0xff2E305F),
        Color(0xff202333),
      ]));

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: boxDecoration,
      ),
      const Positioned(top: -100, left: -30, child: _PinkBox())
    ]);
  }
}

class _PinkBox extends StatefulWidget {
  const _PinkBox({super.key});

  @override
  State<_PinkBox> createState() => __PinkBoxState();
}

class __PinkBoxState extends State<_PinkBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 90, 188, 1),
              Color.fromRGBO(251, 142, 172, 1),
            ]),
            borderRadius: BorderRadius.circular(80)),
      ),
    );
  }
}
