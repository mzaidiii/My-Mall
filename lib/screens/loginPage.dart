import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() {
    return _Loginpage();
  }
}

class _Loginpage extends State<Loginpage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    String user = username.text.trim();
    String pass = password.text.trim();
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('login successul '),
      ),
    );
  }

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
                      decoration: InputDecoration(label: Text('Email Address')),
                      controller: username,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Password'),
                      ),
                      controller: password,
                      obscureText: true,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: login,
              child: Text('LOGIN'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('New Login? '),
                TextButton(onPressed: () {}, child: Text('Register.'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
