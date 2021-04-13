import 'package:flutter/material.dart';
import 'three_choises_page.dart';

class Moreplant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Three_choises_p(imageAddress: 'images/nakhl.jpg')));
              },
              icon: Image.asset('images/nakhl.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              '''Madagascar
 palm''',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Three_choises_p(imageAddress: 'images/aglo.jpg')));
              },
              icon: Image.asset('images/aglo.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Aglaonema',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Three_choises_p(imageAddress: 'images/hosn.jpg')));
              },
              icon: Image.asset('images/hosn.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Solenostemon',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Three_choises_p(imageAddress: 'images/sansoria.jpg')));
              },
              icon: Image.asset('images/sansoria.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Sansevieria',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
