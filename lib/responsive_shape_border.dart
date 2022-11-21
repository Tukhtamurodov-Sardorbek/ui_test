import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyShapeBorder extends ShapeBorder {

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return Path();
  }

  // from left :0.06372046
  // from right :0.9156087
  // total : 0.14811176

  // left: 0.85188824
  // remained : 0.89546527
  @override
  Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    final Size size = rect.size;
    final topGap = rect.top;
    final width = rect.width;

    double widthPercent = 0.8653657;
    double heightPercent = 0.04301471;
    const peakWidth = 15;
    const peakHeight = 15;

    final start = 30 + (width % peakWidth == 0 ? 0 : (width % peakWidth / 2));
    final finish =  width - start;
    final numberOfPeaks = (finish - start) / peakWidth;

    print('SIZE: $size  Width: ${finish - start} Peaks: $numberOfPeaks Start: $start  Finish: $finish');

    final Path path = Path();
    Size coordinate = Size(finish, size.height*0.05588235 + topGap);

    double OX(double moveBy){
      // print('OX Before => $coordinate');
      double xCoordinate = coordinate.width;
      final yCoordinate = coordinate.height;

      xCoordinate += moveBy;

      coordinate = Size(xCoordinate, yCoordinate);
      // print('OX After => $coordinate');
      return coordinate.width;
    }
    double OY(double moveBy){
      // print('OY Before => $coordinate');
      final xCoordinate = coordinate.width;
      double yCoordinate = coordinate.height;

      yCoordinate += moveBy;

      coordinate = Size(xCoordinate, yCoordinate);
      // print('OY After => $coordinate');
      return coordinate.height;
    }

    /// From top right to left <-
    path.moveTo(coordinate.width, coordinate.height);


    print('Start => $coordinate');
    path.cubicTo(
      /// 337.060368 - 329.619132 =7.441236
      OX(-7), coordinate.height,
      OX(-5), OY(-7.374112),
      coordinate.width, OY(-9.096472),
      // 329.619132 - 323.982612 = 5.63652 W
      // 44.70588 -> - 7.374112 => 37.331768 -> - 9.096472 =>  28.235296 H
    );

    print('Before Line => $coordinate');

    path.lineTo(OX(-5), coordinate.height);
    // 323.982612 - 319.37526 = 4.607352
    print('After Line => $coordinate');
    path.cubicTo(
      OX(-5), OY(3.411176),
      OX(-5), OY(2.765296),
      OX(-5), coordinate.height,
      // 319.37526 - 314.322336 = 5.052924 W
      // 28.235296 -> + 3.411176 => 31.646472 -> + 2.765296 => 34.411768 H
    );

    print('Connect => $coordinate');

    for(int i = 0; i < numberOfPeaks; i++){
      // 0.8731176 -> widthPercent = 0.8653657;
      // 314.322336 - 311.531652 = 2.790684
      path.cubicTo(
        size.width * (widthPercent - (i * 0.0467851)), size.height * heightPercent + topGap,
        size.width * (widthPercent - 0.0062839 - (i * 0.0467851)), size.height * (heightPercent - 0.00345662) + topGap,
        size.width * (widthPercent - 0.0062839 - (i * 0.0467851)), size.height * (heightPercent - 0.00772059) + topGap,
        // 311.531652 - 309.269448 = 2.262204
        // 294.689016 - 292.426812 = 2.262204
      );
      path.lineTo(
        size.width*(widthPercent - 0.0249974 - (i * 0.0467852)), size.height*(heightPercent - 0.00772059)+ topGap,
        // 309.269448 - 302.532588 = 6.73686
      );
      path.cubicTo(
        size.width*(widthPercent - 0.0249974 - (i * 0.0467852)), size.height*(heightPercent - 0.00345662) + topGap,
        // 302.532588
        size.width*(widthPercent - 0.0312813 - (i * 0.0467852)), size.height*heightPercent + topGap,
        // 302.532588 - 300.270384 = 2.262204
        size.width*(widthPercent - 0.0390332 - (i * 0.0467852)), size.height*heightPercent + topGap,
        // 300.270384 - 297.4797 = 2.790684
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