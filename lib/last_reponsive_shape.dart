import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LastResponsiveShapeBorder extends ShapeBorder {

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

    const peakWidth = 16;
    const horizontalMargin = 30.0;
    double cornerWidth = 24.807272;

    double heightPercent = 0.04301471;


    final double remainedSpace = (width - 2 * cornerWidth - 2 * horizontalMargin) % peakWidth;
    cornerWidth += remainedSpace/2;

    var numberOfPeaks = (width - 2 * cornerWidth - 2 * horizontalMargin) ~/ peakWidth;
    // var number = (width - 2 * cornerWidth - 2 * horizontalMargin) / peakWidth;
    // if(number.ceil() - number <= 0.0001){
    //   numberOfPeaks += 1;
    // }

    final startingPoint = width - horizontalMargin;

    print('Number of peaks: $numberOfPeaks | CornerWidth: $cornerWidth');

    final Path path = Path();
    Size coordinate = Size(startingPoint, size.height*0.05588235 + topGap);

    double OX(double moveBy){
      double xCoordinate = coordinate.width;
      final yCoordinate = coordinate.height;

      xCoordinate += moveBy;
      // if(xCoordinate < 0){
      //   xCoordinate = 0;
      // } else if(xCoordinate > startingPoint){
      //   xCoordinate = startingPoint;
      // }
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
      OX(-0.297528402 * cornerWidth), size.height * 0.05588235 + topGap,
      OX(-0.227212408 * cornerWidth), size.height * 0.04666471 + topGap,
      coordinate.width, size.height * 0.03529412 + topGap,
    );

    path.lineTo(OX(-0.271571981 * cornerWidth), size.height * 0.03529412 + topGap);

    path.cubicTo(
      coordinate.width, size.height*0.03955809+ topGap,
      OX(-0.091191164 * cornerWidth), size.height*0.04301471+ topGap,
      OX(-0.112496046 * cornerWidth), size.height*0.04301471+ topGap,
    );

    for(int i = 0; i < numberOfPeaks; i++){
      path.cubicTo(
        OX(-0.165690657 * peakWidth), size.height * heightPercent + topGap,
        OX(-0.134313332 * peakWidth), size.height * (heightPercent - 0.00345662) + topGap,
        coordinate.width, size.height * (heightPercent - 0.00772059) + topGap,
      );
      path.lineTo(
        OX(-0.39999202 * peakWidth), size.height*(heightPercent - 0.00772059)+ topGap,
      );
      path.cubicTo(
        coordinate.width, size.height*(heightPercent - 0.00345662) + topGap,
        OX(-0.134313332 * peakWidth), size.height*heightPercent + topGap,
        OX(-0.165690657 * peakWidth), size.height*heightPercent + topGap,
      );
    }

    path.cubicTo(
      OX(-0.112496046 * cornerWidth),size.height*0.04301471+ topGap,
      OX(-0.091191164 * cornerWidth),size.height*0.03955809+ topGap,
      coordinate.width,size.height*0.03529412+ topGap,
    );

    path.lineTo(OX(-0.271571981 * cornerWidth),size.height*0.03529412+ topGap,);

    path.cubicTo(
      coordinate.width,size.height*0.04623250+ topGap,
      OX(-0.227212408 * cornerWidth),size.height*0.05517853+ topGap,
      OX(-0.297528402 * cornerWidth),size.height*0.05588235+ topGap,
    );

    path.lineTo(OX(horizontalMargin - coordinate.width),size.height*0.05588235+ topGap);

    /// From top left to bottom left |
    path.lineTo(coordinate.width,size.height*0.9441176 + topGap);

    /// From bottom left to right ->
    heightPercent = 0.9569853;

    path.cubicTo(
      OX(0.297528402 * cornerWidth),size.height*0.9441176 + topGap,
      OX(0.227212408 * cornerWidth),size.height*0.9533353 + topGap,
      coordinate.width,size.height*0.9647059 + topGap,
    );
    path.lineTo(OX(0.271571981 * cornerWidth),size.height*0.9647059 + topGap,);
    path.cubicTo(
      coordinate.width,size.height*0.9604426 + topGap,
      OX(0.091191164 * cornerWidth),size.height*0.9569853 + topGap,
      OX(0.112496046 * cornerWidth),size.height*0.9569853 + topGap,
    );

    for(int i = 0; i < numberOfPeaks; i++){
      path.cubicTo(
        OX(0.165690657 * peakWidth), size.height * heightPercent + topGap,
        OX(0.134313332 * peakWidth), size.height * (heightPercent + 0.0034573) + topGap,
        coordinate.width, size.height * (heightPercent + 0.0077206) + topGap,
      );

      path.lineTo(
        OX(0.39999202 * peakWidth), size.height*(heightPercent + 0.0077206)+ topGap,
      );


      path.cubicTo(
        coordinate.width, size.height*(heightPercent + 0.0034573) + topGap,
        OX(0.134313332 * peakWidth), size.height*heightPercent + topGap,
        OX(0.165690657 * peakWidth), size.height*heightPercent + topGap,
      );

    }


    path.cubicTo(
      OX(0.112496046 * cornerWidth),size.height*0.9569853 + topGap,
      OX(0.091191164 * cornerWidth),size.height*0.9604426 + topGap,
      coordinate.width,size.height*0.9647059 + topGap,
    );
    path.lineTo(OX(0.271571981 * cornerWidth),size.height*0.9647059 + topGap);
    path.cubicTo(
      coordinate.width,size.height*0.9537676 + topGap,
      OX(0.227212408 * cornerWidth),size.height*0.9448221 + topGap,
      OX(0.297528402 * cornerWidth),size.height*0.9441574 + topGap,
    );

    path.lineTo(OX(startingPoint - coordinate.width),size.height*0.9441176 + topGap);

    /// From bottom right to top right
    path.lineTo(coordinate.width,size.height*0.05588235 + topGap);

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