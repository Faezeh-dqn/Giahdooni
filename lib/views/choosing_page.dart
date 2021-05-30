import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/diseases.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/viewmodels/diseases_page_viewmodel.dart';
import 'package:giahdooni/views/diseases_page.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'package:stacked/stacked.dart';
import '../service_locator.dart';
import 'Buying_page.dart';
import 'Introduction_page.dart';
import 'home_page.dart';

class ChoosingPage extends StatelessWidget {
  final Plant plant;
  List<Diseases> diseases;
  ChoosingPage({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiseasesPageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<DiseasesPageViewModel>(),
      builder: (context, model, child) => Scaffold(
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
              CircleAvatar(
                backgroundImage: AssetImage('${plant.imagePath}'),
                radius: 150,
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
                          plant: plant,
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
                      Get.to(() => BuyingPage(plant: plant));
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
                    onPressed: () async {
                      diseases = await model.getDiseasesFromDB(plant.id);
                      print(
                        'diseases :$diseases',
                      );
                      print('plant id is : ${plant.id}');

                      await Get.to(() => DiseasesPage(
                            plant: plant,
                          ));
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
      ),
    );
  }
}
