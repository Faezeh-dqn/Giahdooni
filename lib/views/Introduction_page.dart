import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/views/choosing_page.dart';

class Intro_p extends StatelessWidget {
  final String imageAssetPath;
  final String name;

  Intro_p({
    @required this.imageAssetPath,
    @required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, right: 340),
              child: IconButton(
                iconSize: 32,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.to(
                    ChoosingPage(
                      imageName: name,
                      imagePath: imageAssetPath,
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Container(
                    child: Image.asset(
                      '$imageAssetPath',
                      height: 290,
                      width: 290,
                    ),
                  ),
                ),
                /*Text(
                  '$name',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
