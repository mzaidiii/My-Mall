import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() {
    return _Loginpage();
  }
}

class _Loginpage extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Lottie.asset('assets/login.json'),
            const SizedBox(
              height: 16,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(label: Text('Username')),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Password'),
                      ),
                      obscureText: true,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
