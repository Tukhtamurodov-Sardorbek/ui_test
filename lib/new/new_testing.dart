import 'package:flutter/material.dart';

class NewTestPage extends StatelessWidget {
  const NewTestPage({Key? key}) : super(key: key);


  static const data = {
    'Receipt number': '12332156654',
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 340,
            color: Colors.red,
            padding: const EdgeInsets.fromLTRB(21.5, 36, 21.44, 36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/top_border.png',
                  height: 20,
                ),
                const SizedBox(height: 4),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '18 000 000 uzs',
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 15.0, right: 16.0),
                  itemCount: NewTestPage.data.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 14.0),
                      color: const Color(0xFFC8C7CC),
                      height: 0.5,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NewTestPage.data.keys.toList()[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF99A3B3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          NewTestPage.data.values
                              .toList()[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF071222),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(height: 14),
                Image.asset('assets/bottom_border.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

