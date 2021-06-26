import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/views/signup_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 4), () {
    // Get.toEnd(() => SignUpPage());
    //  });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.5,
                0.7,
                0.9
              ],
              colors: [
                Color(0xff8ED362),
                Color(0xffBEDCAA),
                Color(0xffCFE1C4),
                Color(0xffDFE4DC)
              ]),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 190),
              child: Image.asset(
                'images/giahh.png',
                width: 200,
                height: 200,
              ),
            ),
            Text(
              'Giah Dooni',
              style: TextStyle(
                  fontSize: 62,
                  color: Color(0xff5D8841),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 80,
            ),
            RaisedButton(
              onPressed: () {
                Get.to(SignUpPage());
              },
              child: Text(
                'Start',
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.black54,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
