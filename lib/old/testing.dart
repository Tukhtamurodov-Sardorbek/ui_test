// import 'package:flutter/material.dart';
//
// class TestPage extends StatelessWidget {
//   const TestPage({Key? key}) : super(key: key);
//
//
//   static const data = {
//     'Receipt number': '12332156654',
//     'Date': '01.09.2020 at 20:12',
//     'Sender': 'John Smith',
//     'From': '* 2333',
//     'Receiver': 'Tenge Bank',
//     'Address': 'London',
//     // 'New': 'data',
//     // 'To': 'check',
//     // 'Responsiveness': 'of',
//     // 'The': 'receipt',
//     'Others': '...',
//   };
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 340,
//           padding: const EdgeInsets.fromLTRB(21.5, 36, 21.44, 36),
//           decoration: const BoxDecoration(
//             // shape: BoxShape.circle,
//             color: Colors.red,
//               image: DecorationImage(
//                 image: AssetImage('assets/receipt_layout.png'),
//                 fit: BoxFit.fill,
//               ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(left: 25.0),
//                 child: Image(
//                   image: AssetImage('assets/logo.png'),
//                   height: 46,
//                   width: 120,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 color: const Color(0xFF2AA65C),
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: Column(
//                   children: const [
//                     Text(
//                       'Transfer completed successfully',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       '18 000 000 uzs',
//                       style: TextStyle(
//                         fontSize: 34,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 14),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 padding: const EdgeInsets.only(left: 15.0, right: 16.0),
//                 itemCount: TestPage.data.length,
//                 separatorBuilder: (context, index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(vertical: 14.0),
//                     color: const Color(0xFFC8C7CC),
//                     height: 0.5,
//                   );
//                 },
//                 itemBuilder: (context, index) {
//                   return Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         TestPage.data.keys.toList()[index],
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFF99A3B3),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         TestPage.data.values
//                             .toList()[index],
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFF071222),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   );
//                 },
//               ),
//               const SizedBox(height: 14),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// //
// // Widget a(){
// //   return pw.Center(
// //     child: pw.Container(
// //       width: 350,
// //       padding: const pw.EdgeInsets.symmetric(vertical: 20),
// //       decoration: pw.BoxDecoration(
// //           image: pw.DecorationImage(
// //         image: pw.MemoryImage(receiptByteList),
// //         fit: pw.BoxFit.fill,
// //       )),
// //       child: pw.Column(
// //         mainAxisSize: pw.MainAxisSize.min,
// //         crossAxisAlignment: pw.CrossAxisAlignment.start,
// //         children: [
// //           pw.Padding(
// //             padding: const pw.EdgeInsets.only(left: 25.0),
// //             child: pw.Image(
// //               pw.MemoryImage(logoByteList),
// //               height: 46,
// //               width: 120,
// //             ),
// //           ),
// //           pw.SizedBox(height: 10),
// //           pw.Container(
// //             height: 100,
// //             width: double.infinity,
// //             color: const PdfColor.fromInt(0xFF2AA65C),
// //             padding: const pw.EdgeInsets.symmetric(
// //                 vertical: 16.0),
// //             child: pw.Column(
// //               children: [
// //                 pw.Text(
// //                   'Transfer completed successfully',
// //                   style: pw.TextStyle(
// //                     fontSize: 16.0,
// //                     color: PdfColors.white,
// //                     fontWeight: pw.FontWeight.bold,
// //                   ),
// //                 ),
// //                 pw.SizedBox(height: 8.0),
// //                 pw.Text(
// //                   '18 000 000 uzs',
// //                   style: pw.TextStyle(
// //                     fontSize: 34,
// //                     color: PdfColors.white,
// //                     fontWeight: pw.FontWeight.bold,
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //           pw.SizedBox(height: 14),
// //           pw.ListView.separated(
// //             padding: const pw.EdgeInsets.symmetric(
// //                 horizontal: 16.0),
// //             itemCount: ReceiptPageNew.data.length,
// //             separatorBuilder: (context, index) {
// //               return pw.Container(
// //                 margin: const pw.EdgeInsets.symmetric(
// //                     vertical: 14.0),
// //                 color: const PdfColor.fromInt(0xFFC8C7CC),
// //                 height: 0.5,
// //               );
// //             },
// //             itemBuilder: (context, index) {
// //               return pw.Row(
// //                 mainAxisAlignment:
// //                     pw.MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   pw.Text(
// //                     ReceiptPageNew.data.keys
// //                         .toList()[index],
// //                     style: pw.TextStyle(
// //                       fontSize: 16,
// //                       color: const PdfColor.fromInt(
// //                           0xFF99A3B3),
// //                       fontWeight: pw.FontWeight.bold,
// //                     ),
// //                   ),
// //                   pw.Text(
// //                     ReceiptPageNew.data.values
// //                         .toList()[index],
// //                     style: pw.TextStyle(
// //                       fontSize: 16,
// //                       color: const PdfColor.fromInt(
// //                           0xFF071222),
// //                       fontWeight: pw.FontWeight.bold,
// //                     ),
// //                   )
// //                 ],
// //               );
// //             },
// //           ),
// //           pw.SizedBox(height: 14),
// //         ],
// //       ),
// //     ),
// //   );
// // }
