import 'package:flutter/material.dart';
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
                          ? Center(
                              child: Text(
                                'Couldnt find any plants',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          : Center(
                              child: Text(
                                'Search for plants ... ',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
