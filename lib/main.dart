import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:flutter/services.dart';
import 'package:giahdooni/views/SuccessfulShopping_page.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:giahdooni/views/lastPage.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'package:giahdooni/views/pay_page.dart';
import 'package:giahdooni/views/profile_page.dart';
import 'package:giahdooni/views/signup_page.dart';
import 'package:giahdooni/views/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpGetIt();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff87BA67),
    statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SuccessfulShoppingPAge(),
    );
  }
}
