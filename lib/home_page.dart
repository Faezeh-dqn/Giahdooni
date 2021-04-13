import 'package:flutter/material.dart';
import 'package:giahdooni/Buying_page.dart';
import 'plants_pics_shape.dart';
import 'moreplant.dart';
import 'three_choises_page.dart';

class HomeP extends StatefulWidget {
  static String class_id = "HomeP";
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  final ScrollController _scrollController = ScrollController();
  bool shouldShowMore = false;
  bool showButton = true;
  int selectedItem = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  width: 385,
                  height: 40,
                  child: TextField(
                    textAlignVertical: TextAlignVertical(y: 1),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      fillColor: Color(0xffE5E5E5),
                      filled: true,
                      hintText: 'Search your plant here',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 55,
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedItem = value;
              print('$selectedItem');
            });
            switch (selectedItem) {
              case 0:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BuyingP()));
                ;
                break;
              case 1:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Moreplant()));
                break;
              case 2:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Plants_pics_shape()));
                break;
            }
          },
          backgroundColor: Color(0xff466731),
          selectedItemColor: Color(0xff8ED362),
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home, color: Colors.white),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.shopping_basket, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 207),
                child: Text(
                  'Suggestions:',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 40),
              ListView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Plants_pics_shape()
                ],
              ),
              !showButton
                  ? SizedBox(
                      height: 1,
                    )
                  : RaisedButton(
                      elevation: 0,
                      onPressed: () {
                        shouldShowMore = !shouldShowMore;
                        setState(() {
                          showButton = !showButton;
                        });
                      },
                      child: Text(
                        'More',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
              (shouldShowMore)
                  ? moreItem(context)
                  : Container(
                      height: 2,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moreItem(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Container(
      child: Column(
        children: [
          ListView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [Moreplant()],
          ),
        ],
      ),
    );
  }
}
