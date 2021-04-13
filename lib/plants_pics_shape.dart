import 'package:flutter/material.dart';
import 'package:giahdooni/three_choises_page.dart';

class Plants_pics_shape extends StatelessWidget {
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
                        Three_choises_p(imageAddress: 'images/zamofilia.jpg')));
              },
              icon: Image.asset('images/zamofilia.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Zamiifolia',
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
                        Three_choises_p(imageAddress: 'images/petuus.jpg')));
              },
              icon: Image.asset('images/petuus.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'pothos',
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
                        Three_choises_p(imageAddress: 'images/bent.jpg')));
              },
              icon: Image.asset('images/bent.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              '''Euphorbia
pulcherrima''',
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
                        Three_choises_p(imageAddress: 'images/anjiri.jpg')));
              },
              icon: Image.asset('images/anjiri.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Swiss cheese',
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
                        Three_choises_p(imageAddress: 'images/radiator.jpg')));
              },
              icon: Image.asset('images/radiator.jpg'),
              iconSize: 170,
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              'Peperomia',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
