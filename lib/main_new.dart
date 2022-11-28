import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:ui_test/responsive_custom_shape.dart';
import 'package:path_provider/path_provider.dart';


class ReceiptPageNew extends StatefulWidget {
  const ReceiptPageNew({super.key});

  static const data = {
    'Receipt number': '28840188',
    'Date': '01.09.2020 at 20:12',
    'Sender': 'John Smith',
    'From': '• 2333',
    'Receiver': 'Tenge Bank',
    'Address': 'London',
    'Others': '...',
  };

  @override
  State<ReceiptPageNew> createState() => _ReceiptPageNewState();
}

class _ReceiptPageNewState extends State<ReceiptPageNew> {
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
              shape: const LastResponsiveShapeBorder(horizontalMargin: 16),
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
                  itemCount: ReceiptPageNew.data.length,
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
                          ReceiptPageNew.data.keys.toList()[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF99A3B3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ReceiptPageNew.data.values.toList()[index],
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
                        await rootBundle.load('assets/r.png');
                    final Uint8List receiptByteList =
                        receiptBytes.buffer.asUint8List();

                    pdf.addPage(pw.Page(build: (context) {
                      return pw.Center(
                        child: pw.Container(
                          width: 350,
                          padding: const pw.EdgeInsets.symmetric(vertical: 20),
                          decoration: pw.BoxDecoration(
                              image: pw.DecorationImage(
                            image: pw.MemoryImage(receiptByteList),
                            fit: pw.BoxFit.fill,
                          )),
                          child: pw.Column(
                            mainAxisSize: pw.MainAxisSize.min,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(left: 25.0),
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
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                itemCount: ReceiptPageNew.data.length,
                                separatorBuilder: (context, index) {
                                  return pw.Container(
                                    margin: const pw.EdgeInsets.symmetric(
                                        vertical: 14.0),
                                    color: const PdfColor.fromInt(0xFFC8C7CC),
                                    height: 0.5,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Text(
                                        ReceiptPageNew.data.keys
                                            .toList()[index],
                                        style: pw.TextStyle(
                                          fontSize: 16,
                                          color: const PdfColor.fromInt(
                                              0xFF99A3B3),
                                          fontWeight: pw.FontWeight.bold,
                                        ),
                                      ),
                                      pw.Text(
                                        ReceiptPageNew.data.values
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
                    }));

                    final bytes = await pdf.save();

                    final dir = await getApplicationDocumentsDirectory();
                    final file = File('${dir.path}/check.pdf');

                    await file.writeAsBytes(bytes);

                    // setState((){
                    //   isLoading = false;
                    // });
                    Share.shareXFiles(
                      [XFile(file.path)],
                      text: 'Check (${DateTime.now()}',
                    );
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
