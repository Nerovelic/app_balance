import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimationCustom extends PageRouteBuilder {
  final Widget paginas;
  final Duration duracion;
  final Alignment posicion;

  AnimationCustom({
    required this.paginas, 
    this.duracion = const Duration(milliseconds: 500),
    this.posicion = const Alignment(0, 0),
  }) : super(
      transitionDuration: duracion,
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child
        ){
          return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secAnimation,
          child: child,
          );
        },
          pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation
    ) => paginas,
  );
}
