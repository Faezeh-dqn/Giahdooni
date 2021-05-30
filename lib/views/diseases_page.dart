import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/viewmodels/diseases_page_viewmodel.dart';
import 'package:giahdooni/views/aboutDiseases.dart';
import 'package:stacked/stacked.dart';

import '../service_locator.dart';
import 'choosing_page.dart';

class DiseasesPage extends StatelessWidget {
  Plant plant;
  DiseasesPage({@required this.plant});
  build(BuildContext context) {
    return ViewModelBuilder<DiseasesPageViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => getIt<DiseasesPageViewModel>(),
        onModelReady: (model) => model.getDiseasesFromDB(plant.id),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 340),
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.to(
                            ChoosingPage(
                              plant: plant,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 220),
                      child: Text(
                        'Diseases :',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('${plant.imagePath}'),
                      radius: 130,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: model.diseases.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                width: 360,
                                height: 55,
                                child: RaisedButton(
                                  elevation: 0,
                                  color: Color(0xff8ED362),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  onPressed: () {
                                    print(
                                        'diseases is : ${model.diseases[index]}');
                                    Get.to(() => AboutDiseasesPage(
                                          diseases: model.diseases[index],
                                          plant: plant,
                                        ));
                                  },
                                  child: Text(
                                    model.diseases[index].disease,
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        letterSpacing: 0.4),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
