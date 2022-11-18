import 'package:flutter/material.dart';
import 'package:ui_test/shape_border.dart';

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
      home: ReceiptPage(),
    );
  }
}
class ReceiptPage extends StatelessWidget {

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Container(
            height: 500.0,
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: MyShapeBorder(),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Icon(Icons.account_circle),
          ),
        ),
      ),
    );
  }
}