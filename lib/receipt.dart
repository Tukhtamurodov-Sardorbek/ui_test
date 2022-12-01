import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:screenshot/screenshot.dart';
import 'package:ui_test/components/custom_shape.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_test/components/pdf_custom_decoration.dart';

import 'components/pdf_shape.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  static const data = {
    'Receipt number': '0220005',
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
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  bool isLoading = false;

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
          ReceiptContainer(
            key: globalKey,
            child:  Column(
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
                        'Transfer completed successfully',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '18 000 000 uzs',
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
                  itemCount: Receipt.data.length,
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
                          Receipt.data.keys.toList()[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF99A3B3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          Receipt.data.values.toList()[index],
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
                  onPressed: () async{
                    final height = globalKey.currentContext?.size?.height ?? 0;
                    final width = globalKey.currentContext?.size?.width ?? 360;
                    print((globalKey.currentContext?.size).toString());
                    final receiptBackground = await ReceiptContainer().capture(context, height: height, width: width);


                    String tempPath = (await getTemporaryDirectory()).path;
                    File imgFile = await File('$tempPath/receipt.png').create();
                    imgFile.writeAsBytesSync(receiptBackground);

                    File image = new File(imgFile.path); // Or any other way to get a File instance.
                    var decodedImage = await decodeImageFromList(image.readAsBytesSync());
                    print('################################################');
                    print('WIDTH: ${decodedImage.width}   HEIGHT: ${decodedImage.height}');

                    final ByteData logoBytes =
                    await rootBundle.load('assets/logo.png');
                    final Uint8List logoByteList =
                    logoBytes.buffer.asUint8List();

                    final receipt = pdf.Document();

                    receipt.addPage(
                        pdf.Page(
                          pageFormat: PdfPageFormat.a4,
                            orientation: pdf.PageOrientation.portrait,

                            build: (context) {
                      return pdf.Container(
                          width: width,
                          height: height,
                        alignment: pdf.Alignment.center,
                        child: pdf.Stack(
                          children: [
                            pdf.Container(
                              width: width,
                              height: height,
                              child: pdf.Image(
                                pdf.MemoryImage(receiptBackground),
                              )
                            ),
                            pdf.Positioned.fill(
                              child: pdf.Column(
                                mainAxisSize: pdf.MainAxisSize.min,
                                crossAxisAlignment: pdf.CrossAxisAlignment.start,
                                children: [
                                  pdf.Padding(
                                    padding:
                                    const pdf.EdgeInsets.only(left: 25.0),
                                    child: pdf.Image(
                                      pdf.MemoryImage(logoByteList),
                                      height: 46,
                                      width: 120,
                                    ),
                                  ),
                                  pdf.SizedBox(height: 10),
                                  pdf.Container(
                                    height: 100,
                                    width: double.infinity,
                                    color: const PdfColor.fromInt(0xFF2AA65C),
                                    padding: const pdf.EdgeInsets.symmetric(vertical: 16.0),
                                    child: pdf.Column(
                                      children: [
                                        pdf.Text(
                                          'Transfer completed successfully',
                                          style: pdf.TextStyle(
                                            fontSize: 16.0,
                                            color: PdfColors.white,
                                            fontWeight: pdf.FontWeight.bold,
                                          ),
                                        ),
                                        pdf.SizedBox(height: 8.0),
                                        pdf.Text(
                                          '18 000 000 uzs',
                                          style: pdf.TextStyle(
                                            fontSize: 34,
                                            color: PdfColors.white,
                                            fontWeight: pdf.FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  pdf.SizedBox(height: 14),
                                  for(int index = 0; index < Receipt.data.length; index++)
                                    pdf.Column(
                                      mainAxisSize: pdf.MainAxisSize.min,
                                      children: [
                                        pdf.Row(
                                          mainAxisAlignment:
                                          pdf.MainAxisAlignment.spaceBetween,
                                          children: [
                                            pdf.Text(
                                              Receipt.data.keys.toList()[index],
                                              style: pdf.TextStyle(
                                                fontSize: 16,
                                                color: const PdfColor.fromInt(0xFF99A3B3),
                                                fontWeight: pdf.FontWeight.bold,
                                              ),
                                            ),
                                            pdf.Text(
                                              Receipt.data.values.toList()[index],
                                              style: pdf.TextStyle(
                                                fontSize: 16,
                                                color: const PdfColor.fromInt(0xFF071222),
                                                fontWeight: pdf.FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        index == index < Receipt.data.length - 1 ? pdf.SizedBox() : pdf.Container(
                                          margin: const pdf.EdgeInsets.symmetric(vertical: 14.0),
                                          color:
                                          const PdfColor.fromInt(0xFFC8C7CC),
                                          height: 0.5,
                                        ),
                                      ],
                                    ),
                                  // pdf.ListView.separated(
                                  //   padding: const pdf.EdgeInsets.only(left: 15.0, right: 16.0),
                                  //   itemCount: Receipt.data.length,
                                  //   separatorBuilder: (context, index) {
                                  //     return pdf.Container(
                                  //       margin: const pdf.EdgeInsets.symmetric(vertical: 14.0),
                                  //       color:
                                  //       const PdfColor.fromInt(0xFFC8C7CC),
                                  //       height: 0.5,
                                  //     );
                                  //   },
                                  //   itemBuilder: (context, index) {
                                  //     return pdf.Row(
                                  //       mainAxisAlignment:
                                  //       pdf.MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         pdf.Text(
                                  //           Receipt.data.keys.toList()[index],
                                  //           style: pdf.TextStyle(
                                  //             fontSize: 16,
                                  //             color: const PdfColor.fromInt(0xFF99A3B3),
                                  //             fontWeight: pdf.FontWeight.bold,
                                  //           ),
                                  //         ),
                                  //         pdf.Text(
                                  //           Receipt.data.values.toList()[index],
                                  //           style: pdf.TextStyle(
                                  //             fontSize: 16,
                                  //             color: const PdfColor.fromInt(0xFF071222),
                                  //             fontWeight: pdf.FontWeight.bold,
                                  //           ),
                                  //         )
                                  //       ],
                                  //     );
                                  //   },
                                  // ),
                                  pdf.SizedBox(height: 14),
                                ],
                              ),
                            )
                            // pdf.Container(
                            //   height: height,
                            //   width: width,
                            //   alignment: pdf.Alignment.center,
                            //   // padding: const pdf.EdgeInsets.fromLTRB(21.5, 36, 21.44, 36),
                            //   padding: const pdf.EdgeInsets.fromLTRB(20, 36, 45, 36),
                            //   decoration: pdf.BoxDecoration(
                            //     // color: PdfColors.black,
                            //     image: pdf.DecorationImage(
                            //       image: ,
                            //       // fit: pdf.BoxFit.fitWidth,
                            //     ),
                            //   ),
                            //   child:
                            // ),
                          ]
                        )
                      );
                    }));

                    final bytes = await receipt.save();

                    final dir = await getApplicationDocumentsDirectory();
                    final file = File('${dir.path}/check${DateTime.now()}.pdf');

                    await file.writeAsBytes(bytes);

                    // setState((){
                    //   isLoading = false;
                    // });
                    // Share.shareXFiles(
                    //   [XFile(file.path)],
                    //   text: 'Check (${DateTime.now()}',
                    // );

                    await OpenFile.open(file.path);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEAF6EF),
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Try again',
                    style: TextStyle(
                      color: Color(0xFF2AA65C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final receipt = pdf.Document();

                    final ByteData logoBytes =
                        await rootBundle.load('assets/logo.png');
                    final Uint8List logoByteList =
                        logoBytes.buffer.asUint8List();

                    receipt.addPage(
                      pdf.Page(
                        clip: false,
                        pageTheme: const pdf.PageTheme(
                          pageFormat: PdfPageFormat.a4,
                          orientation: pdf.PageOrientation.portrait,
                          margin: pdf.EdgeInsets.zero,
                          clip: false,
                          textDirection: pdf.TextDirection.ltr,
                        ),
                        // pageFormat: PdfPageFormat.undefined,
                        build: (context) {
                          return pdf.Center(
                            child: pdf.Container(
                              width: 360,
                              padding:
                                  const pdf.EdgeInsets.symmetric(vertical: 20),
                              foregroundDecoration: pdf.BoxDecoration(

                                  boxShadow: [
                                    pdf.BoxShadow(
                                      color: PdfColors.grey,
                                      spreadRadius: 12,
                                      blurRadius: 12,
                                    )
                                  ]),
                              decoration: PdfCustomDecoration(),
                              // decoration: PdfCustomDecorationNew(),

                              child: pdf.Column(
                                mainAxisSize: pdf.MainAxisSize.min,
                                crossAxisAlignment:
                                    pdf.CrossAxisAlignment.start,
                                children: [
                                  pdf.Padding(
                                    padding:
                                        const pdf.EdgeInsets.only(left: 25.0),
                                    child: pdf.Image(
                                      pdf.MemoryImage(logoByteList),
                                      height: 46,
                                      width: 120,
                                    ),
                                  ),
                                  pdf.SizedBox(height: 10),
                                  pdf.Container(
                                    height: 100,
                                    width: double.infinity,
                                    color: const PdfColor.fromInt(0xFF2AA65C),
                                    padding: const pdf.EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: pdf.Column(
                                      children: [
                                        pdf.Text(
                                          'Transfer completed successfully',
                                          style: pdf.TextStyle(
                                            fontSize: 16.0,
                                            color: PdfColors.white,
                                            fontWeight: pdf.FontWeight.bold,
                                          ),
                                        ),
                                        pdf.SizedBox(height: 8.0),
                                        pdf.Text(
                                          '18 000 000 uzs',
                                          style: pdf.TextStyle(
                                            fontSize: 34,
                                            color: PdfColors.white,
                                            fontWeight: pdf.FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  pdf.SizedBox(height: 14),
                                  pdf.ListView.separated(
                                    padding: const pdf.EdgeInsets.only(
                                        left: 15.0, right: 16.0),
                                    itemCount: Receipt.data.length,
                                    separatorBuilder: (context, index) {
                                      return pdf.Container(
                                        margin: const pdf.EdgeInsets.symmetric(
                                            vertical: 14.0),
                                        color:
                                            const PdfColor.fromInt(0xFFC8C7CC),
                                        height: 0.5,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return pdf.Row(
                                        mainAxisAlignment:
                                            pdf.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pdf.Text(
                                            Receipt.data.keys.toList()[index],
                                            style: pdf.TextStyle(
                                              fontSize: 16,
                                              color: const PdfColor.fromInt(
                                                  0xFF99A3B3),
                                              fontWeight: pdf.FontWeight.bold,
                                            ),
                                          ),
                                          pdf.Text(
                                            Receipt.data.values.toList()[index],
                                            style: pdf.TextStyle(
                                              fontSize: 16,
                                              color: const PdfColor.fromInt(
                                                  0xFF071222),
                                              fontWeight: pdf.FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  pdf.SizedBox(height: 14),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );

                    final bytes = await receipt.save();

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
                          'Share',
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

class ReceiptContainer extends StatelessWidget {
  final Widget? child;
  ReceiptContainer({Key? key, this.child}) : super(key: key);

  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: const ResponsiveCustomShapeBorder(horizontalPadding: 16),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 6,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget emptyReceipt({required double height, required double width}){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: const ResponsiveCustomShapeBorder(horizontalPadding: 16),
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 6,
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> capture(BuildContext context, {required double height, required double width}) async{
    // print('PIXELRATIO: ${MediaQuery.of(context).devicePixelRatio}');
    final Uint8List image = await screenshotController.captureFromWidget(
        emptyReceipt(height: height, width: width),
      delay: Duration.zero,
      pixelRatio: 10,
    );
    return image;
  }
}
