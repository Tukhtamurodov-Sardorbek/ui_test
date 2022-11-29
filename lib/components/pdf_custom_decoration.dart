import 'dart:ui' as ui;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;

class PdfCustomDecoration implements pdf.BoxDecoration {
  final int horizontalPadding;
  PdfCustomDecoration({this.horizontalPadding = 0});

  @override
  pdf.BoxShape get shape => pdf.BoxShape.rectangle;

  @override
  pdf.BoxBorder? get border => pdf.Border.all(color: PdfColors.blue, width: 2);

  @override
  pdf.BorderRadius? get borderRadius => throw UnimplementedError();

  @override
  List<pdf.BoxShadow>? get boxShadow => [
        const pdf.BoxShadow(
          color: PdfColors.red,
          blurRadius: 6,
        ),
      ];

  @override
  PdfColor? get color => PdfColors.amberAccent;

  @override
  pdf.Gradient? get gradient => null;

  @override
  pdf.DecorationGraphic? get image => null;

  @override
  void paint(pdf.Context context, PdfRect box,
      [pdf.PaintPhase phase = pdf.PaintPhase.all]) {
    final width = box.width;
    const int peakWidth =
        16; // must be of type int, otherwise responsiveness is lost
    const peakHeight = 6;
    double cornerWidth = 24.807272;

    final double remainedSpace =
        (width - 2 * cornerWidth - 2 * horizontalPadding) % peakWidth;
    cornerWidth += remainedSpace / 2;

    var numberOfPeaks =
        (width - 2 * cornerWidth - 2 * horizontalPadding) / peakWidth;

    final startingPointX = width - horizontalPadding;
    const startingPointY = 2.666665371 * peakHeight;

    ui.Size coordinate = ui.Size(startingPointX, startingPointY);

    double OX(double moveBy) {
      double xCoordinate = coordinate.width;
      final yCoordinate = coordinate.height;

      xCoordinate += moveBy;

      coordinate = ui.Size(xCoordinate, yCoordinate);
      return coordinate.width;
    }

    double OY(double moveBy) {
      final xCoordinate = coordinate.width;
      double yCoordinate = coordinate.height;

      yCoordinate += moveBy;
      coordinate = ui.Size(xCoordinate, yCoordinate);
      return coordinate.height;
    }

    /// From top right to left <-
    context.canvas.moveTo(coordinate.width, coordinate.height);

    context.canvas.curveTo(
      OX(-0.297528402 * cornerWidth), coordinate.height,
      OX(-0.227212408 * cornerWidth), OY(-1.193903575 * peakHeight),
      coordinate.width, OY(-1.472761797 * peakHeight),
    );

    context.canvas.lineTo(OX(-0.271571981 * cornerWidth), coordinate.height);

    context.canvas.curveTo(
      coordinate.width, OY(0.552285512 * peakHeight),
      OX(-0.091191164 * cornerWidth), OY(0.447714488 * peakHeight),
      OX(-0.112496046 * cornerWidth), coordinate.height,
    );

    for (int i = 0; i < numberOfPeaks; i++) {

      context.canvas.curveTo(
        OX(-0.165690657 * peakWidth), coordinate.height,
        OX(-0.134313332 * peakWidth), OY(-0.447714488 * peakHeight),
        coordinate.width, OY(-0.552285512 * peakHeight),
      );

      context.canvas.lineTo(OX(-0.39999202 * peakWidth), coordinate.height);

      context.canvas.curveTo(
        coordinate.width, OY(0.552285512 * peakHeight),
        OX(-0.134313332 * peakWidth), OY(0.447714488 * peakHeight),
        OX(-0.165690657 * peakWidth), coordinate.height,
      );

    }

    context.canvas.curveTo(
      OX(-0.112496046 * cornerWidth), coordinate.height,
      OX(-0.091191164 * cornerWidth), OY(-0.447714488 * peakHeight),
      coordinate.width, OY(-0.552285512 * peakHeight),
    );

    context.canvas.lineTo(OX(-0.271571981 * cornerWidth), coordinate.height);

    context.canvas.curveTo(
      coordinate.width, OY(1.416780324 * peakHeight),
      OX(-0.227212408 * cornerWidth), OY(1.158723621 * peakHeight),
      OX(-0.297528402 * cornerWidth), OY(0.091161427 * peakHeight),
    );

    context.canvas.lineTo(OX(horizontalPadding - coordinate.width), coordinate.height);

    /// From top left to bottom left |
    context.canvas.lineTo(coordinate.width, OY(box.height - 2.666665371 * peakHeight - coordinate.height));

    /// From bottom left to right ->
    context.canvas.curveTo(
      OX(0.297528402 * cornerWidth), coordinate.height,
      OX(0.227212408 * cornerWidth), OY(1.193911346 * peakHeight),
      coordinate.width, OY(1.472763092 * peakHeight),
    );

    context.canvas.lineTo(OX(0.271571981 * cornerWidth), coordinate.height);

    context.canvas.curveTo(
      coordinate.width, OY(-0.552198731 * peakHeight),
      OX(0.091191164 * cornerWidth), OY(-0.447802564 * peakHeight),
      OX(0.112496046 * cornerWidth), coordinate.height,
    );

    for (int i = 0; i < numberOfPeaks; i++) {

      context.canvas.curveTo(
        OX(0.165690657 * peakWidth), coordinate.height,
        OX(0.134313332 * peakWidth), OY(0.447802564 * peakHeight),
        coordinate.width, OY(0.552198731 * peakHeight),
      );

      context.canvas.lineTo(OX(0.39999202 * peakWidth), coordinate.height);

      context.canvas.curveTo(
        coordinate.width, OY(-0.552198731 * peakHeight),
        OX(0.134313332 * peakWidth), OY(-0.447802564 * peakHeight),
        OX(0.165690657 * peakWidth), coordinate.height,
      );

    }

    context.canvas.curveTo(
      OX(0.112496046 * cornerWidth), coordinate.height,
      OX(0.091191164 * cornerWidth), OY(0.447802564 * peakHeight),
      coordinate.width, OY(0.552198731 * peakHeight),
    );

    context.canvas.lineTo(OX(0.271571981 * cornerWidth), coordinate.height);

    context.canvas.curveTo(
      coordinate.width, OY(-1.416769962 * peakHeight),
      OX(0.227212408 * cornerWidth), OY(-1.158654973 * peakHeight),
      OX(0.297528402 * cornerWidth), OY(-0.086094457 * peakHeight),
    );

    context.canvas.lineTo(OX(startingPointX - coordinate.width), OY(-0.005155046 * peakHeight),);

    /// From bottom right to top right
    context.canvas.lineTo(coordinate.width, OY(startingPointY - coordinate.height));

    context.canvas
      ..setColor(color)
      ..fillPath();

    context.canvas.closePath();
  }
}
