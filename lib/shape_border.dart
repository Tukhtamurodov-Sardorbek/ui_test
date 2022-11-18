import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MyShapeBorder extends OutlinedBorder {

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    final Size size = rect.size;
    final topGap = rect.top;
    print('TOP: ${rect.top} | BOTTOM: ${rect.bottom}');
    print('LEFT: ${rect.left} | RIGHT: ${rect.right}');
    print('WIDTH: ${rect.width} | HEIGHT: ${rect.height}');


    final screen = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final maxWidth = screen.size.width;
    print('MAX WIDTH: ${screen.size.width} | MAX HEIGHT: ${screen.size.height}');
    print('#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#');
    int waveNumber = 10;
    if(maxWidth < 360) {
      waveNumber = 15;
    } else if (maxWidth < 600) {
      waveNumber = 35;
    } else {
      waveNumber = 45;
    }
    double widthPercent = 0.8653657;
    double heightPercent = 0.04301471;

    final rightBound = size.width * 0.9362788;
    final leftBound = size.width * 0.06138107;
    double rightSide (int i, double difference) => size.width*(0.9362788 - (i * difference));

    final Path path = Path();
    path.moveTo(rightBound, size.height*0.05588235 + topGap);

    path.cubicTo(size.width * 0.9156087, size.height * 0.05588235 + topGap, size.width * 0.8988517, size.height * 0.04666471 + topGap, size.width * 0.8988517, size.height * 0.03529412 + topGap);
    path.lineTo(size.width * 0.8871535, size.height * 0.03529412 + topGap);
    path.cubicTo(size.width * 0.8871535,size.height*0.03955809+ topGap,size.width*0.8808696,size.height*0.04301471+ topGap,size.width*0.8731176,size.height*0.04301471+ topGap);

    for(int i = 0; i < 15; i++){
      path.cubicTo(
          size.width * (widthPercent - (i * 0.0467851)), size.height * heightPercent + topGap,
        // size.width*0.8653657,size.height*0.04301471+ topGap,
        // size.width*0.8185806,size.height*0.04301471+ topGap,
          size.width * (widthPercent - 0.0062839 - (i * 0.0467851)), size.height * (heightPercent - 0.00345662) + topGap,
        // size.width*0.8590818,size.height*0.03955809+ topGap,
        // size.width*0.8122967,size.height*0.03955809+ topGap,
          size.width * (widthPercent - 0.0062839 - (i * 0.0467851)), size.height * (heightPercent - 0.00772059) + topGap,
        // size.width*0.8590818,size.height*0.03529412+ topGap
        // size.width*0.8122967,size.height*0.03529412+ topGap
      );
      path.lineTo(
          size.width*(widthPercent - 0.0249974 - (i * 0.0467852)), size.height*(heightPercent - 0.00772059)+ topGap
        // size.width*0.8403683,size.height*0.03529412+ topGap
        // size.width*0.7935831,size.height*0.03529412+ topGap
      );
      path.cubicTo(
        size.width*(widthPercent - 0.0249974 - (i * 0.0467852)), size.height*(heightPercent - 0.00345662) + topGap,
        // size.width*0.8403683,size.height*0.03955809+ topGap,
        // size.width*0.7935831,size.height*0.03955809+ topGap,
        size.width*(widthPercent - 0.0312813 - (i * 0.0467852)), size.height*heightPercent + topGap,
        // size.width*0.8340844,size.height*0.04301471+ topGap,
        // size.width*0.7872992,size.height*0.04301471+ topGap,
        size.width*(widthPercent - 0.0390332 - (i * 0.0467852)), size.height*heightPercent + topGap,
        // size.width*0.8263325,size.height*0.04301471+ topGap
        // size.width*0.7795473,size.height*0.04301471+ topGap
      );
    }


    path.cubicTo(size.width*0.1635765,size.height*0.04301471+ topGap,size.width*0.1572923,size.height*0.03955809+ topGap,size.width*0.1572923,size.height*0.03529412+ topGap);
    path.lineTo(size.width*0.1385780,size.height*0.03529412+ topGap);
    path.cubicTo(size.width*0.1385780,size.height*0.03955809+ topGap,size.width*0.1322941,size.height*0.04301471+ topGap,size.width*0.1245422,size.height*0.04301471+ topGap);

    path.cubicTo(size.width*0.1167905,size.height*0.04301471+ topGap,size.width*0.1105064,size.height*0.03955809+ topGap,size.width*0.1105064,size.height*0.03529412+ topGap);
    path.lineTo(size.width*0.09647059,size.height*0.03529412+ topGap);
    path.cubicTo(size.width*0.09647059,size.height*0.04623250+ topGap,size.width*0.08096266,size.height*0.05517853+ topGap,size.width*0.06138107,size.height*0.05584279+ topGap);

    path.lineTo(size.width*0.06138107,size.height*0.05588235+ topGap);

//////////////////////////////////////////////////////////////////////////////
    path.lineTo(size.width*0.06372046,size.height*0.9441176 + topGap);
//////////////////////////////////////////////////////////////////////////////

    path.cubicTo(size.width*0.08439182,size.height*0.9441176 + topGap,size.width*0.1011491,size.height*0.9533353 + topGap,size.width*0.1011491,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.1128458,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.1128458,size.height*0.9604426 + topGap,size.width*0.1191297,size.height*0.9569853 + topGap,size.width*0.1268816,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.1346332,size.height*0.9569853 + topGap,size.width*0.1409174,size.height*0.9604426 + topGap,size.width*0.1409174,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.1596317,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.1596317,size.height*0.9604426 + topGap,size.width*0.1659159,size.height*0.9569853 + topGap,size.width*0.1736675,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.1814192,size.height*0.9569853 + topGap,size.width*0.1877033,size.height*0.9604426 + topGap,size.width*0.1877033,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.2064176,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.2064176,size.height*0.9604426 + topGap,size.width*0.2127018,size.height*0.9569853 + topGap,size.width*0.2204535,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.2282054,size.height*0.9569853 + topGap,size.width*0.2344893,size.height*0.9604426 + topGap,size.width*0.2344893,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.2532038,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.2532038,size.height*0.9604426 + topGap,size.width*0.2594885,size.height*0.9569853 + topGap,size.width*0.2672404,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.2749923,size.height*0.9569853 + topGap,size.width*0.2812762,size.height*0.9604426 + topGap,size.width*0.2812762,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.2999898,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.2999898,size.height*0.9604426 + topGap,size.width*0.3062737,size.height*0.9569853 + topGap,size.width*0.3140256,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.3217775,size.height*0.9569853 + topGap,size.width*0.3280614,size.height*0.9604426 + topGap,size.width*0.3280614,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.3467749,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.3467749,size.height*0.9604426 + topGap,size.width*0.3530588,size.height*0.9569853 + topGap,size.width*0.3608107,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.3685627,size.height*0.9569853 + topGap,size.width*0.3748465,size.height*0.9604426 + topGap,size.width*0.3748465,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.3935627,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.3935627,size.height*0.9604426 + topGap,size.width*0.3998465,size.height*0.9569853 + topGap,size.width*0.4075985,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.4153504,size.height*0.9569853 + topGap,size.width*0.4216343,size.height*0.9604426 + topGap,size.width*0.4216343,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.4403478,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.4403478,size.height*0.9604426 + topGap,size.width*0.4466317,size.height*0.9569853 + topGap,size.width*0.4543836,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.4621355,size.height*0.9569853 + topGap,size.width*0.4684194,size.height*0.9604426 + topGap,size.width*0.4684194,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.4871330,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.4871330,size.height*0.9604426 + topGap,size.width*0.4934169,size.height*0.9569853 + topGap,size.width*0.5011688,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.5089207,size.height*0.9569853 + topGap,size.width*0.5152046,size.height*0.9604426 + topGap,size.width*0.5152046,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.5339207,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.5339207,size.height*0.9604426 + topGap,size.width*0.5402046,size.height*0.9569853 + topGap,size.width*0.5479565,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.5557084,size.height*0.9569853 + topGap,size.width*0.5619923,size.height*0.9604426 + topGap,size.width*0.5619923,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.5807059,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.5807059,size.height*0.9604426 + topGap,size.width*0.5869898,size.height*0.9569853 + topGap,size.width*0.5947417,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.6024936,size.height*0.9569853 + topGap,size.width*0.6087775,size.height*0.9604426 + topGap,size.width*0.6087775,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.6274910,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.6274910,size.height*0.9604426 + topGap,size.width*0.6337749,size.height*0.9569853 + topGap,size.width*0.6415269,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.6492788,size.height*0.9569853 + topGap,size.width*0.6555627,size.height*0.9604426 + topGap,size.width*0.6555627,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.6742788,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.6742788,size.height*0.9604426 + topGap,size.width*0.6805627,size.height*0.9569853 + topGap,size.width*0.6883146,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.6960665,size.height*0.9569853 + topGap,size.width*0.7023504,size.height*0.9604426 + topGap,size.width*0.7023504,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.7210639,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.7210639,size.height*0.9604426 + topGap,size.width*0.7273478,size.height*0.9569853 + topGap,size.width*0.7350997,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.7428517,size.height*0.9569853 + topGap,size.width*0.7491355,size.height*0.9604426 + topGap,size.width*0.7491355,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.7678491,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.7678491,size.height*0.9604426 + topGap,size.width*0.7741330,size.height*0.9569853 + topGap,size.width*0.7818849,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.7896368,size.height*0.9569853 + topGap,size.width*0.7959207,size.height*0.9604426 + topGap,size.width*0.7959207,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.8146368,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.8146368,size.height*0.9604426 + topGap,size.width*0.8209207,size.height*0.9569853 + topGap,size.width*0.8286726,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.8364246,size.height*0.9569853 + topGap,size.width*0.8427084,size.height*0.9604426 + topGap,size.width*0.8427084,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.8614220,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.8614220,size.height*0.9604426 + topGap,size.width*0.8677059,size.height*0.9569853 + topGap,size.width*0.8754578,size.height*0.9569853 + topGap);

    path.cubicTo(size.width*0.8832097,size.height*0.9569853 + topGap,size.width*0.8894936,size.height*0.9604426 + topGap,size.width*0.8894936,size.height*0.9647059 + topGap);
    path.lineTo(size.width*0.9035294,size.height*0.9647059 + topGap);
    path.cubicTo(size.width*0.9035294,size.height*0.9537676 + topGap,size.width*0.9190384,size.height*0.9448221 + topGap,size.width*0.9386189,size.height*0.9441574 + topGap);

    path.lineTo(size.width*0.9386189,size.height*0.9441176 + topGap);
//////////////////////////////////////////////////////////////////////////////
    path.lineTo(size.width*0.9386189,size.height*0.05588235 + topGap);
//////////////////////////////////////////////////////////////////////////////
    path.close();

    return path;
  }

  @override
  void paint(ui.Canvas canvas, ui.Rect rect, {ui.TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return this;
  }
}