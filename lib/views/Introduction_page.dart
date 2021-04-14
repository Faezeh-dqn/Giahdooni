import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/views/three_choises_page.dart';

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
              padding: EdgeInsets.only(top: 30, right: 340),
              child: IconButton(
                iconSize: 32,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.to(
                    Three_choises_p(
                      imageName: name,
                      imageAddress: imageAssetPath,
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Image.asset(
                    '$imageAssetPath',
                    height: 190,
                    width: 190,
                  ),
                ),
                Text(
                  '$name',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
