import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/search_bar_view_model.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:stacked/stacked.dart';

class SearchBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchBarPageViewModel>.reactive(
      viewModelBuilder: () => getIt<SearchBarPageViewModel>(),
      disposeViewModel: false,
      builder: (context, model, _) {
        if (model.isBusy) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    autofocus: true,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '  Search...',
                      hintStyle: TextStyle(fontSize: 18, wordSpacing: 0.9),
                    ),
                    onSubmitted: (value) async {
                      model.getPlantFormDB(value);
                    },
                  ),
                  model.plantToShow != null
                      ? PlantCard(plant: model.plantToShow)
                      : model.hasCalledApi
                          ? Padding(
                              padding: EdgeInsets.only(top: 120),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                  height: 70,
                                  width: 360,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      left: 10,
                                    ),
                                    child: Text(
                                      'There is no such plant,or maybe you enter the wrong name!',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(child: Container()),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
