import 'package:flutter/material.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:giahdooni/models/plant.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  Plant plant;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => getIt<HomePageViewModel>(),
      builder: (context, model, _) => Scaffold(
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
                    print('Search Term is : $value');
                    plant = await model.getPlantFormDB(value);
                    print('Plant from firebase is : $plant');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
