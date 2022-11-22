import 'package:flutter/material.dart';
import 'package:ui_test/shape_border.dart';
import 'last_reponsive_shape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReceiptPage(),
    );
  }
}

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        automaticallyImplyLeading: false,
        title: const Text('Kvitansiya'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Container(
          height: 500.0,
          width: double.infinity,
          // color: Colors.black,
          child: Container(
            height: 500.0,
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: const LastResponsiveShapeBorder(horizontalMargin: 10),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 6,
                ),
              ],
            ),
            child: const Icon(Icons.account_circle),
          ),
        ),
      ),
    );

    // CustomScrollView(
    //   slivers: [
    //     const ReceiptAppBar(),
    //     ReceiptBody(transfer: transfer),
    //   ],
    // );
  }
}

class ReceiptAppBar extends StatelessWidget {
  const ReceiptAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 8,
      pinned: true,
      expandedHeight: kToolbarHeight,
      automaticallyImplyLeading: false,
      title: const Text('Kvitansiya'),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

class ReceiptBody extends StatelessWidget {
  const ReceiptBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:  Container(
        height: 500.0,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: MyShapeBorder(),

          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 6,
            ),
          ],
        ),
        child: const Center(child: Text("My Button", style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
