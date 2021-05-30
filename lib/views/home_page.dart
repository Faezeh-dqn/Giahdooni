import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:giahdooni/views/searchBar_page.dart';
import 'package:giahdooni/views/signup_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  Plant plant;
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String nameForSearch;
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<HomePageViewModel>(),
      onModelReady: (model) => model.getPlantFromDBToSuggest(1),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Container(
                width: 392,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Get.to(SearchBarPage());
                  },
                  color: Colors.grey.shade300,
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
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
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
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.plantsToSuggest.length,
                  itemBuilder: (context, index) {
                    return PlantCard(plant: model.plantsToSuggest[index]);
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

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({
    @required this.plant,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(
              () => ChoosingPage(
                plant: plant,
              ),
            );
          },
          iconSize: 170,
          icon: Image.asset('${plant.imagePath}'),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${plant.name}',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
