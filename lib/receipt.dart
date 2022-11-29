import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:ui_test/components/custom_shape.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_test/components/pdf_custom_decoration.dart';

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
          Container(
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
                  onPressed: () {},
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
                        pageFormat: PdfPageFormat.a4,
                        build: (context) {
                          return pdf.Center(
                            child: pdf.Container(
                              width: 350,
                              padding: const pdf.EdgeInsets.symmetric(vertical: 20),

                              decoration: PdfCustomDecoration(),

                              child: pdf.Column(
                                mainAxisSize: pdf.MainAxisSize.min,
                                crossAxisAlignment: pdf.CrossAxisAlignment.start,
                                children: [
                                  pdf.Padding(
                                    padding: const pdf.EdgeInsets.only(left: 25.0),
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
                                        color: const PdfColor.fromInt(0xFFC8C7CC),
                                        height: 0.5,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return pdf.Row(
                                        mainAxisAlignment:
                                            pdf.MainAxisAlignment.spaceBetween,
                                        children: [
                                          pdf.Text(
                                            Receipt.data.keys
                                                .toList()[index],
                                            style: pdf.TextStyle(
                                              fontSize: 16,
                                              color: const PdfColor.fromInt(
                                                  0xFF99A3B3),
                                              fontWeight: pdf.FontWeight.bold,
                                            ),
                                          ),
                                          pdf.Text(
                                            Receipt.data.values
                                                .toList()[index],
                                            style: pdf.TextStyle(
                                              fontSize: 16,
                                              color: const PdfColor.fromInt(0xFF071222),
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
