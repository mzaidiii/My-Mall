import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:practice/screens/loginPage.dart';

class Frontpage extends StatefulWidget {
  @override
  State<Frontpage> createState() {
    return _Frontpage();
  }
}

class _Frontpage extends State<Frontpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Mall Partner',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/hello.json'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => Loginpage()),
                );
              },
              label: Text('Lets Start'),
              icon: Icon(Icons.shopping_bag),
            )
          ],
        ),
      ),
    );
  }
}
