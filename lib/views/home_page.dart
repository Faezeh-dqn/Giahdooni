import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:giahdooni/views/Buying_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giahdooni/views/orders_page.dart';
import 'package:giahdooni/views/searchBar_page.dart';
import 'package:giahdooni/views/signup_page.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String nameForSearch;
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel()..init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              width: 392,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Get.to(SearchBarPage());
                },
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search your plant',
                      style: TextStyle(letterSpacing: 0.9, fontSize: 16),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 330),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 207),
                child: Text(
                  'Suggestionss:',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, itemCount) {
                    return Column(
                      children: [
                        PlantsList(
                          plantName: model.plant0.name,
                          plantPath: model.plant0.imagePath,
                          plantPrice: model.plant0.price,
                          about: model.plant0.about,
                        ),
                        PlantsList(
                          plantName: model.plant1.name,
                          plantPath: model.plant1.imagePath,
                          plantPrice: model.plant1.price,
                          about: model.plant1.about,
                        ),
                        PlantsList(
                            plantName: model.plant2.name,
                            plantPath: model.plant2.imagePath,
                            plantPrice: model.plant2.price,
                            about: model.plant2.about),
                        PlantsList(
                            plantName: model.plant3.name,
                            plantPath: model.plant3.imagePath,
                            plantPrice: model.plant3.price,
                            about: model.plant3.about),
                        PlantsList(
                            plantName: model.plant4.name,
                            plantPath: model.plant4.imagePath,
                            plantPrice: model.plant4.price,
                            about: model.plant4.about),
                        PlantsList(
                            plantName: model.plant5.name,
                            plantPath: model.plant5.imagePath,
                            plantPrice: model.plant5.price,
                            about: model.plant5.about),
                        PlantsList(
                            plantName: model.plant6.name,
                            plantPath: model.plant6.imagePath,
                            plantPrice: model.plant6.price,
                            about: model.plant6.about),
                        PlantsList(
                            plantName: model.plant7.name,
                            plantPath: model.plant7.imagePath,
                            plantPrice: model.plant7.price,
                            about: model.plant7.about),
                        PlantsList(
                            plantName: model.plant8.name,
                            plantPath: model.plant8.imagePath,
                            plantPrice: model.plant8.price,
                            about: model.plant8.about),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlantsList extends StatelessWidget {
  @override
  PlantsList({
    @required this.plantName,
    @required this.plantPath,
    @required this.plantPrice,
    @required this.about,
  });
  String plantName;
  String plantPath;
  int plantPrice;
  String about;

  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(() => ChoosingPage(
                  imagePath: plantPath,
                  imageName: plantName,
                  plantPrice: plantPrice,
                  about: about,
                ));
          },
          iconSize: 170,
          icon: Image.asset('$plantPath'),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '$plantName',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
