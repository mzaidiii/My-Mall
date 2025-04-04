import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/screens/MainScreen.dart';
import 'package:practice/screens/rejister.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _Firebase = FirebaseAuth.instance;

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() {
    return _Loginpage();
  }
}

class _Loginpage extends State<Loginpage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    String user = username.text.trim();
    String pass = password.text.trim();
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }
    try {
      await _Firebase.signInWithEmailAndPassword(email: user, password: pass);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => Mainscreen()),
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-alredry-in-use') {
        return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed'),
        ),
      );
    }
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
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => Rejister()),
                      );
                    },
                    child: Text('Register.'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
