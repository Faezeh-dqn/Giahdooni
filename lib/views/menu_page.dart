import 'package:flutter/material.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:giahdooni/views/orders_page.dart';
import 'package:giahdooni/views/profile_page.dart';
import 'package:giahdooni/views/searchBar_page.dart';



class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedPage = 1;
  int currentIndex = 0;
  final _pageOptions = [
    ProfilePage(),
    HomePage(),
    OrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: (selectedPage == 0)
                    ? Colors.green.shade900
                    : Colors.white54),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: (selectedPage == 1)
                    ? Colors.green.shade900
                    : Colors.white54),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket,
                color: (selectedPage == 2)
                    ? Colors.green.shade900
                    : Colors.white54),
            label: 'Orders',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        backgroundColor: Color(0xff8ED362),
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
