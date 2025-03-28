import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/model/singnUp.dart';
import 'package:practice/widget/firestore_Work.dart';

final _firebase = FirebaseAuth.instance;

class Rejister extends StatefulWidget {
  Rejister({
    super.key,
  });

  @override
  State<Rejister> createState() => _RejisterState();
}

class _RejisterState extends State<Rejister> {
  TextEditingController name = TextEditingController();

  TextEditingController mail = TextEditingController();

  TextEditingController number = TextEditingController();

  TextEditingController company = TextEditingController();

  TextEditingController addres = TextEditingController();

  TextEditingController gst = TextEditingController();

  TextEditingController pass = TextEditingController();

  void register() async {
    if (name.text.isEmpty ||
        mail.text.isEmpty ||
        number.text.isEmpty ||
        company.text.isEmpty ||
        addres.text.isEmpty ||
        gst.text.isEmpty ||
        pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      await _firebase.createUserWithEmailAndPassword(
        email: mail.text,
        password: pass.text,
      );

      Singnup newUser = Singnup(
        name: name.text,
        gmail: mail.text,
        phoneNumber: number.text,
        company: company.text,
        address: addres.text,
        gst: gst.text,
      );
      FirestoreWork firestore = FirestoreWork();
      await firestore.createUser(newUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Name'),
                  ),
                  controller: name,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Email Address'),
                  ),
                  controller: mail,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Phone number '),
                  ),
                  controller: number,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Company Name'),
                  ),
                  controller: company,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Company Address'),
                  ),
                  controller: addres,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('GST number '),
                  ),
                  controller: gst,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Password'),
                  ),
                  controller: pass,
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: register,
                child: Text('register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
