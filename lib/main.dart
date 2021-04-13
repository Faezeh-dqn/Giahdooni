import 'package:flutter/material.dart';
import 'package:giahdooni/Buying_page.dart';
import 'package:giahdooni/Introduction_page.dart';
import 'package:giahdooni/home_page.dart';
import 'package:giahdooni/signup_page.dart';
import 'package:giahdooni/three_choises_page.dart';
import 'start_page.dart';
import 'signIn_page.dart';
import 'Buying_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeP.class_id,
      routes: {
        BuyingP.class_id: (context) => BuyingP(),
        HomeP.class_id: (context) => HomeP(),
        Sign_in_p.class_id: (context) => Sign_in_p(),
        Sign_up_p.class_id: (context) => Sign_up_p(),
        StartPage.class_id: (context) => StartPage(),
        Intro_p.class_id: (context) => Intro_p(),
      },
    );
  }
}
