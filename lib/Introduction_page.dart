import 'package:flutter/material.dart';
import 'package:giahdooni/three_choises_page.dart';

class Intro_p extends StatelessWidget {
  Intro_p(
      {@required this.imageForIntroduction,
      @required this.imageNameForIntroduction});
  String imageForIntroduction;
  String imageNameForIntroduction = 'Zamifolia';
  @override
  static String class_id = "Intro_p";
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Three_choises_p(
                              imageName: imageNameForIntroduction,
                              imageAddress: imageForIntroduction,
                            )));
                  }),
            ),
            Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Image.asset(
                    '$imageForIntroduction',
                    height: 190,
                    width: 190,
                  ),
                ),
                Text(
                  '$imageNameForIntroduction',
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
