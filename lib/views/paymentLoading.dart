import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:get/get.dart';
import 'package:giahdooni/views/paymentGetaway.dart';

class PaymentLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => PaymentGatewayPage()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 320,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'You will soon be transferred to a payment port...',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Image(
              width: 73,
              height: 73,
              image: AssetImage("images/sending.gif"),
            ),
          ],
        ),
      ),
    );
  }
}
