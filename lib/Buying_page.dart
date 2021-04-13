import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:giahdooni/home_page.dart';
import 'package:giahdooni/three_choises_page.dart';

class BuyingP extends StatefulWidget {
  BuyingP({this.imagePath});
  static String class_id = "BuyingP";

  @override
  _BuyingPState createState() => _BuyingPState();
  String imagePath;
}

int _countItem = 0;
int cupertinoColorSelectedItem = 0;
int cupertinoShapeSelectedItem = 0;
bool showColorCupertinoPicker = true;
bool showShapeCupertinoPicker = true;
String vaseColorFromeSpinner = "Choose color";
String vaseShapeFromeSpinner = "Choose shape";

class _BuyingPState extends State<BuyingP> {
  @override
  Widget build(BuildContext context) {
    void add() {
      setState(() {
        _countItem++;
      });
    }

    Widget showShapePicker() {
      return Padding(
        padding: EdgeInsets.only(top: 70),
        child: Container(
          color: Color(0xffAEFF7A),
          height: 200,
          child: CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (value) {
              cupertinoShapeSelectedItem = value;
              setState(() {
                cupertinoShapeSelectedItem = value;
                switch (cupertinoShapeSelectedItem) {
                  case 0:
                    vaseColorFromeSpinner = "Cylindrical";
                    break;
                  case 1:
                    vaseColorFromeSpinner = "globular";
                    break;
                  case 2:
                    vaseColorFromeSpinner = "Cubic";
                    break;
                }
              });
            },
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Brown'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('White'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Red'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Green'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Yellow'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Silver'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Blue'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('purpel'),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          print('uu');
                        },
                        child: Text('Close'),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget showColorPicker() {
      return Padding(
        padding: EdgeInsets.only(top: 70),
        child: Container(
          color: Color(0xffAEFF7A),
          height: 200,
          child: Hero(
            tag: 'btn1',
            child: CupertinoPicker(
              itemExtent: 50,
              onSelectedItemChanged: (value) {
                cupertinoColorSelectedItem = value;
                setState(() {
                  cupertinoColorSelectedItem = value;
                  switch (cupertinoColorSelectedItem) {
                    case 0:
                      vaseColorFromeSpinner = "Brown";
                      break;
                    case 1:
                      vaseColorFromeSpinner = "White";
                      break;
                    case 2:
                      vaseColorFromeSpinner = "Red";
                      break;
                    case 3:
                      vaseColorFromeSpinner = "Green";
                      break;
                    case 4:
                      vaseColorFromeSpinner = "Yellow";
                      break;
                    case 5:
                      vaseColorFromeSpinner = "Silver";
                      break;
                    case 6:
                      vaseColorFromeSpinner = "Blue";
                      break;
                    case 7:
                      vaseColorFromeSpinner = "Perple";
                      break;
                  }
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Brown'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('White'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Red'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Green'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Yellow'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Silver'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Blue'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('purpel'),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            print('uu');
                          },
                          child: Text('Close'),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    void minus() {
      setState(() {
        if (_countItem != 0) _countItem--;
      });
    }

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
                    Navigator.pushNamed(context, HomeP.class_id);
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Image.asset(
                    'images/ghashoghi.jpg',
                    height: 190,
                    width: 190,
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Text(
                  'Zamiifolia',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    minus();
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  backgroundColor: Color(0xff8ED362),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$_countItem',
                  style: TextStyle(fontSize: 40.0),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    add();
                  },
                  child: Icon(Icons.add, color: Colors.black),
                  backgroundColor: Color(0xff8ED362),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Vase color :',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '$vaseColorFromeSpinner',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      showColorCupertinoPicker = !showColorCupertinoPicker;
                    });
                  },
                )
              ],
            ),
            (showColorCupertinoPicker) ? Container() : showColorPicker(),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 27,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Vase shape :',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '$vaseColorFromeSpinner',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      showShapeCupertinoPicker = !showShapeCupertinoPicker;
                    });
                  },
                )
              ],
            ),
            (showColorCupertinoPicker) ? Container() : showShapePicker(),
          ],
        ),
      ),
    );
  }
}
