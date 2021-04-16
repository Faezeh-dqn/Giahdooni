import 'package:flutter/material.dart';

import 'Buying_page.dart';
import 'Introduction_page.dart';
import 'home_page.dart';

class Three_choises_p extends StatelessWidget {
  Three_choises_p({@required this.imageAddress, @required this.imageName});
  String imageAddress;
  String imageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35, right: 320),
              child: IconButton(
                color: Colors.black,
                iconSize: 33,
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700)),
                child: Image.asset(
                  '$imageAddress',
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Container(
                height: 70,
                width: 250,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {},
                  color: Color(0xff4A6934),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {},
                  color: Color(0xff4A6934),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    print('okay');
                  },
                  color: Color(0xff4A6934),
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
