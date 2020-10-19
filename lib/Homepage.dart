import 'package:firebase_login/auth_helper.dart';
import 'package:firebase_login/helper.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/fir-1-6cca1.appspot.com/o/p2.jpg?alt=media&token=4a5660e2-260a-4203-9dd8-75d899c24fc2"),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/fir-1-6cca1.appspot.com/o/s4.jpg?alt=media&token=c45736ce-c830-4e1e-b4dd-b9dd7572fb83"),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: "Log Out",
              colour: Colors.blue,
              onPressed: () {
                AuthHelper.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
