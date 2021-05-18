import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'Buying_page.dart';
import 'Introduction_page.dart';
import 'home_page.dart';

class ChoosingPage extends StatelessWidget {
  ChoosingPage({
    this.imagePath,
    this.imageName,
    this.plantPrice,
    this.about,
  });
  String imagePath;
  String imageName;
  int plantPrice;
  String about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, right: 320),
              child: IconButton(
                color: Colors.black,
                iconSize: 33,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.to(() => MenuPage());
                },
              ),
            ),
            Container(
              child: Image.asset(
                '$imagePath',
                height: 330,
                width: 330,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                height: 70,
                width: 250,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Get.to(
                      Intro_p(
                        imageAssetPath: imagePath,
                        name: imageName,
                        about: about,
                      ),
                    );
                  },
                  color: Color(0xff8ED362),
                  child: Text(
                    'Introduction',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                height: 70,
                width: 250,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Get.to(() => BuyingPage(
                          imagePath: imagePath,
                          imageName: imageName,
                          plantPrice: plantPrice,
                        ));
                  },
                  color: Color(0xff8ED362),
                  child: Text(
                    'Buy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                height: 70,
                width: 250,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    print('okay');
                  },
                  color: Color(0xff8ED362),
                  child: Text(
                    'Diseases',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
