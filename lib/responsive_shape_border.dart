import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyResponsiveShapeBorder extends ShapeBorder {

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
    final width = rect.width;

    double widthPercent = 0.8653657;
    double heightPercent = 0.04301471;
    const peakWidth = 16.842736;

    const cornerWidth = 24.807272;
    const horizontalMargin = 30;
    double remainedSpace = width - 2 * cornerWidth - 2 * horizontalMargin;
    final start = horizontalMargin + ((remainedSpace % peakWidth) / 2);
    final finish =  width - start;

    final numberOfPeaks = (finish - start - 49.614544) / peakWidth;

    print('SIZE: $size  Width: ${finish - start} Peaks: $numberOfPeaks Start: $start  Finish: $finish');

    final Path path = Path();
    Size coordinate = Size(finish, size.height*0.05588235 + topGap);

    double OX(double moveBy){
      double xCoordinate = coordinate.width;
      final yCoordinate = coordinate.height;

      xCoordinate += moveBy;
      coordinate = Size(xCoordinate, yCoordinate);
      return coordinate.width;
    }
    double OzY(double moveBy){
      final xCoordinate = coordinate.width;
      double yCoordinate = coordinate.height;

      yCoordinate += moveBy;
      coordinate = Size(xCoordinate, yCoordinate);
      return coordinate.height;
    }

    /// From top right to left <-
    path.moveTo(coordinate.width, coordinate.height);

    path.cubicTo(
      OX(-7.380868), size.height * 0.05588235 + topGap,
      OX(-5.63652), size.height * 0.04666471 + topGap,
      coordinate.width, size.height * 0.03529412 + topGap,
    );

    path.lineTo(OX(-6.73696), size.height * 0.03529412 + topGap);

    path.cubicTo(
      coordinate.width, size.height*0.03955809+ topGap,
      OX(-2.262204), size.height*0.04301471+ topGap,
      OX(-2.79072), size.height*0.04301471+ topGap,
    );

    for(int i = 0; i < numberOfPeaks; i++){
      path.cubicTo(
        OX(-2.790684), size.height * heightPercent + topGap,
        OX(-2.262204), size.height * (heightPercent - 0.00345662) + topGap,
        coordinate.width, size.height * (heightPercent - 0.00772059) + topGap,
      );
      path.lineTo(
        OX(-6.73696), size.height*(heightPercent - 0.00772059)+ topGap,
      );
      path.cubicTo(
        coordinate.width, size.height*(heightPercent - 0.00345662) + topGap,
        OX(-2.262204), size.height*heightPercent + topGap,
        OX(-2.790684), size.height*heightPercent + topGap,
      );
    }

    path.cubicTo(
      OX(-2.79072),size.height*0.04301471+ topGap,
      OX(-2.262204),size.height*0.03955809+ topGap,
      coordinate.width,size.height*0.03529412+ topGap,
    );

    path.lineTo(OX(-6.73696),size.height*0.03529412+ topGap,);

    path.cubicTo(
      coordinate.width,size.height*0.04623250+ topGap,
      OX(-5.63652),size.height*0.05517853+ topGap,
      OX(-7.380868),size.height*0.05588235+ topGap,
    );

    path.lineTo(coordinate.width,size.height*0.05588235+ topGap);

    /// From top left to bottom left |
    path.lineTo(coordinate.width,size.height*0.9441176 + topGap);


    /// From bottom left to right ->
    heightPercent = 0.9569853;

    path.cubicTo(
      OX(7.380868),size.height*0.9441176 + topGap,
      OX(5.63652),size.height*0.9533353 + topGap,
      coordinate.width,size.height*0.9647059 + topGap,
    );
    path.lineTo(OX(6.73696),size.height*0.9647059 + topGap,);
    path.cubicTo(
      coordinate.width,size.height*0.9604426 + topGap,
      OX(2.262204),size.height*0.9569853 + topGap,
      OX(2.79072),size.height*0.9569853 + topGap,
    );

    for(int i = 0; i < numberOfPeaks; i++){

      path.cubicTo(
        OX(2.790684), size.height * heightPercent + topGap,
        OX(2.262204), size.height * (heightPercent + 0.0034573) + topGap,
        coordinate.width, size.height * (heightPercent + 0.0077206) + topGap,
      );

      path.lineTo(
        OX(6.73696), size.height*(heightPercent + 0.0077206)+ topGap,
      );


      path.cubicTo(
        coordinate.width, size.height*(heightPercent + 0.0034573) + topGap,
        OX(2.262204), size.height*heightPercent + topGap,
        OX(2.790684), size.height*heightPercent + topGap,
      );

    }


    path.cubicTo(
        OX(2.79072),size.height*0.9569853 + topGap,
        OX(2.262204),size.height*0.9604426 + topGap,
        coordinate.width,size.height*0.9647059 + topGap,
    );
    path.lineTo(OX(6.73696),size.height*0.9647059 + topGap);
    path.cubicTo(
        coordinate.width,size.height*0.9537676 + topGap,
        OX(5.63652),size.height*0.9448221 + topGap,
        OX(7.380868),size.height*0.9441574 + topGap,
    );

    path.lineTo(finish,size.height*0.9441176 + topGap);

    /// From bottom right to top right
    path.lineTo(finish,size.height*0.05588235 + topGap);

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