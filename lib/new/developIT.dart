import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:ui_test/components/custom_shape.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_test/components/pdf_custom_decoration.dart';

class Developing extends StatefulWidget {
  const Developing({super.key});

  static const data = {
    'Receipt number': 'Tesha tegmagani',
    'Date': '01.09.2020 at 20:12',
    'Sender': 'John Smith',
    'From': '* 2333',
    'Receiver': 'Tenge Bank',
    'Address': 'London',
    'New': 'data',
    'To': 'check',
    'Responsiveness': 'of',
    'The': 'receipt',
    'Others': '...',
  };

  @override
  State<Developing> createState() => _DevelopingState();
}

class _DevelopingState extends State<Developing> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final doc = pw.Document();

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        automaticallyImplyLeading: false,
        title: const Text('Receipt'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: const ResponsiveCustomShapeBorder(horizontalMargin: 16),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 6,
                ),
              ],
            ),
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //   shape: BoxShape.rectangle
            // ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 46,
                    width: 120,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color(0xFF2AA65C),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: const [
                      Text(
                        'Перевод выполнен успешно',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '18 000 000 сум',
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: Developing.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 14.0),
                      color: const Color(0xFFC8C7CC),
                      height: 0.5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Developing.data.keys.toList()[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF99A3B3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          Developing.data.values.toList()[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF071222),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 72),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEAF6EF),
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Повторить',
                    style: TextStyle(
                      color: Color(0xFF2AA65C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final pdf = pw.Document();

                    final ByteData logoBytes =
                        await rootBundle.load('assets/logo.png');
                    final Uint8List logoByteList =
                        logoBytes.buffer.asUint8List();

                    final ByteData receiptBytes =
                        await rootBundle.load('assets/receipt_layout.png');
                    final Uint8List receiptByteList =
                        receiptBytes.buffer.asUint8List();

                    pdf.addPage(
                        pw.Page(
                        pageFormat: PdfPageFormat.a4,
                        build: (context) {
                          return pw.Center(
                            child: pw.Container(
                              width: 350,
                              padding: const pw.EdgeInsets.symmetric(vertical: 20),
                              // decoration: pw.BoxDecoration(
                              //   shape: pw.BoxShape.circle,
                              //     image: pw.DecorationImage(
                              //       image: pw.MemoryImage(receiptByteList),
                              //       fit: pw.BoxFit.fill,
                              //     ),
                              // ),
                              decoration: PdfCustomDecoration(),

                              child: pw.Column(
                                mainAxisSize: pw.MainAxisSize.min,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Padding(
                                    padding:
                                        const pw.EdgeInsets.only(left: 25.0),
                                    child: pw.Image(
                                      pw.MemoryImage(logoByteList),
                                      height: 46,
                                      width: 120,
                                    ),
                                  ),
                                  pw.SizedBox(height: 10),
                                  pw.Container(
                                    height: 100,
                                    width: double.infinity,
                                    color: const PdfColor.fromInt(0xFF2AA65C),
                                    padding: const pw.EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: pw.Column(
                                      children: [
                                        pw.Text(
                                          'Transfer completed successfully',
                                          style: pw.TextStyle(
                                            fontSize: 16.0,
                                            color: PdfColors.white,
                                            fontWeight: pw.FontWeight.bold,
                                          ),
                                        ),
                                        pw.SizedBox(height: 8.0),
                                        pw.Text(
                                          '18 000 000 uzs',
                                          style: pw.TextStyle(
                                            fontSize: 34,
                                            color: PdfColors.white,
                                            fontWeight: pw.FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  pw.SizedBox(height: 14),
                                  pw.ListView.separated(
                                    padding: const pw.EdgeInsets.only(
                                        left: 15.0, right: 16.0),
                                    itemCount: Developing.data.length,
                                    separatorBuilder: (context, index) {
                                      return pw.Container(
                                        margin: const pw.EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        color:
                                            const PdfColor.fromInt(0xFFC8C7CC),
                                        height: 0.5,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pw.Text(
                                            Developing.data.keys
                                                .toList()[index],
                                            style: pw.TextStyle(
                                              fontSize: 16,
                                              color: const PdfColor.fromInt(
                                                  0xFF99A3B3),
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                          pw.Text(
                                            Developing.data.values
                                                .toList()[index],
                                            style: pw.TextStyle(
                                              fontSize: 16,
                                              color: const PdfColor.fromInt(
                                                  0xFF071222),
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  pw.SizedBox(height: 14),
                                ],
                              ),
                            ),
                          );

                          //   pw.Center(
                          //   child: pw.Container(
                          //     width: 350,
                          //     padding: const pw.EdgeInsets.symmetric(vertical: 20),
                          //     decoration: pw.BoxDecoration(
                          //         image: pw.DecorationImage(
                          //       image: pw.MemoryImage(receiptByteList),
                          //       fit: pw.BoxFit.fill,
                          //     )),
                          //     child: pw.Column(
                          //       mainAxisSize: pw.MainAxisSize.min,
                          //       crossAxisAlignment: pw.CrossAxisAlignment.start,
                          //       children: [
                          //         pw.Padding(
                          //           padding: const pw.EdgeInsets.only(left: 25.0),
                          //           child: pw.Image(
                          //             pw.MemoryImage(logoByteList),
                          //             height: 46,
                          //             width: 120,
                          //           ),
                          //         ),
                          //         pw.SizedBox(height: 10),
                          //         pw.Container(
                          //           height: 100,
                          //           width: double.infinity,
                          //           color: const PdfColor.fromInt(0xFF2AA65C),
                          //           padding: const pw.EdgeInsets.symmetric(
                          //               vertical: 16.0),
                          //           child: pw.Column(
                          //             children: [
                          //               pw.Text(
                          //                 'Transfer completed successfully',
                          //                 style: pw.TextStyle(
                          //                   fontSize: 16.0,
                          //                   color: PdfColors.white,
                          //                   fontWeight: pw.FontWeight.bold,
                          //                 ),
                          //               ),
                          //               pw.SizedBox(height: 8.0),
                          //               pw.Text(
                          //                 '18 000 000 uzs',
                          //                 style: pw.TextStyle(
                          //                   fontSize: 34,
                          //                   color: PdfColors.white,
                          //                   fontWeight: pw.FontWeight.bold,
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //         pw.SizedBox(height: 14),
                          //         pw.ListView.separated(
                          //           padding: const pw.EdgeInsets.symmetric(
                          //               horizontal: 16.0),
                          //           itemCount: ReceiptPageNew.data.length,
                          //           separatorBuilder: (context, index) {
                          //             return pw.Container(
                          //               margin: const pw.EdgeInsets.symmetric(
                          //                   vertical: 14.0),
                          //               color: const PdfColor.fromInt(0xFFC8C7CC),
                          //               height: 0.5,
                          //             );
                          //           },
                          //           itemBuilder: (context, index) {
                          //             return pw.Row(
                          //               mainAxisAlignment:
                          //                   pw.MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 pw.Text(
                          //                   ReceiptPageNew.data.keys
                          //                       .toList()[index],
                          //                   style: pw.TextStyle(
                          //                     fontSize: 16,
                          //                     color: const PdfColor.fromInt(
                          //                         0xFF99A3B3),
                          //                     fontWeight: pw.FontWeight.bold,
                          //                   ),
                          //                 ),
                          //                 pw.Text(
                          //                   ReceiptPageNew.data.values
                          //                       .toList()[index],
                          //                   style: pw.TextStyle(
                          //                     fontSize: 16,
                          //                     color: const PdfColor.fromInt(
                          //                         0xFF071222),
                          //                     fontWeight: pw.FontWeight.bold,
                          //                   ),
                          //                 )
                          //               ],
                          //             );
                          //           },
                          //         ),
                          //         pw.SizedBox(height: 14),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        }));

                    final bytes = await pdf.save();

                    final dir = await getApplicationDocumentsDirectory();
                    final file = File('${dir.path}/check${DateTime.now()}.pdf');

                    await file.writeAsBytes(bytes);

                    // setState((){
                    //   isLoading = false;
                    // });

                    await OpenFile.open(file.path);

                    // Share.shareXFiles(
                    //   [XFile(file.path)],
                    //   text: 'Check (${DateTime.now()}',
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEAF6EF),
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const Text(
                          'Поделиться',
                          style: TextStyle(
                            color: Color(0xFF2AA65C),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

int horizontalMargin = 30;

class MyDecoration implements pw.BoxDecoration {
  @override
  pw.BoxBorder? get border => throw UnimplementedError();

  @override
  pw.BorderRadius? get borderRadius => throw UnimplementedError();

  @override
  List<pw.BoxShadow>? get boxShadow => throw UnimplementedError();

  @override
  PdfColor? get color => throw UnimplementedError();

  @override
  pw.Gradient? get gradient => throw UnimplementedError();

  @override
  pw.DecorationGraphic? get image => throw UnimplementedError();

  @override
  void paint(pw.Context context, PdfRect box,
      [pw.PaintPhase phase = pw.PaintPhase.all]) {
    final topGap = box.top;
    final width = box.width;

    const int peakWidth =
        16; // must be of type int, otherwise responsiveness is lost
    const peakHeight = 6;
    double cornerWidth = 24.807272;

    final double remainedSpace =
        (width - 2 * cornerWidth - 2 * horizontalMargin) % peakWidth;
    cornerWidth += remainedSpace / 2;

    var numberOfPeaks =
        (width - 2 * cornerWidth - 2 * horizontalMargin) / peakWidth;

    final startingPointX = width - horizontalMargin;
    final startingPointY = 2.666665371 * peakHeight + topGap;

    Size coordinate = Size(startingPointX, startingPointY);

    double OX(double moveBy) {
      double xCoordinate = coordinate.width;
      final yCoordinate = coordinate.height;

      xCoordinate += moveBy;

      coordinate = Size(xCoordinate, yCoordinate);
      return coordinate.width;
    }

    double OY(double moveBy) {
      final xCoordinate = coordinate.width;
      double yCoordinate = coordinate.height;

      yCoordinate += moveBy;
      coordinate = Size(xCoordinate, yCoordinate);
      return coordinate.height;
    }

    /// From top right to left <-
    context.canvas.moveTo(coordinate.width, coordinate.height);

    context.canvas.bezierArc(
      OX(-0.297528402 * cornerWidth),
      coordinate.height,
      OX(-0.227212408 * cornerWidth),
      OY(-1.193903575 * peakHeight),
      coordinate.width,
      OY(-1.472761797 * peakHeight),
    );

    context.canvas.lineTo(OX(-0.271571981 * cornerWidth), coordinate.height);

    context.canvas.bezierArc(
      coordinate.width,
      OY(0.552285512 * peakHeight),
      OX(-0.091191164 * cornerWidth),
      OY(0.447714488 * peakHeight),
      OX(-0.112496046 * cornerWidth),
      coordinate.height,
    );
    for (int i = 0; i < numberOfPeaks; i++) {
      context.canvas.bezierArc(
        OX(-0.165690657 * peakWidth),
        coordinate.height,
        OX(-0.134313332 * peakWidth),
        OY(-0.447714488 * peakHeight),
        coordinate.width,
        OY(-0.552285512 * peakHeight),
      );
      context.canvas.lineTo(
        OX(-0.39999202 * peakWidth),
        coordinate.height,
      );
      context.canvas.bezierArc(
        coordinate.width,
        OY(0.552285512 * peakHeight),
        OX(-0.134313332 * peakWidth),
        OY(0.447714488 * peakHeight),
        OX(-0.165690657 * peakWidth),
        coordinate.height,
      );
    }

    context.canvas.bezierArc(
      OX(-0.112496046 * cornerWidth),
      coordinate.height,
      OX(-0.091191164 * cornerWidth),
      OY(-0.447714488 * peakHeight),
      coordinate.width,
      OY(-0.552285512 * peakHeight),
    );

    context.canvas.lineTo(
      OX(-0.271571981 * cornerWidth),
      coordinate.height,
    );

    context.canvas.bezierArc(
      coordinate.width,
      OY(1.416780324 * peakHeight),
      OX(-0.227212408 * cornerWidth),
      OY(1.158723621 * peakHeight),
      OX(-0.297528402 * cornerWidth),
      OY(0.091161427 * peakHeight),
    );

    context.canvas
        .lineTo(OX(horizontalMargin - coordinate.width), coordinate.height);

    /// From top left to bottom left |
    context.canvas.lineTo(coordinate.width,
        OY(box.height - 2.666665371 * peakHeight + topGap - coordinate.height));

    /// From bottom left to right ->
    context.canvas.bezierArc(
      OX(0.297528402 * cornerWidth),
      coordinate.height,
      OX(0.227212408 * cornerWidth),
      OY(1.193911346 * peakHeight),
      coordinate.width,
      OY(1.472763092 * peakHeight),
    );
    context.canvas.lineTo(OX(0.271571981 * cornerWidth), coordinate.height);
    context.canvas.bezierArc(
      coordinate.width,
      OY(-0.552198731 * peakHeight),
      OX(0.091191164 * cornerWidth),
      OY(-0.447802564 * peakHeight),
      OX(0.112496046 * cornerWidth),
      coordinate.height,
    );

    for (int i = 0; i < numberOfPeaks; i++) {
      context.canvas.bezierArc(
        OX(0.165690657 * peakWidth),
        coordinate.height,
        OX(0.134313332 * peakWidth),
        OY(0.447802564 * peakHeight),
        coordinate.width,
        OY(0.552198731 * peakHeight),
      );

      context.canvas.lineTo(
        OX(0.39999202 * peakWidth),
        coordinate.height,
      );

      context.canvas.bezierArc(
        coordinate.width,
        OY(-0.552198731 * peakHeight),
        OX(0.134313332 * peakWidth),
        OY(-0.447802564 * peakHeight),
        OX(0.165690657 * peakWidth),
        coordinate.height,
      );
    }

    context.canvas.bezierArc(
      OX(0.112496046 * cornerWidth),
      coordinate.height,
      OX(0.091191164 * cornerWidth),
      OY(0.447802564 * peakHeight),
      coordinate.width,
      OY(0.552198731 * peakHeight),
    );
    context.canvas.lineTo(OX(0.271571981 * cornerWidth), coordinate.height);
    context.canvas.bezierArc(
      coordinate.width,
      OY(-1.416769962 * peakHeight),
      OX(0.227212408 * cornerWidth),
      OY(-1.158654973 * peakHeight),
      OX(0.297528402 * cornerWidth),
      OY(-0.086094457 * peakHeight),
    );

    context.canvas.lineTo(
        OX(startingPointX - coordinate.width), OY(-0.005155046 * peakHeight));

    /// From bottom right to top right
    context.canvas
        .lineTo(coordinate.width, OY(startingPointY - coordinate.height));

    context.canvas.closePath();
  }

  @override
  pw.BoxShape get shape => pw.BoxShape.rectangle;
}
