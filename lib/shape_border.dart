import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyShapeBorder extends ShapeBorder {

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    final Size size = rect.size;
    final topGap = rect.top;
    // from left :0.06372046
    // from right :0.9156087
    // total : 0.14811176

    // left: 0.85188824
    // remained : 0.89546527

    double widthPercent = 0.8653657;
    double heightPercent = 0.04301471;


    int numberOfPeaks = 16;


    print('WIDTH: ${size.width} Peaks: $numberOfPeaks');

    final Path path = Path();

    /// From top right to left <-
    path.moveTo(size.width * 0.9362788, size.height*0.05588235 + topGap);

    path.cubicTo(size.width * 0.9156087, size.height * 0.05588235 + topGap, size.width * 0.8999517, size.height * 0.04666471 + topGap, size.width * 0.8999517, size.height * 0.03529412 + topGap,);
    path.lineTo(size.width * 0.8871535, size.height * 0.03529412 + topGap,);
    path.cubicTo(size.width * 0.8871535,size.height*0.03955809+ topGap,size.width*0.8808696,size.height*0.04301471+ topGap,size.width*0.8731176,size.height*0.04301471+ topGap,);

    for(int i = 0; i < numberOfPeaks; i++){
      path.cubicTo(
        size.width * (widthPercent - (i * 0.0467851)), size.height * heightPercent + topGap,
        size.width * (widthPercent - 0.0062839 - (i * 0.0467851)), size.height * (heightPercent - 0.00345662) + topGap,
        size.width * (widthPercent - 0.0062839 - (i * 0.0467851)), size.height * (heightPercent - 0.00772059) + topGap,
      );
      path.lineTo(
        size.width*(widthPercent - 0.0249974 - (i * 0.0467852)), size.height*(heightPercent - 0.00772059)+ topGap,
      );
      path.cubicTo(
        size.width*(widthPercent - 0.0249974 - (i * 0.0467852)), size.height*(heightPercent - 0.00345662) + topGap,
        size.width*(widthPercent - 0.0312813 - (i * 0.0467852)), size.height*heightPercent + topGap,
        size.width*(widthPercent - 0.0390332 - (i * 0.0467852)), size.height*heightPercent + topGap,
      );
    }

    path.cubicTo(size.width*0.1167905,size.height*0.04301471+ topGap,size.width*0.1105064,size.height*0.03955809+ topGap,size.width*0.1105064,size.height*0.03529412+ topGap,);
    path.lineTo(size.width*0.09647059,size.height*0.03529412+ topGap,);
    path.cubicTo(size.width*0.09647059,size.height*0.04623250+ topGap, size.width*0.08096266,size.height*0.05517853+ topGap, size.width*0.06138107,size.height*0.05588235+ topGap,);

    path.lineTo(size.width*0.06138107,size.height*0.05588235+ topGap);

    /// From top left to bottom left |
    path.lineTo(size.width*0.06372046,size.height*0.9441176 + topGap);

    /// From bottom left to right ->
    widthPercent = 0.1346332;
    heightPercent = 0.9569853;

    path.cubicTo(size.width*0.08439182,size.height*0.9441176 + topGap,size.width*0.1011491,size.height*0.9533353 + topGap,size.width*0.1011491,size.height*0.9647059 + topGap,);
    path.lineTo(size.width*0.1128458,size.height*0.9647059 + topGap,);
    path.cubicTo(size.width*0.1128458,size.height*0.9604426 + topGap,size.width*0.1191297,size.height*0.9569853 + topGap,size.width*0.1268816,size.height*0.9569853 + topGap,);

    for(int i = 0; i < numberOfPeaks; i++){

      path.cubicTo(
        size.width * (widthPercent + (i * 0.046786)), size.height * heightPercent + topGap,
        size.width * (widthPercent + 0.0062842 + (i * 0.0467859)), size.height * (heightPercent + 0.0034573) + topGap,
        size.width * (widthPercent + 0.0062842 + (i * 0.0467859)), size.height * (heightPercent + 0.0077206) + topGap,
      );

      path.lineTo(
        size.width*(widthPercent + 0.0249985 + (i * 0.0467859)), size.height*(heightPercent + 0.0077206)+ topGap,
      );


      path.cubicTo(
        size.width*(widthPercent + 0.0249985 + (i * 0.0467859)), size.height*(heightPercent + 0.0034573) + topGap,
        size.width*(widthPercent + 0.0312827 + (i * 0.0467859)), size.height*heightPercent + topGap,
        size.width*(widthPercent + 0.0390343 + (i * 0.046786)), size.height*heightPercent + topGap,
      );

    }


    path.cubicTo(size.width*0.8832097,size.height*0.9569853 + topGap,size.width*0.8894936,size.height*0.9604426 + topGap,size.width*0.8894936,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.9035294,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.9035294,size.height*0.9537676 + topGap,size.width*0.9190384,size.height*0.9448221 + topGap,size.width*0.9386189,size.height*0.9441574 + topGap);

    path.lineTo(size.width*0.9386189,size.height*0.9441176 + topGap);

    /// From bottom right to top right
    path.lineTo(size.width*0.9386189,size.height*0.05588235 + topGap);

    path.close();

    return path;
  }

  @override
  void paint(ui.Canvas canvas, ui.Rect rect, {ui.TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}